defmodule GithubStats.Github.Client do
  use Tesla

  alias GithubStats.Error
  alias GithubStats.Github.RepoInfo
  alias Tesla.Env

  @base_url "https://api.github.com/users"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"user-agent", "Tesla"}]

  def get_repos(url \\ @base_url, username) do
    "#{url}/#{username}/repos"
    |> get()
    |> handle_get()
  end

  def handle_get({:ok, %Env{status: 200, body: result}}) do
    {:ok, parse(result)}
  end

  def handle_get({:ok, %Env{status: 404}}) do
    {:error, Error.build(:not_found, "User not found!")}
  end

  def handle_get({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end

  def parse(list) do
    Enum.map(list, fn line -> cast(line) end)
  end

  def cast(%{
        "id" => id,
        "name" => name,
        "description" => description,
        "html_url" => html_url,
        "stargazers_count" => stargazers_count
      }) do
    RepoInfo.build(id, name, description, html_url, stargazers_count)
  end
end
