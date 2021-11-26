#!/bin/zsh

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N);do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Install nerd-font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install peco tmux

# Copy dot files
cp ./zprofile ~/.zprofile
cp ./zshrc ~/.zshrc
cp ./zpreztorc ~/.zpreztorc
cp -r ./tmux ~/.tmux
cp ./tmux.conf ~/.tmux.conf
cp ./alacritty.yml ~/.alacritty.yml

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup override set stable
rustup update stable

# Clone Alacritty and build
git clone https://github.com/alacritty/alacritty.git $HOME/alacritty
cd $HOME/alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/

# Clone tmux plugins
cd ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm.git
git clone https://github.com/tmux-plugins/tmux-battery.git
git clone https://github.com/tmux-plugins/tmux-cpu.git
git clone https://github.com/tmux-plugins/tmux-online-status.git

cd ~
