#!/bin/bash

finished() {
    echo -e "\n\033[32mINSTALAÇÃO CONCLUÍDA COM SUCESSO!\n"

    echo -e "\033[0m🛈 Instruções de pós-instalação:"
    echo -e "\033[36m  - Para instalar o tema no TMUX, execute o tmux e pressione [prefix] + I"
    echo -e "\033[36m  - Para instalar os servidores LSP no NEOVIM, execute :MasonInstallAll"
    echo -e "\033[36m    (Faça os esses passos em um novo terminal. Feche o terminal atual)"

    cd

    echo -e "\n\033[0mPressione qualquer tecla para sair..."
    read -n 1 -s
    exit 0
}