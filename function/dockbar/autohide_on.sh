#!/bin/bash
# Autohide ON  (autohide=1)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
sed -i "s/autohide = 0/autohide = 1/" ~/.config/tint2/dock_tint2rc
#riavvia tint2
killall -SIGUSR1 tint2
openbox --reconfigure
# end of script 
