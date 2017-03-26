#!/bin/bash
# Barra Tint2 position BOTTOM - BASSO  (panel_position = bottom center horizontal)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
clear
sed -i "s/panel_position = center left vertical/panel_position = bottom center horizontal/" ~/.config/tint2/dock_tint2rc
sed -i "s/panel_position = center right vertical/panel_position = bottom center horizontal/" ~/.config/tint2/dock_tint2rc
sed -i "s/panel_position = top center horizontal/panel_position = bottom center horizontal/" ~/.config/tint2/dock_tint2rc

sed -i "s/<position>Top</position>/<position>Bottom</position>/" ~/.config/openbox/rc.xml
sed -i "s/<position>Left</position>/<position>Bottom</position>/" ~/.config/openbox/rc.xml
sed -i "s/<position>Right</position>/<position>Bottom</position>/" ~/.config/openbox/rc.xml

#riavvia tint2
killall -SIGUSR1 tint2
openbox --reconfigure
# end of script 
