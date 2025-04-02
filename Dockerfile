FROM hexletbasics/base-image:latest

WORKDIR /exercises-elixir

ENV PATH=/exercises-elixir/bin:$PATH

# Установка зависимостей и очистка кэша
RUN apt-get update && \
    apt-get install -yqq erlang elixir && \
    rm -rf /var/lib/apt/lists/*

COPY mix.* ./

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix hex.info && \
    mix deps.get

COPY . .
