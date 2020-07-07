# Sinatra Base 

This is a quick start for getting up and running with a Sinatra app with a Postgres database.

## Setup

First, be sure that you have [Docker up and running](https://docs.docker.com/get-docker/), including [Docker Compose](https://docs.docker.com/compose/install/).  Then, start the services with `docker-compose`:

```sh
$ docker-compose up
```

You'll also need to create the database:

```sh
$ docker-compose run --rm web rake db:create
```

Now you're ready to get started building stuff.