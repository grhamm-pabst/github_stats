defmodule GithubStatsWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :github_stats

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
