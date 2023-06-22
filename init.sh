#!/bin/zsh

# Install Homebrew
#if !(type "brew" > /dev/null 2>&1); then
#  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#fi

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N);do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Install nerd-font
#brew tap homebrew/cask-fonts
#brew install --cask font-jetbrains-mono-nerd-font
#brew install peco tmux exa bat ripgrep vim

# Copy dot files
cp ./zprofile $HOME/.zprofile
cp ./zshrc $HOME/.zshrc
cp ./zpreztorc $HOME/.zpreztorc
# only for tmux and alacritty, if any
#cp -r ./tmux $HOME/.tmux
#cp ./tmux.conf $HOME/.tmux.conf
#cp ./alacritty.yml $HOME/.alacritty.yml

# Install rustup
#if !(type "rustup" > /dev/null 2>&1); then
#  cd $HOME
#  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#  rustup override set stable
#  rustup update stable
#fi

# Clone Alacritty and build
#mkdir -p $HOME/alacritty
#cd $HOME/alacritty
#git clone https://github.com/alacritty/alacritty.git
#make app
#cp -r target/release/osx/Alacritty.app /Applications/

## Clone tmux plugins
#mkdir -p $HOME/.tmux/plugins
#cd $HOME/.tmux/plugins
#git clone https://github.com/tmux-plugins/tpm.git
#git clone https://github.com/tmux-plugins/tmux-battery.git
#git clone https://github.com/tmux-plugins/tmux-cpu.git
#git clone https://github.com/tmux-plugins/tmux-online-status.git

cd $HOME
