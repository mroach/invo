defmodule Invo.Repo do
  use Ecto.Repo,
    otp_app: :invo,
    adapter: Ecto.Adapters.Postgres
end
