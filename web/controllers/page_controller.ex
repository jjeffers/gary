defmodule Gary.PageController do
  use Gary.Web, :controller

  plug :action

  def index(conn, _params) do
    text conn, "Hello, I'm Gary!"
  end

  def send_slack_response(reply) do

    if System.get_env("SLACK_ENV") == "production" do

      :ssl.start()
      :ibrowse.start()
      
      webhook_url = System.get_env("SLACK_WEBHOOK_URL")

      HTTPotion.post(webhook_url, JSON.encode!(reply), 
        ["Content-Type": "application/json"])

      "ok"
    else
      JSON.encode!(reply)
    end

  end

  def handle_gary_request(%{"text" => "gary say hello"}) do
    %{text: "Hello, it's <rolls dice> nice to meet you."}
  end

  def handle_gary_request(%{"text" => "gary when is the next outdoor encounter?"}) do
    %{
      fallback: "The next encounter will occur in: (unihabited/sparse/dense)",
      pretext: "The next encounter will occur in: (unihabited/sparse/dense)",
      color: "good",
      fields: Gary.OutdoorTiming.next_encounter_fields 
    }
  end

  def handle_gary_request(%{"text" => "gary generate an outdoor encounter"}) do
    %{
      fallback: "Outdoor encounter!",
      pretext: "Outdoor encounter!",
      color: "good",
      fields: Gary.OutdoorEncounter.generate_encounter_fields 
    }
  end

  def handle_gary_request(_params) do
    %{text: "African or European?"}
  end

  def create(conn, _params) do

    response_text = handle_gary_request(_params)
    text conn, send_slack_response(response_text)
      
  end
  
end
