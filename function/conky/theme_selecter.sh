#!/bin/bash
#  
####################################################
# SalentOS  Conky Selecter
# versione 1.0 (gen 2016)
# Permette di scegliere i Conky da quelli contenuti
# nella cartella .conky
#  Authors: Rosario Ciotola - SalentOS Community
# email : blogsalentos@gmail.com
# www.salentos.it
###################################################

TEXTDOMAINDIR=/usr/share/locale
export TEXTDOMAINDIR
TEXTDOMAIN=theme_selecter.sh
export TEXTDOMAIN

function conky_sel {
clear
IFS=$'\n'
k=0
j=0

for f in  `dir -1 ~/.conky/` ;do
		D[k]=$j;j=$((j+1));k=$((k+1))
		D[k]="false";k=$((k+1))	   
		D[k]=$f;k=$((k+1))		
		if [ !  -e  ~/.conky/$f/thumb.png ];then
			# crea thumb
			convert  -scale 33%  ~/.conky/$f/image.png  ~/.conky/$f/thumb.png
		fi	
		D[k]=`echo ~/.conky/$f/thumb.png`
		k=$((k+1))   
done  
#D[1]='true'
flag=0
while [ $flag -eq 0 ]; do
	s=$(yad --title="`gettext $"SalentOS Conky Selecter"`" --window-icon=/usr/share/pixmaps/menu.png \
	--image-on-top  --width=600 --height=600 --center --list --grid-lines=hor --text="`gettext $"Choose your Conky"`" \
	--separator=" "  --column="nr" --column="sel":HD --column="`gettext $"Conky Name"`"\
	--column="`gettext $"Image"`":IMG --hide-column=1 --print-column=1 "${D[@]}" \
	--button="`gettext $"Preview"`":100  --button=gtk-apply:0  --button=gtk-cancel:1 )
	tasto=`echo $?`
	# /usr/share/pixmaps/bulb.png
	if [ "$s" != "" ];then
		l=${#s};l=$((l-1));s=${s:0:$l}
	fi
	n1=$((s*4+1))
	d1=$((n1+1))
	case $tasto in
		 100)
		    # Preview
	      	    echo "~/.conky/"${D["$d1"]}"/image.png" 
		    yad --title="`gettext $"SalentOS Conky Selecter"`" --window-icon=/usr/share/pixmaps/menu.png \
		    --text="`gettext $"Preview of conky"`" --image-on-top  --width=400 --height=500  --list  \
		    --column="":IMG ~/.conky/"${D["$d1"]}"/image.png  --center --no-buttons  
       		 ;;
  		 252)
                 # tasto x finestra uscita
                 exit
             	 ;;  
                  0)
           	   cp  ~/.conky/"${D["$d1"]}"/.conkyrc  ~/		
		  ;;
         	1) 
                 flag=1
		;;  
	esac
done     

}

function conky_check {
 ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "conky" ~/.config/styler/function/proc.txt;
   if [ "$?" -eq "0" ];
    then
     echo "conky attivo e cambia il tema";
     conky_sel;
    else
     echo "Conky non attivo. attivarlo prima";
     case $LANG in

       en* )

zenity --warning --text="Conky is not enabled. Please enable it first to choose a theme."
;;

 it* )

zenity --warning --text="Conky non è abilitato. Abilitalo prima di scegliere un tema." 
;;

 pt* )

zenity --warning --text="Conky não está habilitado. Habilitá-lo em primeiro lugar."
;;

 de* )

zenity --warning --text="Conky nicht aktiviert ist. Aktivieren Sie es zuerst."
;;

 es* )

zenity --warning --text="Conky no está activado. Activarlo antes de elegir un tema"
;;

 fr* )

zenity --warning --text="Conky est pas activé. Activer avant de choisir un thème"
;;

* )

zenity --warning --text="Conky is not enabled. Please enable it first to choose a theme."

esac
   fi;
}

conky_check;
exit