#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule Rumbl.VideoChannel do
  use Rumbl.Web, :channel
  alias Rumbl.AnnotationView

  def join("videos:" <> video_id, params, socket) do
    last_seen_id = params["last_seen_id"] || 0
    video = Repo.get!(Rumbl.Video, video_id)
    annotations = Repo.all(
           from a in assoc(video, :annotations),
         where: a.id > ^last_seen_id,
      order_by: [asc: a.at, asc: a.id],
         limit: 200,
       preload: [:user]
    )
    resp = %{annotations: Phoenix.View.render_many(annotations, AnnotationView,
                                                   "annotation.json")}

    {:ok, resp, assign(socket, :video_id, video.id)}
  end


  def handle_in(event, params, socket) do
    user = Repo.get(Rumbl.User, socket.assigns.user_id)
    handle_in(event, params, user, socket)
  end

  def handle_in("new_annotation", params, user, socket) do
    changeset =
      user
      |> build_assoc(:annotations, video_id: socket.assigns.video_id)
      |> Rumbl.Annotation.changeset(params)

    case Repo.insert(changeset) do
      {:ok, annotation} ->
        broadcast! socket, "new_annotation", %{
          id: annotation.id,
          user: Rumbl.UserView.render("user.json", %{user: user}),
          body: annotation.body,
          at: annotation.at
        }
        {:reply, :ok, socket}

      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end
end
