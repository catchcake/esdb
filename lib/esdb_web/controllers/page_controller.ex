defmodule EsdbWeb.PageController do
  use EsdbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
