defmodule InvoWeb.UsersSessionController do
  use InvoWeb, :controller

  alias Invo.Accounts
  alias InvoWeb.UsersAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"users" => users_params}) do
    %{"email" => email, "password" => password} = users_params

    if users = Accounts.get_users_by_email_and_password(email, password) do
      UsersAuth.log_in_users(conn, users, users_params)
    else
      render(conn, "new.html", error_message: "Invalid e-mail or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UsersAuth.log_out_users()
  end
end
