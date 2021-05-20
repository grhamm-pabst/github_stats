defmodule GithubStatsWeb.FallbackController do
  use GithubStatsWeb, :controller

  alias GithubStats.Error
  alias GithubStatsWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
