# "Advanced" Phoenix ("Hot") Deployment
## _using_ Distillery and Edeliver

## Why?

Erlang gives us "***hot-code upgrades***" which mean we can do
"***Zero Downtime Deployment***".
This means people can _continue_ using the app
`while`



## What?

The two (_main_) tools we will be using are:

+ Distillery: https://github.com/bitwalker/distillery
+ edeliver: https://github.com/boldpoker/edeliver


## How?

### Setup Server

+ SSH to server as root e.g: `ssh root@178.62.57.75`
(_replace for your IP Address_)
+ `sudo apt-get install git`
  + `git config --global user.name "Your Name"`
  + `git config --global user.email "your@email.co.uk"`
+ `wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb`
+ `sudo apt-get update`
+ `sudo apt-get install elixir`
+ `mix local.hex`
+ `mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez`
+ `sudo apt-get install erlang-base-hipe`
+ `sudo apt-get install build-essential`
+ `sudo apt-get install erlang-dev`
+ `chmod -R 777 /opt`
+ `mkdir /git`
+ `chmod -R 777 /git`

+ On the _remote_ server,
Create the file `/home/builder/prod.secret.exs` with this command:
`mkdir -p /home/builder/ && vi /home/builder/prod.secret.exs`


### Setup EDeliver Project

+ add edeliver dependency in your `mix.exs` file (pointing to master branch on GH for now...):
`{:edeliver, git: "https://github.com/boldpoker/edeliver.git"}`
+ change `{:phoenix_live_reload, "~> 1.0", only: :dev}` to `{:phoenix_live_reload, "~> 1.0"}`
+ add `, :edeliver, :phoenix_live_reload` to applications list
+ `mix deps.get`
+ `mix deps.compile`
+ `mkdir .deliver && touch .deliver/config` to create the `.deliver` directory and config file.
+ populate config file with the following:

```
#!/usr/bin/env bash

APP="my_awesome_app" # name of your release

BUILD_HOST="server ip / hostname" # host where to build the release
BUILD_USER="root" # local user at build host
BUILD_AT="/git/my_awesome_app/builds" # build directory on build host
RELEASE_DIR="/git/my_awesome_app/builds/rel/my_awesome_app"
RELEASE_VERSION=0.0.1

STAGING_HOSTS="server ip / hostname" # staging / test hosts separated by space
STAGING_USER="git" # local user at staging hosts
TEST_AT="/test/my_awesome_app" # deploy directory on staging hosts. default is DELIVER_TO

PRODUCTION_HOSTS="server ip / hostname" # deploy / production hosts separated by space
PRODUCTION_USER="root" # local user at deploy hosts
DELIVER_TO="/opt/my_awesome_app" # deploy directory on production hosts

# For *Phoenix* projects, symlink prod.secret.exs to our tmp source
pre_erlang_get_and_update_deps() {
  local _prod_secret_path="/home/builder/prod.secret.exs"
  if [ "$TARGET_MIX_ENV" = "prod" ]; then
    __sync_remote "
      ln -sfn '$_prod_secret_path' '$BUILD_AT/config/prod.secret.exs'
    "
  fi
}
```

Paste the contents of your _local_ `config/prod.secret.exs` into the remote one.

```
mix release.init
MIX_ENV=prod mix release --env=prod
```

mix edeliver build release --branch=master --verbose

## Background Reading / Watching

+ Lunchdown: Deploying Elixir and Phoenix Applications
https://youtu.be/jOeR0kkUd7I
+ Elixir Forum Deployment Topic: https://elixirforum.com/c/popular-topics/deployment
+ Deploying Elixir applications with Edeliver:
http://blog.plataformatec.com.br/2016/06/deploying-elixir-applications-with-edeliver/
+ Getting Elixir / Phoenix running on Digital Ocean with edeliver:
https://gist.github.com/mattweldon/2e8ecb953216438ad168
(_links/packages are out-of-date but a good starting point_)
+ Is Phoenix deployment really that hard? http://cloudless.studio/articles/29-is-phoenix-deployment-really-that-hard
+ Elixir/Phoenix deployments using Distillery http://crypt.codemancers.com/posts/2016-10-06-elixir-phoenix-distillery/
+ Understanding `Mix.Tasks.Release.Init`
https://hexdocs.pm/distillery/Mix.Tasks.Release.Init.html
+ Elixir Phoenix App deployed into a Load Balanced DigitalOcean setup: http://www.akitaonrails.com/2016/12/23/elixir-phoenix-app-deployed-into-a-load-balanced-digitalocean-setup
+ Simplifying Elixir Releases With Edeliver: http://www.east5th.co/blog/2017/01/16/simplifying-elixir-releases-with-edeliver/

Now attempting to follow this:
Elixir/Phoenix deployments using Distillery http://crypt.codemancers.com/posts/2016-10-06-elixir-phoenix-distillery



On the server run the following command:
```
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 4000
```


scp /dwyl/chat/_build/prod/rel/chat/releases/0.0.1/chat.tar.gz root@178.62.57.75:/git/chat/builds/rel/chat/releases/0.0.1/
