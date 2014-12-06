defmodule Gary.PageController do
  use Phoenix.Controller

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

  def handle_gary_request(%{"text" => "gary when is the next encounter?"}) do
    %{
    	fallback: "The next encounter will occur in:",
    	color: "good",
    	fields: encounter_fields 
    }
  end

  def encounter_fields do
    [elem(Dicer.roll("1d20"), 2)
    |> next_forest_marsh_encounter]
  end
    
  def next_forest_marsh_encounter(roll) do
  	%{ 
  		title: "forest/marsh (unihabited/sparse/dense)",
  	  value: case roll do
	  		1	-> "1 period/1 period/1 period"
	    	2 -> "1 period/1 period/2 periods"
	    	3 -> "2 periods/2 period/3 periods"
	    	4 -> "2 periods/3 periods/4 periods"
	    	5	-> "3 period2/3 period/5 periods"
	    	6 -> "4 periods/4 period/1 day 1 period"
	    	7 -> "4 periods/5 periods/1 day 2 periods"
	    	8 -> "5 periods/1 day/1 day 4 periods"
	    	9 -> "1 day/1 day 1 period/1 day 5 periods"
	    	_ -> "There will never be another encounter."

	    end,
	    short: "true"
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
