FROM hexletbasics/base-image:latest

ARG TARGETARCH
ARG OTP_VERSION=29.1.2
ARG ELIXIR_VERSION=1.20.5

# Erlang and Elixir come from the hex.pm builds: Debian ships Elixir 1.14.
# The OTP build targets ubuntu-22.04 (glibc 2.35) and runs on bookworm.
RUN apt-get update \
    && apt-get install -yqq --no-install-recommends libncurses6 libssl3 unzip \
    && rm -rf /var/lib/apt/lists/* \
    && case "${TARGETARCH:-amd64}" in \
         amd64) otp_sha=1df9e6285b4d14319a789176db60c273131abebdfa6b5474a084dba49b0e54a2 ;; \
         arm64) otp_sha=8e16954a07278e83de260489ed4af9bcca0e22ab7e99eb11de781ec6f01e95d9 ;; \
       esac \
    && curl -fsSL "https://builds.hex.pm/builds/otp/${TARGETARCH:-amd64}/ubuntu-22.04/OTP-${OTP_VERSION}.tar.gz" -o /tmp/otp.tar.gz \
    && echo "${otp_sha}  /tmp/otp.tar.gz" | sha256sum -c - \
    && mkdir -p /opt/erlang \
    && tar -xzf /tmp/otp.tar.gz -C /opt/erlang --strip-components=1 \
    && /opt/erlang/Install -minimal /opt/erlang \
    && curl -fsSL "https://builds.hex.pm/builds/elixir/v${ELIXIR_VERSION}-otp-29.zip" -o /tmp/elixir.zip \
    && echo "f424d6f0bb710a1d4898f2645d8ad6cab3f5eab8d71848c0dda2579d3a8e8a06  /tmp/elixir.zip" | sha256sum -c - \
    && unzip -q /tmp/elixir.zip -d /opt/elixir \
    && rm /tmp/otp.tar.gz /tmp/elixir.zip

ENV PATH=/exercises-elixir/bin:/opt/elixir/bin:/opt/erlang/bin:$PATH
ENV LANG=C.UTF-8

WORKDIR /exercises-elixir

COPY mix.* ./

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix hex.info && \
    mix deps.get

COPY . .
