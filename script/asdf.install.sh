#!/bin/bash

install_asdf_plugins() {
    read -r plugin_name plugin_version <<< "$1"

    # Verifica se o plugin já está instalado
    if asdf plugin list | grep -q "$plugin_name"; then
        echo -e "\n\033[33mPlugin [${plugin_name}] já instalado.\033[0m"
        return
    fi

    echo -e "\n\n\033[30;42m  instalando [${1}] \033[0m"
    asdf plugin add "$plugin_name"
    asdf install "$plugin_name" "$plugin_version"
    asdf set -u  "$plugin_name" "$plugin_version"
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
    plugin_list=("neovim latest" "tmux latest" "lazygit latest" "nodejs lts" 
                 "golang latest" "ripgrep latest" "yay latest" "delta latest")

    for plugin_name in "${plugin_list[@]}"; do
        install_asdf_plugins "$plugin_name"
    done
    
}


