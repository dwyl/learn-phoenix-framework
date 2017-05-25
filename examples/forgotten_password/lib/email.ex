defmodule App.Email do
  use Bamboo.Phoenix, view: App.FeedbackView

  def send_reset_email(to_email, token) do
    new_email()
    |> to(to_email)
    |> from(System.get_env("FROM_EMAIL"))
    |> subject("Reset Password Instructions")
    |> text_body("Please visit https://www.myapp.com/password/#{token}/edit to reset your password")
  end
end
