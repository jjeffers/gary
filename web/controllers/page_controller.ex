defmodule Gary.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    text conn, "Hello, I am very <rolls dice> - happy to meet you!"
  end

  def create(conn, _params) do
  	
  	webhook_url = System.get_env("SLACK_WEBHOOK_URL")
  	IO.puts webhook_url
  	if System.get_env("SLACK_ENV") == "production" do
  		:ssl.start()
  		:ibrowse.start()
  		
  		
    	HTTPotion.post(webhook_url, JSON.encode!(%{text: "African or European?"}), 
    		["Content-Type": "application/json"])
    end

    text conn, "thanks!"

  end

end
