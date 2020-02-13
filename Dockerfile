FROM elixir:1.9.1

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -yqq git python3-pip
RUN apt-get update && apt-get install -yqq libyaml-dev zip unzip

RUN pip3 install yamllint

WORKDIR /exercises-elixir

ADD mix.* ./
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix hex.info
RUN mix deps.get

COPY . .
