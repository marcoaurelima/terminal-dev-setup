#!/bin/bash

echo "Script de instalação:"
echo -e "[asdf] [neovim] [tmux]\n"

echo -e "\n\033[32m---------------[ PACOTES ]---------------\033[0m\n"
# Instalação de ferramantas de compilação
sudo pacman -S base-devel --noconfirm
# Instalar ripgrep
sudo pacman -S ripgrep --noconfirm

echo -e "\n\033[32m---------------[ ASDF ]---------------\033[0m\n"
# Instalação do ASDF via pacman
git clone https://aur.archlinux.org/asdf-vm.git 
pushd asdf-vm
makepkg -si --noconfirm
popd
# Removendo pasta clone do ASDF
rm -rf ./asdf-vm

# Inclusão no source do zsh
echo ". /opt/asdf-vm/asdf.sh" >> ~/.zshrc
# Recarregar source
source ~/.zshrc

# Instalação dos programas via plugins
echo -e "\n\033[32mInstalando \033[34m[NEOVIM]\033[32m \033[34m[TMUX] \033[34m[LAZYGIT]\033[32m via ASDF\033[0m\n"

# NEOVIM
asdf plugin add neovim
asdf install neovim latest
asdf global neovim latest

# TMUX
asdf plugin add tmux
asdf install tmux latest
asdf global tmux latest

# LAZYGIT
asdf plugin add lazygit
asdf install lazygit latest
asdf global lazygit latest

# NODEJS
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

# GOLANG
asdf plugin add golang
asdf install golang latest
asdf global golang latest

echo -e "\n\033[32mInstalando NvChad...\033[0m\n"
# Remoção de instalações antigas
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
# instalação nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim
mkdir -p ~/.config/nvim/lua/configs
mkdir -p ~/.config/nvim/lua/plugins
cp -rf ./neovim/configs ~/.config/nvim/lua/
cp -rf ./neovim/plugins ~/.config/nvim/lua/
cp -f ./neovim/chadrc.lua ~/.config/nvim/lua/chadrc.lua
cp -f ./neovim/mappings.lua ~/.config/nvim/lua/mappings.lua
cp -f ./neovim/options.lua ~/.config/nvim/lua/options.lua
rm -rf ~/.config/nvim/.git

echo -e "\n\033[32m---------------[ TEMA TMUX ]---------------\033[0m\n"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -f ./tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

echo -e "\n\033[33m🛈 Para instalar o tema no TMUX, pressione [prefix] + I\n\n"

# nv=$(command -v nvim2)

# if [ -z "$nv" ]; then 
#     echo "Neovim não encontrado. Instale antes de prosseguir"
#     exit 1
# fi


# echo "$nv"