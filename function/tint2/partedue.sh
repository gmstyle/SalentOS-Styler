#!/bin/bash
####################################################
# partedue.sh vers 1.2 (marzo 2015)
# revisione (luglio 2016) 
# ADD Launchers on tint2bar
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
echo "ATTENDI STO ESTARENDO I LAUNCHER DA INSTALLARE ........."
echo ""
IFS=$'\n'
T=`grep  launcher_item ~/.config/tint2/tint2rc`
T2=$T
TESTO=`cat ~/.config/tint2/tint2rc`
# Estrae la prima parte fino al primo  launcher e lo assegna alla var T1
T1=${TESTO%%launcher_item_app = *}
# La variabile T3 contiene il testo da dopo launcher end
for i in $T2;do
    #echo $i
    a=$i
done
T3=${TESTO#*$a}
k=0
for i in $T; do
    if [ ${i:0:1} != '#' ]; then    
       f=${i#*= }
       if [ -e $f ]; then
           # exit
           lista[k]=${f};k=$((k+1))   
       fi
    fi
done
### Genera lista file applications .desktop
j=0
for f in /usr/share/applications/*.desktop ;do 
    flag=0
    # verifica se il launcher è già installato
    for (( l=0 ; l<$k; l++)) ; do
         if [ ${lista[l]} = $f ];then
            flag=1
            l=$k
         fi
    done
    if [ $flag -eq 0 ];then    
        IC=`grep Icon= $f`
        IC=${IC#*Icon=}
        comm=`grep Comment= $f`
        comm=${comm#*Comment=}
        comm=${comm:0:40}
        nome=${f#*/usr/share/applications/} 
        nome=${nome%.*}
        linea[j]="false";j=$((j+1))
        BA=${IC:0:1}
        echo "ic $IC"
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
        linea[j]=$IC;j=$((j+1))          
        linea[j]=$nome;j=$((j+1))
        linea[j]=$f;j=$((j+1))
        linea[j]=$comm;j=$((j+1))
     fi   
done
	s=$(yad --title="SalentOS Styler - ADD Launchers" --window-icon=/usr/share/pixmaps/menu.png --image-on-top --width=700 --height=600 \
	--center --list --text="\n Select Launchers to ADD\n" --checklist --column="ADD" --separator="\n"  --column="    ":IMG \
	--column="Launcher "  --column="nome del file" --column="Comment      " --hide-column=4 --print-column=4 "${linea[@]}" ) 
	if [ "$s" != "" ]; then
   # ricostruzione del file tint2rc
   # tint2rc composto da T1+T2+LA+T3
   for i in $s; do
       LA="$LA\nlauncher_item_app = $i"
    done
    TOTA="$T1$T2$LA$T3"
    echo -e "$TOTA" > ~/.config/tint2/tint2rc
    # riavvia tint2
    killall -SIGUSR1 tint2
fi
exit
# end of script 
