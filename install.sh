#!/bin/bash

# Пути
SOURCE_APP="yandex-music"
INSTALL_DIR="/opt/yandex-music"
DESKTOP_FILE="/usr/share/applications/yandex-music.desktop"

# Иконки
ICON_48="icon_48x48.png"
ICON_256="icon_256x256.png"

# Копирование приложения в /opt
sudo mkdir -p "$INSTALL_DIR"
sudo cp "$SOURCE_APP" "$INSTALL_DIR/"

# Копирование иконок
sudo mkdir -p "/usr/share/icons/hicolor/48x48/apps"
sudo mkdir -p "/usr/share/icons/hicolor/256x256/apps"
sudo cp "$ICON_48" "/usr/share/icons/hicolor/48x48/apps/yandex-music.png"
sudo cp "$ICON_256" "/usr/share/icons/hicolor/256x256/apps/yandex-music.png"

# Обновление кэша иконок
sudo gtk-update-icon-cache -f /usr/share/icons/hicolor/

# Создание ярлыка в меню
cat <<EOF | sudo tee "$DESKTOP_FILE" > /dev/null
[Desktop Entry]
Name=Yandex Music
Exec=$INSTALL_DIR/yandex-music
Icon=yandex-music
Type=Application
Categories=Audio;Music;
EOF

# Установка прав на выполнение
sudo chmod +x "$INSTALL_DIR/yandex-music"

echo "Установка завершена! Яндекс.Музыка установлена в $INSTALL_DIR."

