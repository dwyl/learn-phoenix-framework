#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule Rumbl.Channels.UserSocketTest do
  use Rumbl.ChannelCase, async: true
  alias Rumbl.UserSocket

  test "socket authentication with valid token" do 
    token = Phoenix.Token.sign(@endpoint, "user socket", "123")

    assert {:ok, socket} = connect(UserSocket, %{"token" => token}) 
    assert socket.assigns.user_id == "123"
  end

  test "socket authentication with invalid token" do 
    assert :error = connect(UserSocket, %{"token" => "1313"})
    assert :error = connect(UserSocket, %{})
  end
end
