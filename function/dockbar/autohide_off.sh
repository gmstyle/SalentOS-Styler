#!/bin/bash
# Barra Tint2 position TOP - ALTO  (panel_position = top center horizontal)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
sed -i "s/<autoHide>yes<\/autoHide>/<autoHide>no<\/autoHide>/" ~/.config/openbox/rc.xml;
#riavvia tint2
killall -SIGUSR1 tint2
openbox --reconfigure
# end of script 
