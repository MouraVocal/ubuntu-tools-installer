#!/usr/bin/bash
sudo apt install zsh -y
chsh -s $(which zsh)
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

zsh && zinit self-update

echo "Reinicie o seu Ubuntu caso o shell não inicie com zsh"
