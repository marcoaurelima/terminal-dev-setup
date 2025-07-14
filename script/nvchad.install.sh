#!/bin/bash

install_nvchad() {
    echo -e "\n\n\033[30;42m Instalando [nvchad] \033[0m"

    # Remoção de instalações antigas
    rm -rf ~/.config/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.local/share/nvim

    # Instalação nvchad
    git clone https://github.com/NvChad/starter ~/.config/nvim
    mkdir -p ~/.config/nvim/lua/configs
    mkdir -p ~/.config/nvim/lua/plugins
    
    # Copiando configurações personalizadas
    cp -rf ./neovim/configs ~/.config/nvim/lua/
    cp -rf ./neovim/plugins ~/.config/nvim/lua/
    cp -f ./neovim/chadrc.lua ~/.config/nvim/lua/chadrc.lua
    cp -f ./neovim/mappings.lua ~/.config/nvim/lua/mappings.lua
    cp -f ./neovim/options.lua ~/.config/nvim/lua/options.lua

    rm -rf ~/.config/nvim/.git
}