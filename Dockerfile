FROM melodyn/base-image:latest

WORKDIR /exercises-elixir

# установить эликсир

ADD mix.* ./
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix hex.info
RUN mix deps.get

COPY --from=melodyn/base-image:latest /tmp/basics/common/* ./
COPY . .
