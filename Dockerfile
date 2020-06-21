FROM elixir:1.10-slim

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      git \
      inotify-tools

ENV MIX_HOME=/opt/mix
ENV HEX_HOME=/opt/hex

ENV MIX_DEPS_PATH=/opt/mix/deps
ENV MIX_BUILD_PATH=/opt/mix/build

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/dev
VOLUME /opt/dev

EXPOSE 4000

CMD [ "mix", "phx.server" ]
