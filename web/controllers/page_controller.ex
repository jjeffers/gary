defmodule Gary.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    text conn, "Hello, I am very <rolls dice> - happy to meet you!"
  end

  def create(conn, _params) do
  	json conn, JSON.encode!(%{text: "This would a post response for Slack."})
  end

end
