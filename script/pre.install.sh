#!/bin/bash

pre_install() {

    # Instalação de ferramantas de compilação
    echo -e "\n\n\033[30;42m Instalando [base-devel] \033[0m"
    sudo pacman -S base-devel --noconfirm

    # xclip para neovim acessar area de transferencia
    echo -e "\n\n\033[30;42m Instalando [xclip] \033[0m"
    sudo pacman -S xclip --noconfirm

    # Instalação de nerdfonts
    echo -e "\n\n\033[30;42m Instalando [nerd-fonts] \033[0m"
    sudo pacman -S ttf-martian-mono-nerd --noconfirm
    sudo pacman -S ttf-jetbrains-mono-nerd --noconfirm
    sudo pacman -S ttf-bigblueterminal-nerd --noconfirm
    sudo pacman -S otf-hermit-nerd --noconfirm
}
