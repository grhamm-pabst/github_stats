defmodule GithubStatsWeb.ReposController do
  use GithubStatsWeb, :controller

  alias GithubStats.Github.Client
  alias GithubStats.Github.RepoInfo

  alias GithubStatsWeb.FallbackController

  action_fallback FallbackController

  def show(conn, %{"name" => name}) do
    with {:ok, [%RepoInfo{} | _tail] = repos} <- Client.get_repos(name) do
      conn
      |> put_status(:ok)
      |> render("repo.json", repos: repos)
    end
  end
end
