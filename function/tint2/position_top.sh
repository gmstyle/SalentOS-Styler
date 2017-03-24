#!/bin/bash
# Barra Tint2 position TOP - ALTO  (panel_position = top center horizontal)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
clear
sed -i "s/panel_position = top left vertical/panel_position = top center horizontal/" ~/.config/tint2/tint2rc
sed -i "s/panel_position = top right vertical/panel_position = top center horizontal/" ~/.config/tint2/tint2rc
sed -i "s/panel_position = bottom center horizontal/panel_position = top center horizontal/" ~/.config/tint2/tint2rc
#riavvia tint2
killall -SIGUSR1 tint2
# end of script 
