show_header() {
    dot="\033[0;32m●\033[0m"
    echo -e "\033c"
    echo -e "\n\033[30;42m SCRIPT DE INSTALAÇÃO DE AMBIENTE DE DESENVOLVIMENTO \033[0m"
    echo -e "\033[0;32m 1. Neovim/NvChad + plugins"
    echo -e "    ${dot} BufOnly.nvim             ${dot} diffview.nvim   ${dot} dropbar.nvim"
    echo -e "    ${dot} flutter-tools.nvim       ${dot} git-blame.nvim  ${dot} hex.nvim"
    echo -e "    ${dot} interestingwords.nvim    ${dot} lazygit.nvim    ${dot} nvim-nio"
    echo -e "    ${dot} neovim-session-manager   ${dot} noice.nvim      ${dot} nvim-dap"
    echo -e "    ${dot} mason-nvim-dap.nvim      ${dot} nvim-scrollbar  ${dot} nvim-toggler"
    echo -e "    ${dot} nvim-treesitter-context  ${dot} vim-move        ${dot} tabnine-nvim"
    echo -e "\033[0;32m 2. Tmux + tema"
    echo -e "\033[0;32m 3. ASDF + plugins"
    echo -e "    ${dot} neovim   ${dot} tmux    ${dot} lazygit"
    echo -e "    ${dot} nodejs   ${dot} golang  ${dot} ripgrep"
    echo -e "    ${dot} yay      ${dot} delta"
    echo ""
    read -p "Continuar? (y/n) " res
    if [[ "$res" != "y" && "$res" != "Y" ]]; then
        echo -e "\033[0;31mOperação cancelada... \033[0m\n"
        exit
    fi
}