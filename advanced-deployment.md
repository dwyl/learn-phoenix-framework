# "Advanced" Phoenix ("Hot") Deployment
## _using_ Distillery and Edeliver

## Why?



## What?

The two (_main_) tools we will be using are:

+ Distillery: https://github.com/bitwalker/distillery
+ edeliver: https://github.com/boldpoker/edeliver


## How?

### Setup Server

+ SSH to server as root e.g: `ssh root@178.62.95.224`
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
```




## Background Reading / Watching

+ Lunchdown: Deploying Elixir and Phoenix Applications
https://youtu.be/jOeR0kkUd7I
+ Getting Elixir / Phoenix running on Digital Ocean with edeliver:
https://gist.github.com/mattweldon/2e8ecb953216438ad168
(_links/packages are out-of-date but a good starting point_)
