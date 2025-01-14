#!/bin/bash

echo "Script de instalação:"
echo -e "[asdf] [neovim] [tmux]\n"

echo -e "---[ ASDF ]---\n"
# Instalação de ferramantas de compilação
sudo pacman -S base-devel --noconfirm
# Instalação do ASDF via pacman
git clone https://aur.archlinux.org/asdf-vm.git 
cd asdf-vm
makepkg -si --noconfirm
# Inclusão no source
echo ". /opt/asdf-vm/asdf.sh" >> ~/.zshrc


# echo "--[NEOVIM]--"

# nv=$(command -v nvim2)

# if [ -z "$nv" ]; then 
#     echo "Neovim não encontrado. Instale antes de prosseguir"
#     exit 1
# fi


# echo "$nv"