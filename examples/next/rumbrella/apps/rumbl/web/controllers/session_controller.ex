#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule Rumbl.SessionController do
  use Rumbl.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" =>
                                     pass}}) do
    case Rumbl.Auth.login_by_username_and_pass(conn, user, pass, repo:
                                               Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Rumbl.Auth.logout()
    |> put_flash(:info, "You have been logged out")
    |> redirect(to: page_path(conn, :index))
  end
end
