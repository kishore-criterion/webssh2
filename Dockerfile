FROM debian:bullseye-slim

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        wget \
        openssh-client \
        iputils-ping \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get install -y nodejs

WORKDIR /usr/src

COPY app/ /usr/src/

RUN npm ci --audit=false --bin-links=false --fund=false

EXPOSE 21002/tcp

ENTRYPOINT [ "npm","start" ]