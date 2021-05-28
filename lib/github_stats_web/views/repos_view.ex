defmodule GithubStatsWeb.ReposView do
  use GithubStatsWeb, :view

  alias GithubStats.Github.RepoInfo

  def render("repo.json", %{repos: [%RepoInfo{} | _tail] = repos, token: token}) do
    %{
      repos: repos,
      token: token
    }
  end
end
