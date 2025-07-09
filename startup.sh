#!/bin/bash

# install tools
sudo apt install --yes \
    direnv

# install zsh, of my zsh and theme
sudo apt install zsh --yes
# Install 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --yes
sudo chsh -s $(which zsh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
