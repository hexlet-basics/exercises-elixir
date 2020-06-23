FROM hexletbasics/base-image:latest

WORKDIR /exercises-elixir

RUN apt-get install -y wget
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
  dpkg -i erlang-solutions_2.0_all.deb && \
  apt-get update && \
  apt-get install -yqq esl-erlang && \
  apt-get install -yqq elixir

ADD mix.* ./
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix hex.info
RUN mix deps.get

COPY . .
