defmodule Gary.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, _params) do
  	json conn, JSON.encode!(%{text: "Hello, I am very <rolls dice> - happy to see you!"})
  end

end
