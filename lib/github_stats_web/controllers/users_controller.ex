defmodule GithubStatsWeb.UsersController do
  use GithubStatsWeb, :controller

  alias GithubStatsWeb.FallbackController

  alias GithubStatsWeb.Auth.Guardian

  alias GithubStats.User

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- GithubStats.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user, %{}, ttl: {1, :minute}) do
      conn
      |> put_status(:ok)
      |> render("create.json", user: user, token: token)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
