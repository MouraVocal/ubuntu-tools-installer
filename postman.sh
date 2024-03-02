#!/usr/bin/bash
if [ ! -d /usr/bin/Postman ]; then
  wget https://dl.pstmn.io/download/latest/linux_64
  tar xzf linux_64
  rm linux_64
  sudo mv Postman /usr/bin/Postman

  sudo echo "[Desktop Entry]
  Name=Postman
  GenericName=Postman API Tool
  Comment=API Development Environment
  Exec=/usr/bin/Postman/Postman
  Terminal=false
  Icon=/usr/bin/Postman/app/resources/app/assets/icon.png
  Type=Application
  Categories=Development;
  " > Postman.desktop

  sudo mv Postman.desktop /usr/share/applications/Postman.desktop
else
  echo "Postman already installed"
fi
