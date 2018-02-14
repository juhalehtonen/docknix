# Docknix

A Dockerized, zero-dependency Phoenix 1.3 setup which should be used as a sample for future setups. Based on [Gist by jswny](https://gist.github.com/jswny/83e03537830b0d997924e8f1965d88bc).

Includes everything needed to build, deploy and run a default Phoenix application (Nginx and PostgreSQL).

## All the steps

Below is a quick outline of the steps we needed to take to achieve this setup.

Lines with `*` signify files that you might need to change (e.g. app names).

### Steps for Phoenix and Distillery

1. Add Distillery to dependencies in `mix.exs`: `{:distillery, "~> 1.5", runtime: false}`
2. Run `mix do deps.get, compile` to fetch and compile Distillery
3. Run `mix release.init` to initialize a Distillery release
4. Configure if we want to include erts in `rel/config.exs` *
5. Create release tasks module in `lib/docknix/release_tasks.ex` *
6. Add release command script at `rel/commands/migrate.sh` *
7. Add release command script to list of commands in `rel/config.exs` (to be able to run migrations with `bin/docknix migrate`)

### Steps for Docker

8. Add `.dockerignore` to avoid including unnecessary files
9. Create `Dockerfile.build` to specify how to build the release *
10. Create `build.sh` to manage the building of the app *
11. You can now run `./build.sh` to build your application in Docker
12. Create `Dockerfile.run` for running the built release *
13. Add `docker-compose.yml` to provision and manage the containers *
14. Now we can start with `docker-compose up`

### More steps for Phoenix

15. Adjust `config/prod.exs` to follow Distillery basics *
16. Adjust `config/prod.secret.exs` for production secrets *

## Phoenix locally

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
