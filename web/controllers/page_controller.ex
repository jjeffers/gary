defmodule Gary.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    text conn, "Hello, I'm Gary!"
  end

  def send_slack_response(reply_text) do

    if System.get_env("SLACK_ENV") == "production" do

      :ssl.start()
      :ibrowse.start()
      
      webhook_url = System.get_env("SLACK_WEBHOOK_URL")

      HTTPotion.post(webhook_url, JSON.encode!(%{text: reply_text}), 
        ["Content-Type": "application/json"])

      "ok"
    else
      reply_text
    end

  end


  def handle_gary_request(%{"text" => "gary say hello"}) do
    "Hello, it's <rolls dice> nice to meet you."
  end

  def handle_gary_request(_params) do
    "African or European?"
  end

  def create(conn, _params) do

    response_text = handle_gary_request(_params)
    text conn, send_slack_response(response_text)
      
  end

end
