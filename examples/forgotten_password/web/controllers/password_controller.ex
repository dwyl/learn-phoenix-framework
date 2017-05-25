defmodule App.PasswordController do
  use App.Web, :controller

  alias App.User
  # Timex is a library you can use to easily change the date for checking expiry
  use Timex

  def new(conn, _params) do
    changeset = User.email_changeset(%User{})
    render conn, "new.html", changeset: changeset, action: password_path(conn, :create)
  end

  def create(conn, %{"user" => pw_params}) do
    email = pw_params["email"]
    user = case email do
      nil ->
        nil
      email ->
        User
        |> Repo.get_by(email: email)
    end

    case user do
      nil ->
        conn
        |> put_flash(:error, "Could not send reset email. Please try again later")
        |> redirect(to: password_path(conn, :new))
      user ->
        user = reset_password_token(user)
        # send password token to pw_params["email"]
        App.Email.send_reset_email(email, user.reset_password_token)
        |> App.Mailer.deliver_now()

        conn
        |> put_flash(:info, "If your email address exists in our database, you will receive a password reset link at your email address in a few minutes.")
        |> redirect(to: login_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => token}) do
    user = User
          |> Repo.get_by(reset_password_token: token)
    case user do
      nil ->
        conn
        |> put_flash(:error, "Invalid reset token")
        |> redirect(to: password_path(conn, :new))
      user ->
        if expired?(user.reset_token_sent_at) do
          # could set reset fields to nil here
          User.password_token_changeset(user, %{
            reset_password_token: nil,
            reset_token_sent_at: nil
          })
          |> Repo.update!

          conn
          |> put_flash(:error, "Password reset token expired")
          |> redirect(to: password_path(conn, :new))
        else
          changeset = User.password_changeset(%User{})
          conn
          |> render("edit.html", changeset: changeset, token: token)
        end
    end
  end

  def update(conn, %{"id" => token, "user" => pw_params}) do
    user = User
          |> Repo.get_by(reset_password_token: token)
    case user do
      nil ->
        conn
        |> put_flash(:error, "Invalid reset token")
        |> redirect(to: password_path(conn, :new))
      user ->
        if expired?(user.reset_token_sent_at) do
          User.password_token_changeset(user, %{
            reset_password_token: nil,
            reset_token_sent_at: nil
          })
          |> Repo.update!

          conn
          |> put_flash(:error, "Password reset token expired")
          |> redirect(to: password_path(conn, :new))
        else
          changeset = User.update_password(user, pw_params)
          case Repo.update(changeset) do
            {:ok, _user} ->
              User.password_token_changeset(user, %{
                reset_password_token: nil,
                reset_token_sent_at: nil
              })
              |> Repo.update!

              conn
              |> put_flash(:info, "Password reset successfully!")
              |> redirect(to: login_path(conn, :index))
            {:error, changeset} ->
              conn
              |> render("edit.html", changeset: changeset, token: token)
          end
        end
    end
  end

# sets the token & sent at in the database for the user
  defp reset_password_token(user) do
    token = random_string(48)
    sent_at = DateTime.utc_now

    user
    |> User.password_token_changeset(%{reset_password_token: token, reset_token_sent_at: sent_at})
    |> Repo.update!
  end

# sets the token to a random string or whatever length is input
  defp random_string(length) do
    length
    |> :crypto.strong_rand_bytes
    |> Base.url_encode64
    |> binary_part(0, length)
  end

# checks if now is later than 1 day from the reset_token_sent_at
  defp expired?(datetime) do
    Timex.after?(Timex.now, Timex.shift(datetime, days: 1))
  end
end
