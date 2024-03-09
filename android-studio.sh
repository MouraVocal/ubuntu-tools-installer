#!/usr/bin/bash
# Installing necessary packages
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# Download and extract files
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.2.1.23/android-studio-2023.2.1.23-linux.tar.gz \
&& tar xzf android-studio-2023.2.1.23-linux.tar.gz \
&& rm android-studio-2023.2.1.23-linux.tar.gz \
# Moving to user application directory
&& sudo mv android-studio /usr/bin/android-studio

# Create Desktop entry
sudo echo "[Desktop Entry]
  Name=Android Studio
  GenericName=Android Studio
  Comment=Android Development
  Exec=/usr/bin/android-studio/bin/studio.sh
  Terminal=false
  Icon=/usr/bin/android-studio/bin/studio.png
  Type=Application
  Categories=Development;
  " > Android-Studio.desktop \
&& sudo mv Android-Studio.desktop /usr/share/applications/Android-Studio.desktop
echo "export ANDROID_HOME=\$HOME/Android/Sdk
export PATH=\$PATH:\$ANDROID_HOME/emulator
export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> ~/.zshrc
