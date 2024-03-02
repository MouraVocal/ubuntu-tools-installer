#!/usr/bin/bash
fonts_folder=~/.fonts/truetype/MesloGSNF

# Cria a pasta para inserir as fontes
if [ -z "$fonts_folder" ]; then
  mkdir -p "$fonts_folder"
fi

# Atualiza o Linux
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

# Instala ferramentas essenciais
sudo apt install curl git -y

# Seta o user e email no git
echo "Digite seu usuário git"
read NAME

echo "Digite seu email git"
read EMAIL

git config --global user.name $NAME
git config --global user.email $EMAIL

# Gera ssh para o Github com o e-mail git
ssh-keygen -t ed25519 -f /home/$(whoami)/.ssh/id_ed25519 -C $EMAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Copie a chave ssh para configurar sua conexão ssh com o github"

cat ~/.ssh/id_ed25519.pub

echo "Fim da chave ssh"

# Baixa Nerd Fonts
wget -P $fonts_folder \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf \
  && sudo fc-cache -fv \
  && ls $fonts_folder

echo "Configure agora o seu shell com a fonte Meslo LG"
