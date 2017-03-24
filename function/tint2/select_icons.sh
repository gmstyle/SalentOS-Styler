#!/bin/bash
#  
####################################################
# SalentOS  Luppiu Select Icons Theme
# versione 1.0  (settembre 2016)
# Permette di selezionare tema icone
# nella cartella /usr/share/icons 
#  Authors: Rosario Ciotola - SalentOS Community
# email : blogsalentos@gmail.com
# www.salentos.it
###################################################
TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAINDIR
TEXTDOMAIN=select_icons.sh
export TEXTDOMAIN
clear
IFS=$'\n'
ic=`ls /usr/share/icons`
a=`grep "launcher_icon_theme =" ~/.config/tint2/tint2rc`
a1=${a#*= }
th=""
for i in $ic ;do
    if [ "$i" = "$a1" ];then
          th="$th^"
    fi
    th="$th$i,"		
	j=$((j+1))
done
#verifica altri temi icone nella HOME
if [ -d ~/.icons ];then
	#esiste la cartella ~/.icons
	ic=`ls ~/.icons`
	for i in $ic ;do
		if [ "$i" = "$a1" ];then
          th="$th^"
		fi
		th="$th$i,"		
		j=$((j+1))
	done	
fi	
l=${#th};l=$((l-1));th=${th:0:$l}
scelta=$(yad --form --item-separator="," --field="`gettext $"Theme"`":CB "$th" --center \
	     --title="`gettext $"Select Tint2 Icon Theme"`" \
             --window-icon=/usr/share/pixmaps/menu.png --image-on-top \
	     --width=320 --height=80 --text="`gettext $"Select Icons Theme"`" )
if [ "$scelta" != "" ];then
	l=${#scelta};l=$((l-1));scelta=${scelta:0:$l}
	b="launcher_icon_theme = $scelta"
	sed -i "s/$a/$b/"  ~/.config/tint2/tint2rc
	#riavvia tint2
	killall -SIGUSR1 tint2
fi	
exit
#end of script
