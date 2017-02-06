#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule Rumbl.Repo.Migrations.AddSrcAndUrlToAnnotation do
  use Ecto.Migration

  def change do
    alter table(:annotations) do
      add :src, :string
      add :url, :string
    end
  end
end
