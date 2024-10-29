ARG UBUNTU_VERSION=latest
FROM ubuntu:${UBUNTU_VERSION}

LABEL maintainer="rxsnakepi@gmail.com" \
      version="1.0" \
      description="Dockerfile for setting up a development environment with rx-nvim"

# install basic tools
RUN apt update && apt install -y sudo curl git xz-utils

# create user dev
RUN useradd -m -s /bin/bash dev && usermod -aG sudo dev
RUN echo "dev ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

USER dev

# install nix
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon --no-channel-add
RUN mkdir -p /home/dev/.config/nix/ && \
    echo "experimental-features = nix-command flakes" >> /home/dev/.config/nix/nix.conf && \
    echo "extra-substituters = https://cache.garnix.io" >> /home/dev/.config/nix/nix.conf && \
    echo "extra-trusted-public-keys = cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" >> /home/dev/.config/nix/nix.conf

ENV PATH="$PATH:/home/dev/.nix-profile/bin:/home/dev/.nix-profile/bin/nix"

# install rx-nvim
RUN nix profile install github:CnTeng/rx-nvim nixpkgs#nil nixpkgs#nixfmt-rfc-style

WORKDIR /home/dev
