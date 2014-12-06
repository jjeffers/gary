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

    def next_forest_marsh_encounter(roll) do
  	%{ 
  		title: "forest/marsh",
  	  value: case roll do
	  		1	-> "1 period/1 period/1 period"
	    	2 -> "1 period/1 period/2 periods"
	    	3 -> "2 periods/2 period/3 periods"
	    	4 -> "2 periods/3 periods/4 periods"
	    	5	-> "3 periods/3 period/5 periods"
	    	6 -> "4 periods/4 period/1 day 1 period"
	    	7 -> "4 periods/5 periods/1 day 2 periods"
	    	8 -> "5 periods/1 day/1 day 4 periods"
	    	9 -> "1 day/1 day 1 period/1 day 5 periods"
	    	10 -> "1 day 1 period/1 day 2 periods/2 days 1 period"
	    	11 -> "1 day 2 periods/1 day 3 periods/2 days 3 periods"
	    	12 -> "1 day 3 periods/1 day 4 periods/2 days 5 periods"
	    	13 -> "1 day 4 periods/2 days/3 days 2 periods"
	    	14 -> "1 day 5 periods/2 days 1 period/3 days 4 periods"
	    	15 -> "2 days 1 period/2 days 3 periods/4 days 2 periods"
	    	16 -> "2 days 3 periods/3 days/5 days"
	    	17 -> "2 days 5 periods/3 days 3 periods/5 days 4 periods"
	    	18 -> "3 days 2 periods/4 days/6 days 5 periods"
	    	19 -> "4 days 1 period/5 days/8 days 3 periods"
	    	20 -> "6 days/7 days 1 period/12 days"
	    end,
	    short: "false"
	  }
  end

  def next_scrub_encounter(roll) do
  	%{ 
  		title: "scrub",
  	  value: case roll do
	  		1	-> "1 period/1 period/1 period"
	    	2 -> "2 period/2 periods/3 periods"
	    	3 -> "2 periods/3 period/4 periods"
	    	4 -> "3 periods/4 periods/1 day"
	    	5	-> "4 periods/5 period/1 day 2 periods"
	    	6 -> "5 periods/1 day/1 day 2 periods"
	    	7 -> "1 day/1 day 1 period/2 days"
	    	8 -> "1 day 1 period/1 day 3 periods/2 days 2 periods"
	    	9 -> "1 day 3 periods/1 day 4 periods/2 days 5 periods"
	    	10 -> "1 day 4 periods/2 days/3 days 2 periods"
	    	11 -> "1 day 5 periods/2 days 2 periods/3 days 4 periods"
	    	12 -> "2 days 1 period/2 day 3 periods/4 days 2 periods"
	    	13 -> "2 days 3 periods/3 days/4 days 5 periods"
	    	14 -> "2 days 3 periods/3 days 2 periods/5 days 4 periods"
	    	15 -> "3 days 1 period/3 days 5 periods/6 days 3 periods"
	    	16 -> "3 days 4 periods/4 days 3 periods/7 days 2 periods"
	    	17 -> "4 days 2 periods/5 days 1 period/8 days 4 periods"
	    	18 -> "4 days 1 period/6 days 1 period/10 days 2 periods"
	    	19 -> "6 days 2 periods/7 days 4 periods/12 days 5 periods"
	    	20 -> "9 days/10 days 5 perioda/18 days 1 period"
	    end,
	    short: "false"
	  }
  end


  def handle_gary_request(%{"text" => "gary say hello"}) do
    %{text: "Hello, it's <rolls dice> nice to meet you."}
  end

  def handle_gary_request(%{"text" => "gary when is the next encounter?"}) do
    %{
    	fallback: "The next encounter will occur in: (unihabited/sparse/dense)",
    	pretext: "The next encounter will occur in: (unihabited/sparse/dense)",
    	color: "good",
    	fields: encounter_fields 
    }
  end



  def handle_gary_request(_params) do
    %{text: "African or European?"}
  end

  def encounter_fields do
  	[next_forest_marsh_encounter(elem(Dicer.roll("1d20"),2)), 
  	 next_scrub_encounter(elem(Dicer.roll("1d20"),2))]
  end
    


  def create(conn, _params) do

    response_text = handle_gary_request(_params)
    text conn, send_slack_response(response_text)
      
  end

  
end
