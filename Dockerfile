FROM elixir:1.10.0-alpine AS build

# install build dependencies
RUN apk add --no-cache build-base git python

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
RUN mix escript.install --force hex protobuf

COPY mix.exs mix.lock ./
COPY config config
RUN mix do deps.get, deps.compile


# compile and build release
COPY lib lib
# uncomment COPY if rel/ exists
# COPY rel rel
RUN mix do compile

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

ENV HOME=/app

EXPOSE 50051/tcp

CMD ["mix", "grpc.server"]