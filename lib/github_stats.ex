defmodule GithubStats do
  alias GithubStats.Users.Create, as: UsersCreate
  alias GithubStats.Users.Get, as: UsersGet

  defdelegate create_user(params), to: UsersCreate, as: :call
  defdelegate get_user(idi), to: UsersGet, as: :by_id
end
