defmodule GithubStatsWeb.UsersView do
  use GithubStatsWeb, :view

  alias GithubStats.User

  def render("create.json", %{user: %User{} = user, token: token}) do
    %{
      message: "User created!",
      user: user,
      token: token
    }
  end
end
