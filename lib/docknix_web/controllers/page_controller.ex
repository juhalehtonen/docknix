defmodule DocknixWeb.PageController do
  use DocknixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
