#!/bin/bash

# Install all default tools that I require everyday
apt-get update -q=2
apt-get install -q=1 -y \
    nano bash git jq \
    pcregrep socat zip unzip \
    curl wget net-tools htop \
    dnsutils ca-certificates zsh

# set time and time zone and display the current time settings
# timedatectl set-timezone UTC
# timedatectl

# cat bashrc.additions >> ~/.bashrc
# cp ./.gitmessage ~
cp ./.gitconfig ~

# powerline fonts for zsh agnoster theme
git clone https://github.com/powerline/fonts.git --depth=1
pushd fonts
./install.sh
popd
rm -rf fonts

# # nerd fonts for zsh agnoster theme
# git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
# pushd nerd-fonts
# ./install.sh
# popd ..
# rm -rf nerd-fonts

# oh-my-zsh & plugins
RUNZSH=no CHSH=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh -c 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'

# Install zsh config
cp zsh/.p10k.zsh ~
cp zsh/.zshrc ~
