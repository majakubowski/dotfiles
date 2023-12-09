#!/bin/bash

OMZSH_PLUGINS="https://github.com/zsh-users/zsh-autosuggestions https://github.com/zsh-users/zsh-completions https://github.com/zsh-users/zsh-syntax-highlighting"

ZSH_CONFIG="$HOME/.zshrc"
OMZSH_PLUGINS_LOCATION="$HOME/.oh-my-zsh/custom/plugins"

# Install custom oh-my-zsh plugins from OMZSH_PLUGINS
currdir=$(pwd)
mkdir -p "$OMZSH_PLUGINS_LOCATION"
cd "$OMZSH_PLUGINS_LOCATION" || exit

IFS=' ' read -ra plugins <<< "${OMZSH_PLUGINS}"

for plugin in "${plugins[@]}"
do
  git clone --depth 1 $plugin
done

cd "$currdir" || exit

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp zsh/.zshrc $HOME/.zshrc
cp zsh/.p10k.zsh $HOME/.p10k.zsh