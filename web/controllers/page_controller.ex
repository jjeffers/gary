defmodule Gary.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    text conn, "Hello, I am very <rolls dice> - happy to meet you!"
  end

  def create(conn, _params) do

  	:ssl.start()
  	:ibrowse.start()
  	webhook_url = "https://hooks.slack.com/services/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"

    HTTPotion.post(webhook_url, JSON.encode!(%{text: "African or European?"}), 
    	["Content-Type": "application/json"])

  	conn
  	|> put_status(200)

  end

end
