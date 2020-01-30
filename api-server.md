# Create an API server with Phoenix

## What

The request/response steps between a client and the API server are:

- The client send request with header containing `Accept: application/json`
- The API server receive the request and knows from the headers 
  that the client is expecting some json data
  and returns the http response with `Content-type: application/json` in the header
  and the json data in the body of the response
- The client receive the response and knows from the headers that the body type of data is json

We will create an API which will allow people to create and complete tasks.

## Create a new Phoenix project

By default phoenix uses webpack for managing assets (e.g. css, images, js)
and create html view and template files.

So the first thing we need to do when creating a new phoenix project
for serving only a json api is to use the `--no-webpack` and `--no-html` options:

```sh
mix phx.new my-app --app my_app --no-webpack --no-html
```

Next to save data send to our API we will use the Postgres database.
We need to make sure the configuration to connect the server to Postgres
is correct. The files `confg/dev.exs`, `config/test.exs` contains the Postgres configuration (for production the configuration must use environnment variables) 

```exs
config :my_app, MyApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_app_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

See the [learn-postgres](https://github.com/dwyl/learn-postgresql/) repository
if you have any questions on how to install Postgres on your machine.
See also how to use [Docker with Postgres](https://github.com/dwyl/learn-postgresql/issues/55).

We can now run `mix ecto.create` to create the database for the application.
At this stage we can also make sure that the tests created by Phoenix are passing, run `mix test`.

## Create a new schema

The application will allow the user to save tasks.
To tell the database how to save the tasks we need to create a new schema.
A schema will map the data from Postgres to an Elixir struct.

We can use the `mix phx.gen.json` to create the structure for managing tasks.
Run `mix help phx.gen.json` to get an example on how this command works.

To create manage our tasks we can run the following command:

```sh
mix phx.gen.json Todos Task tasks text:string complete:boolean
```

where
 - Todos is a Phoenix context. The context manage how the data for the tasks. see https://hexdocs.pm/phoenix/contexts.html
 - Task is the Ecto schema
 - tasks the table name in Postgres
 - text and complete the database fields

We can now run `mix ecto.migrate` which will create the tasks table.

The last steps before being able to use the new task controller
is to define the endpoints in `lib/my_app_web/router.ex`:

```ex
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyAppWeb do
    pipe_through :api
    resources "/tasks", TaskController, except: [:new, :edit]) # adding the new endpoints
    # new and edit action are not necessary are they are used for html view forms
  end
```

The `resources` function will add the CRUD endpoints for task.
Note that the scope `/api` is using the `:api` pipeline.
This means that the endpoints define in `/api` needs to have the
requests' headers containing the `Accept: appication/json` value.

We can now verify that all tests are passing.

## Deployment

### Manage Cross Origin Resource Sharing

To allow any domain names to send requests to the API,
we need to let the server allow these request.
By default only the requests from the same domain name as the server are allowed.

We can use the [cors_plug](https://hex.pm/packages/cors_plug) package to
update the `:api` pipeline to allow other domain names.

- Add the dependency `{:cors_plug, "~> 2.0"}` to `mix.exs` file and run `mix deps.get`
- Add in `endpoint.ex` file `plug CORSPlug, origin: ["*"]`

see https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS