#!/usr/bin/zsh
if [ ! -d ~/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
  echo "
# ASDF
. \"$HOME/.asdf/asdf.sh\"
" >> ~/.zshrc && source ~/.zshrc

  echo "Entrada asdf adicionada ao zshrc"

  else
  echo "Entrada asdf já adicionada ao zshrc"
fi

# Install NodeJs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
&& asdf install nodejs latest \
&& asdf global nodejs latest

# Install Python
sudo apt update -y \
&& sudo apt install -y build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
&& asdf plugin add python https://github.com/danhper/asdf-python.git \
&& asdf install python latest \
&& asdf global python latest

# Install Java
asdf plugin add java https://github.com/halcyon/asdf-java.git \
&& asdf install java adoptopenjdk-8.0.402+6 \
&& asdf global java adoptopenjdk-8.0.402+6

# Lista todas dependencias instaladas
asdf list
