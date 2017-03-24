#!/bin/bash
####################################################
# sizes.sh vers 1.1 (november  2016)
# 
# Modifica il size e percentuale della barra tint2
# Authors: Rosario Ciotola - SalentOS Community
# email : blogsalentos@gmail.com
# www.salentos.it
#
# This file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
###################################################
clear
flag=0
while [ $flag -eq 0 ]; do
	val=`grep  "panel_size ="  ~/.config/tint2/tint2rc`
	v=${val#*= }
	p=${v%%%*}
	s=${v##*%}
	i=${#s};i=$((i-1))
	s=${s:1:$i}    
	A=$(yad --title="Panel size settings" --window-icon=/usr/share/pixmaps/menu.png \
		--width=250	 --height=100 --center  \
		--text-align=left --image-on-top \
		--form \
		--text="Set panel ratio" --separator=" " \
		--field="Length % :NUM" "$p!10..100!1" \
		--field="Height px:NUM" "$s!30..150!1" \
		 --button=gtk-close:1 --button=gtk-apply:0 )
	uscita=$?	
	case $uscita in
		 252)
  		    # tasto x finestra uscita
  		    flag=1
        	 ;;  
           0)
			k=0
			for j in $A; do
				v[k]=$j; k=$((k+1)) 
			done	
			new="panel_size = ${v[0]}% ${v[1]}"
			sed -i "s/$val/$new/" ~/.config/tint2/tint2rc;
			# riavvia tint2
			killall -SIGUSR1 tint2
			 ;;
         	1) 
              flag=1
		;;  
	esac
done     
#END OF SCRIPT
	
