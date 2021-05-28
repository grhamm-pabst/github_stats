defmodule GithubStatsWeb.ReposController do
  use GithubStatsWeb, :controller

  alias GithubStats.Github.Client
  alias GithubStats.Github.RepoInfo

  alias GithubStatsWeb.FallbackController

  alias GithubStatsWeb.Auth.Guardian

  action_fallback FallbackController

  def show(%Plug.Conn{private: %{:guardian_default_token => token}} = conn, %{"name" => name}) do
    with {:ok, [%RepoInfo{} | _tail] = repos} <- Client.get_repos(name),
         {:ok, _old_stuff, {new_token, _new_claims}} <-
           Guardian.refresh(token, ttl: {1, :minute}) do
      conn
      |> put_status(:ok)
      |> render("repo.json", repos: repos, token: new_token)
    end
  end
end
