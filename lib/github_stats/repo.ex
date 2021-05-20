defmodule GithubStats.Repo do
  use Ecto.Repo,
    otp_app: :github_stats,
    adapter: Ecto.Adapters.Postgres
end
