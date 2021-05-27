defmodule GithubStats.Users.Create do
  alias GithubStats.{Error, Repo, User}

  def call(params) do
    with changeset <- User.changeset(params),
         {:ok, %User{} = user} <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
