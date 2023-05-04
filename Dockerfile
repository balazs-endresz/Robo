FROM ubuntu:18.04

WORKDIR /

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git curl libatomic1

# Install elan
RUN curl -sSfL https://github.com/leanprover/elan/releases/download/v1.4.2/elan-x86_64-unknown-linux-gnu.tar.gz | tar xz
RUN ./elan-init -y --default-toolchain leanprover/lean4:nightly-2022-09-23
# TODO: Read out lean version from lean-toolchain file
ENV PATH="${PATH}:/root/.elan/bin"

# Copy the game to `game`
COPY . ./game

WORKDIR /game
RUN lake update
RUN lake exe cache get

WORKDIR /game/lake-packages/GameServer/server/
RUN lake clean
RUN lake build

WORKDIR /game
RUN lake clean
RUN lake build

WORKDIR /game/lake-packages/GameServer/server/build/bin/
