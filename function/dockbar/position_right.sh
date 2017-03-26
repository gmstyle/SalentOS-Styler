#!/bin/bash
# Barra Tint2 position RIGHT - DESTRA  (panel_position = top right vertical)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
clear
sed -i "s/panel_position = bottom center horizontal/panel_position = center right vertical/" ~/.config/tint2/dock_tint2rc
sed -i "s/panel_position = center left vertical/panel_position = center right vertical/" ~/.config/tint2/dock_tint2rc
sed -i "s/panel_position = top center horizontal/panel_position = center center vertical/" ~/.config/tint2/dock_tint2rc

sed -i "s/<position>Top<\/position>/<position>Right<\/position>/" ~/.config/openbox/rc.xml
sed -i "s/<position>Left<\/position>/<position>Right<\/position>/" ~/.config/openbox/rc.xml
sed -i "s/<position>Bottom<\/position>/<position>Right<\/position>/" ~/.config/openbox/rc.xml

#riavvia tint2
killall -SIGUSR1 tint2
openbox --reconfigure
# end of script 