#!/bin/bash

# install tools
sudo apt update \ 
    && apt install --no-install-recommends --yes \
        direnv \
        pkg-config \
        tig \
        zsh \
    && rm -rf /var/lib/apt/lists/*

# install lxml depenencies
sudo apt update \
    && apt install --no-install-recommends --yes \
        libxml2-dev \
        libxmlsec1-dev \
        libxmlsec1-openssl \
    && rm -rf /var/lib/apt/lists/*

# customize zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --yes
sudo chsh -s $(which zsh)

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
