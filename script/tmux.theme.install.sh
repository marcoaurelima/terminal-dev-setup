#!/bin/bash

tmux_theme_install() {
    echo -e "\n\n\033[30;42m Instalando [tmux-theme] \033[0m"

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    cp -f ./tmux/.tmux.conf ~/.tmux.conf

}
