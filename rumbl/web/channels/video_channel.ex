defmodule Rumbl.VideoChannel do
  use Rumbl.Web, :channel

  def join("videos:" <> video_id, _params, socket) do
    # :timer.send_interval(5_000, :ping)
    {:ok, socket} #assign(socket, :video_id, String.to_integer(video_id))}
  end

  def handle_in("new_annotation", params, socket) do
    broadcast! socket, "new_annotation", %{
      user: %{username: "anon"},
      body: params["body"],
      at: params["at"]
    }

    {:reply, :ok, socket}
  end
end
