#!/usr/bin/bash
sudo apt install zsh -y
chsh -s "$(which zsh)"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

zsh && zinit self-update

cat <<EOF >> ~/.zshrc
# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word
# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
# Snippet
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/
EOF

echo "Reinicie o seu Ubuntu caso o shell não inicie com zsh"
