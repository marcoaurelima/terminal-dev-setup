#!/bin/bash
set -e

source script/header.sh
source script/pre.install.sh
source script/asdf.install.sh
source script/nvchad.install.sh
source script/tmux.theme.install.sh
source script/pos.install.sh
source script/finished.sh

show_header
pre_install
install_asdf
install_nvchad
tmux_theme_install
pos_install
finished


