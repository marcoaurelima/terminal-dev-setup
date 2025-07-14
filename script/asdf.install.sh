#!/bin/bash

install_asdf_plugins() {
    echo -e "\n\n\033[30;42m  instalando [${1}] \033[0m"
    asdf plugin add $1
    asdf install $1 latest
    asdf set -u $1 latest
}

install_asdf() {
    # Instalação do ASDF via pacman
    git clone https://aur.archlinux.org/asdf-vm.git 
    pushd asdf-vm
    makepkg -si --noconfirm
    popd

    # Removendo pasta clone do ASDF
    rm -rf ./asdf-vm

    # Inclusão no source do zsh
    echo -e "\n"
    echo "export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"" >> ~/.zshrc
    
    # Lista de plugins para instalar
    plugin_list=("neovim" "tmux" "lazygit" "nodejs" 
                 "golang" "ripgrep" "yay" "delta")

    for plugin_name in "${plugin_list[@]}"; do
        install_asdf_plugins "$plugin_name"
    done
    
}


