#!/bin/bash

#install neovim
cd ~
sudo apt-get -y install git ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo && cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

#get my nvim configs
cd ~/.config
sudo rm -r nvim
git clone https://github.com/Lyn-don/nvim

#install packer to manage nvim plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd ~/.config/nvim/lua/lyndon/
nvim -c so -c PackerSync -c q -c q packer.lua
