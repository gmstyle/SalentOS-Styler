#!/bin/bash

sed -i '43s/.*/<name>fos<\/name>/' ~/.config/openbox/rc.xml;
sed -i '5s/.*/gtk-theme-name="fos"/' ~/.gtkrc-2.0;
sed -i '2s/.*/gtk-theme-name=fos/' ~/.config/gtk-3.0/settings.ini;
sed -i '6s/.*/gtk-icon-theme-name="Elefaenza-Blue"/' ~/.gtkrc-2.0;
sed -i 's|\(.*\)\launcher_icon_theme .*$|launcher_icon_theme = Elefaenza-Blue|' ~/.config/tint2/tint2rc;
python  /usr/local/bin/styler/function/themes_app/gtk-reload.py;
openbox --reconfigure;
killall -SIGUSR1 tint2;

exit