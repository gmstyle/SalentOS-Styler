#!/bin/bash
# Barra Tint2 position TOP - ALTO  (panel_position = top center horizontal)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
sed -i "s/autohide = 1/autohide = 0/" ~/.config/tint2/tint2rc
#riavvia tint2
killall -SIGUSR1 tint2
# end of script 
