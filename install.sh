#!/bin/bash

echo "Script de instalação:"
echo -e "[asdf] [neovim] [tmux]\n"

# salvar diretório atual
pushd .

echo -e "\n\033[32m---------------[ PACOTES ]---------------\033[0m\n"
# Instalação de ferramantas de compilação
sudo pacman -S base-devel --noconfirm
# xclip para neovim acessar area de transferencia
sudo pacman -S xclip --noconfirm

echo -e "\n\033[32m---------------[ ASDF ]---------------\033[0m\n"
# Instalação do ASDF via pacman
git clone https://aur.archlinux.org/asdf-vm.git 
pushd asdf-vm
makepkg -si --noconfirm
popd
# Removendo pasta clone do ASDF
rm -rf ./asdf-vm
# Inclusão no source do zsh
echo -e "\nexport PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"" >> ~/.zshrc
# Recarregar source
source ~/.zshrc

# Instalação dos programas via plugins
echo -e "\n\033[32mInstalando \033[34m[NEOVIM]\033[32m \033[34m[TMUX] \033[34m[LAZYGIT]\033[32m via ASDF\033[0m\n"

# NEOVIM
asdf plugin add neovim
asdf install neovim latest
asdf set -u neovim latest

# TMUX
asdf plugin add tmux
asdf install tmux latest
asdf set -u tmux latest

# LAZYGIT
asdf plugin add lazygit
asdf install lazygit latest
asdf set -u lazygit latest

# NODEJS
asdf plugin add nodejs
asdf install nodejs latest
asdf set -u nodejs latest

# GOLANG
asdf plugin add golang
asdf install golang latest
asdf set -u golang latest

# RIPGREP
asdf plugin add ripgrep
asdf install ripgrep latest
asdf set -u ripgrep latest

# YAY
asdf plugin add yay
asdf install yay latest
asdf set -u yay latest

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

# incluindo algus alias no zsh
echo -e "alias c=clear\nalias C=clear" >> ~/.zshrc
echo -e "alias x=exit\nalias X=exit" >> ~/.zshrc
echo -e "alias gr=\"go run .\" >>" ~/.zshrc

echo -e "\n\033[32mINSTALAÇÃO CONCLUÍDA!\n"

echo -e "\033[0m🛈 Instruções de pós-instalação:"
echo -e "\033[36m  - Para instalar o tema no TMUX, execute o tmux e pressione [prefix] + I"
echo -e "\033[36m  - Para instalar os servidores LSP no NEOVIM, execute :MasonInstallAll"
echo -e "\033[36m    (Faça os esses passos em um novo terminal. Feche o terminal atual)"

cd

echo -e "\n\033[0mPressione qualquer tecla para sair..."
read -n 1 -s
exit 0