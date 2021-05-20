defmodule GithubStatsWeb.ReposView do
  use GithubStatsWeb, :view

  alias GithubStats.Github.RepoInfo

  def render("repo.json", %{repos: [%RepoInfo{} | _tail] = repos}) do
    %{
      repos: repos
    }
  end
end
