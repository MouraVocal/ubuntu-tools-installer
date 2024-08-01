#!/usr/bin/bash
if [ $(echo $SHELL) != "/usr/bin/zsh" ]; then
  chsh $(which zsh)
fi

echo zinit ice depth=1; zinit light romkatv/powerlevel10k >> ~/.zshrc
