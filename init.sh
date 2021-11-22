#!/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N);do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install peco tmux

cp ./zshrc ~/.zshrc
cp ./zpreztorc ~/.zpreztorc
cp -r ./tmux ~/.tmux
cp ./tmux.conf ~/.tmux.conf
cp ./alacritty.yml ~/.alacritty.yml

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# rustup override set stable
# rustup update stable

git clone https://github.com/alacritty/alacritty.git $HOME/alacritty
<<<<<<< HEAD
=======

>>>>>>> a37fe5098a6a79aec04b17f9b4915df044a97aae
