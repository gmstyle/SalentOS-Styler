#!/bin/bash
####################################################
# partetre.sh vers 1.2 (feb 2015)
# revisione (luglio 2016) 
# ORD  Launchers on tint2bar
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
s=-1
k=0
IFS=$'\n'
T=`grep  launcher_item ~/.config/tint2/tint2rc`
TESTO=`cat ~/.config/tint2/tint2rc`
# Estrae la prima parte fino al primo  launcher e lo assegna alla var T1
T1=${TESTO%%launcher_item_app = *}
b=${#T1}
b=$((b-1))
T1=${T1:0:$b}
# La variabile T3 contiene il testo da dopo launcher end
for i in $T;do
    a=$i
    f=${i#*= }
    if [ -e $f ]; then       
		if [ ${i:0:1} != '#' ]; then  
		   riga[k]=$i;k=$((k+1))   
		fi
	fi	
done
T3=${TESTO#*$a}
tasto=2
until [ $tasto -lt 2 ]; do
      case  $tasto in
             100)
                 # tasto UP
                 iup=$((s-1))
                 if [ $iup -ge 0 ];then    
                     DS=${riga[iup]}
                     riga[iup]=${riga[s]}
                     riga[s]=$DS
                     s=$((s-1))
                  fi                 
               ;;         
             200)
                 # tasto DOWN
                 idown=$((s+1))
                 if [ $idown -lt $k ];then     
                      DS=${riga[idown]}
                      riga[idown]=${riga[s]}
                      riga[s]=$DS
	              s=$((s+1))
		fi
             ;;  
             252)
                 # tasto x finestra uscita
                 exit
             ;;  
          esac
          j=0;l=0;
          for ((m=0;m<k; m++ )); do
              f=${riga[m]#*= }
              IC=`grep Icon= $f`
              lanc=${riga[m]##*/}
              lanc=${lanc%.*}
              if [ $s -eq $m ]; then
                lista[j]="true"
               else
                lista[j]="false"
              fi
              j=$((j+1))
              lista[j]=$m;j=$((j+1))
              IC=${IC#*Icon=}
              BA=${IC:0:1}
               if [ "$BA" = "/" ]; then          
				  cp $IC  /tmp/
				  IC=${IC##*/}              
				  IC="$IC"         
				  mogrify -resize  22x22 /tmp/$IC 
				 IC="/tmp/$IC"	
              fi                        
              lista[j]=$IC;j=$((j+1))   
              lista[j]=$lanc;j=$((j+1))       
           done
           s=$(yad --title="SalentOS Styler - Sort Launchers" --window-icon=/usr/share/pixmaps/menu.png --image-on-top \
           --width=300 --height=500 --center --list \
           --text="\n Sort Position of Launcher\n Select and move it with  [UP] [DOWN]\n" --radiolist --column="SEL" --separator=" " \
           --column="Pos" --column="  ":IMG --column="Launcher" --no-click --print-column=2  "${lista[@]}" \
           --button=UP:100 --button=DOWN:200 --button=gtk-cancel:1 --button=gtk-apply:0 )
			tasto=`echo $?`  
done  
if [ $tasto -eq 0 ]; then 
   #ricostruzione del file tint2rc"
   # tint2rc composto da T1+LA+T3
   for ((m=0;m<k;m++)) ; do
       LA="$LA\n${riga[m]}"
   done
   for i in $T; do
       if [ ${i:0:1} = '#' ]; then    
           LA="$LA\n$i"
       fi
    done
    TOTA="$T1$LA$T3"
    echo -e "$TOTA" > ~/.config/tint2/tint2rc
    #riavvia tint2
    killall -SIGUSR1 tint2
fi
exit
# end of script 
