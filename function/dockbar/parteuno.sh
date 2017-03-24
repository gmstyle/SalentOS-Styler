#!/bin/bash
####################################################
# parteuno.sh vers 1.2 (marzo 2015)
# revisione (luglio 2016) 
# REMOVE Launchers on tint2bar
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
IFS=$'\n'
T=`grep  launcher_item ~/.config/tint2/dock_tint2rc`
k=0
for i in $T; do
    if [ ${i:0:1} != '#' ]; then    
       f=${i#*= }
       if [ -e $f ]; then
          lanc=${f#*/usr/share/applications/}    
          lista[k]="false";k=$((k+1)) 
          IC=`grep Icon= $f`
          IC=${IC#*Icon=}
          BA=${IC:0:1}
           linea[j]="false";j=$((j+1))
        BA=${IC:0:1}
        if [ "$BA" != "/" ]; then
           IC=${IC##*/}              
           IC="$IC"
           else 
			cp $IC  /tmp/
			IC=${IC##*/}              
            IC="$IC"         
			mogrify -resize  22x22 /tmp/$IC 
			IC="/tmp/$IC"	
        fi
          lista[k]=$IC;k=$((k+1))   
          lista[k]=${lanc%%.*};k=$((k+1))
          lista[k]=$lanc;k=$((k+1))
        fi
    fi
done
s=$(yad --title="SalentOS Styler - Remove Launchers" --window-icon=/usr/share/pixmaps/menu.png --image-on-top --width=300 --height=500 \
	--center --list --text="\n Select Launchers to REMOVE\n" --checklist --column="CANC" --separator="\n" --column="  ":IMG \
	--column="Launcher" --column="desk"  --hide-column=4 --print-column=4 "${lista[@]}")
if [ "$s" != "" ]; then
   for i in $s ;do
       #cancella le righe da eliminare
       sed -i /"$i"/d  ~/.config/tint2/dock_tint2rc
    done
    #riavvia tint2
    killall -SIGUSR1 tint2
fi
# end of script 
