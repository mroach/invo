defmodule InvoWeb.PageController do
  use InvoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
