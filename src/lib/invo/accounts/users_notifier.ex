defmodule Invo.Accounts.UsersNotifier do
  import Bamboo.Email

  defp deliver(email) do
    Invo.Mailer.deliver_later(email)
  end

  defp base_email do
    new_email(from: "accountservices@invo.mroach.com")
  end

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    base_email()
    |> to(user.email)
    |> subject("Confirming your account")
    |> text_body("""
      ==============================

      Hi #{user.email},

      You can confirm your account by visiting the url below:

      #{url}

      If you didn't create an account with us, please ignore this.

      ==============================
      """
    )
    |> deliver()
  end

  @doc """
  Deliver instructions to reset password account.
  """
  def deliver_reset_password_instructions(user, url) do
    base_email()
    |> to(user.email)
    |> subject("Resetting your password")
    |> text_body("""
      ==============================

      Hi #{user.email},

      You can reset your password by visiting the url below:

      #{url}

      If you didn't request this change, please ignore this.

      ==============================
    """)
    |> deliver()
  end

  @doc """
  Deliver instructions to update your e-mail.
  """
  def deliver_update_email_instructions(user, url) do
    base_email()
    |> to(user.email)
    |> subject("Confirm your new email address")
    |> text_body("""

    ==============================

    Hi #{user.email},

    You can change your e-mail by visiting the url below:

    #{url}

    If you didn't request this change, please ignore this.

    ==============================
    """)
    |> deliver()
  end
end
