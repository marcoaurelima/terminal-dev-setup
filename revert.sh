#!/bin/bash

# remoção de todas as instalações

# base-devel
sudo pacman -R base-devel --noconfirm
# xclip
sudo pacman -R xclip --noconfirm

# asdf (plugins e instalações)
sudo pacman -Rs asdf-vm
sudo rm -rf "${ASDF_DATA_DIR:-$HOME/.asdf}"
sudo rm -rf "$HOME/.tool-versions" "$HOME/.asdfrc"

# NvChad
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Lazygit config
rm -f ~/.config/lazygit/config.yml 

# Tmux temas
rm -rf ~/.tmux*

echo -e "\n\033[32mREVERSÃO CONCLUÍDA!\033[m" 

echo -e "\n\033[33mIntruções adicionais:\033[m" 
echo -e "- Retire manualmente do arquivo ~/.zshrc:\033[36m" 
echo -e "  * . /opt/asdf-vm/asdf.sh" 
echo -e "  * alias c=clear\n  * alias C=clear" 
echo -e "  * alias x=exit\n  * alias X=exit" 

echo ""