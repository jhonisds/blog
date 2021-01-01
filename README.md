# Blog

[![Build Status](https://www.travis-ci.org/jhonisds/blog.svg?branch=main)](https://www.travis-ci.org/jhonisds/blog)

[![codecov](https://codecov.io/gh/jhonisds/blog/branch/main/graph/badge.svg?token=BZBYOE40LV)](https://codecov.io/gh/jhonisds/blog)

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Docker

- docker-compose build
- docker-compose run web mix ecto.create
- docker-compose up
- docker exec -it blog_db_1 psql -U postgres

## Credo

- mix credo

## Sobelow

- mix sobelow --config

## Coveralls

- mix coveralls.hmtl
- mix coveralls.json
