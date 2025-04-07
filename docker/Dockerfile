ARG UBUNTU_VERSION=latest
FROM ubuntu:${UBUNTU_VERSION}

LABEL maintainer="rxsnakepi@gmail.com" \
    version="1.0" \
    description="Dockerfile for setting up a development environment with rx-nvim"

# install basic tools
RUN apt update && \
    apt install -y sudo curl git xz-utils fzf && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# install nix
RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
    --extra-conf "sandbox = false" \
    --extra-conf "filter-syscalls = false" \
    --extra-conf "extra-substituters = https://cache.garnix.io" \
    --extra-conf "extra-trusted-public-keys = cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" \
    --init none \
    --no-confirm

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"

# create user dev
ARG USER_UID=1000

RUN if id "ubuntu" >/dev/null 2>&1; then userdel -r ubuntu; fi && \
    useradd -m -G users,sudo -N -s /bin/bash -u "${USER_UID}" dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

USER dev

# install rx-nvim
RUN nix profile install github:CnTeng/rx-nvim nixpkgs#nil nixpkgs#nixfmt-rfc-style

WORKDIR /home/dev
