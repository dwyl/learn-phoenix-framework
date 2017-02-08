#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
Code.require_file "../../info_sys/test/backends/http_client.exs", __DIR__
ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Rumbl.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Rumbl.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Rumbl.Repo)
