# Heroku Review Apps

Review apps let you test new features of a pull request by
creating a specific Heroku app url for this PR.

## Setup
### 1. Configure your application with app.json
Create a `app.json` file at the root of your project.
This file will be used to configure each review apps.

For our phoenix application we need to define at least:
- The buildpacks used
    - https://buildpack-registry.s3.amazonaws.com/buildpacks/hashnuke/elixir.tgz
    - https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
- The addons for Postgres: `heroku-postgresql:hobby-dev`

An example of the `app.json` file:

```json
{ 
    "name": "testapp",
    "description": "application review",
    "buildpacks": [
        {"url": "https://buildpack-registry.s3.amazonaws.com/buildpacks/hashnuke/elixir.tgz"},
        {"url": "https://github.com/gjaldon/heroku-buildpack-phoenix-static.git"}
    ],
    "addons": [
        {
            "plan": "heroku-postgresql:hobby-dev"
        }
    ]
}
```

The documentation for `app.json` can be found at this url: https://devcenter.heroku.com/articles/app-json-schema

### 1. Create a new pipeline

On your Heroku dashboard create a new pipeline
and connect your github repository

![create_new_pipeline](https://user-images.githubusercontent.com/6057298/68773134-ed69a580-0622-11ea-9d4b-8b73a189db1b.png)

![create_pipeline](https://user-images.githubusercontent.com/6057298/68774622-4afef180-0625-11ea-90ca-51a0324e28f0.png)

![connect_repository](https://user-images.githubusercontent.com/6057298/68774636-505c3c00-0625-11ea-8106-22e4958fcb9a.png)

### 2. Enable Review apps

![enable_review_app](https://user-images.githubusercontent.com/6057298/68773215-1427dc00-0623-11ea-9203-1428dfebb3c8.png)

### 3. Create a Pull Request

When a new pull request is created the review app will be automatically created:

![review_app_created](https://user-images.githubusercontent.com/6057298/68773244-1e49da80-0623-11ea-8d7a-f077238334c2.png)

Build log of the review app:

![review_app_log](https://user-images.githubusercontent.com/6057298/68773248-20139e00-0623-11ea-9cd3-a8257265b764.png)

Managing the review app:

![manage_review_app](https://user-images.githubusercontent.com/6057298/68774712-6ec23780-0625-11ea-9c14-d5413f879b3f.png)