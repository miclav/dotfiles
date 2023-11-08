#!/bin/sh

# Install all default tools that I require everyday
apt-get update -q=2
apt-get install -q=1 -y \
    nano bash git jq \
    pcregrep socat zip unzip \
    curl wget net-tools htop \
    btop dnsutils ca-certificates zsh

# set time and time zone and display the current time settings
timedatectl set-timezone UTC
timedatectl

# cat bashrc.additions >> ~/.bashrc
# cp ./.gitmessage ~
cp ./.gitconfig ~

# powerline fonts for zsh agnoster theme
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd .. && rm -rf fonts

# oh-my-zsh & plugins
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'
cp ./zsh/* ~
