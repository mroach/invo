FROM elixir:1.10-slim

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
      git \
      inotify-tools \
      build-essential

ARG GID
ARG UID
ARG USER

# To prevent generated files from being owned as root, and to not run the
# container as root, create a user that matches the host system's user.
RUN groupadd --gid ${GID} ${USER} && \
    useradd -m -s /bin/sh --uid ${UID} --gid ${GID} $USER

RUN mkdir -p /opt/mix/deps /opt/mix/build /opt/hex && \
    chown ${UID}:${GID} /opt/mix/deps /opt/mix/build /opt/hex

USER ${USER}

ENV MIX_DEPS_PATH=/opt/mix/deps
ENV MIX_BUILD_PATH=/opt/mix/build

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/dev
VOLUME /opt/dev

EXPOSE 4000

CMD [ "mix", "phx.server" ]
