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

# Baixa Nerd Fonts
wget -P $fonts_folder \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf \
  && sudo fc-cache -fv \
  && ls $fonts_folder

echo "Configure agora o seu shell com a fonte Meslo LG"
