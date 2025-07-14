#!/bin/bash

lazygit_config_install() {
    echo -e "\n\n\033[30;42m Configurando [lazygit] \033[0m"

    rm -f ~/.config/lazygit/config.yml
    cp -f ./lazygit/config.yml ~/.config/lazygit/config.yml
}