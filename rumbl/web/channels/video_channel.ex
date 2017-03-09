defmodule Rumbl.VideoChannel do
  use Rumbl.Web, :channel

  def join("videos:" <> video_id, _params, socket) do
    :timer.send_interval(5_000, :ping)
    {:ok, socket} #assign(socket, :video_id, String.to_integer(video_id))}
  end

  def handle_info(:ping, socket) do
    count = socket.assigns[:count] || 1
    push socket, "ping", %{count: count}
    {:noreply, assign(socket, :count, count + 1)}
  end
end
