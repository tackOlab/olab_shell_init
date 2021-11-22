#!/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N);do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install peco tmux alacritty

cp ./zshrc ~/.zshrc
cp ./zpreztorc ~/.zpreztorc
cp -r ./tmux ~/.tmux
cp ./tmux.conf ~/.tmux.conf
cp ./alacritty.yml ~/.alacritty.yml

