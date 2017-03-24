#!/bin/bash
# SalentOS  Launcher Manager
####################################################
# SalentOS Item Selecter 
# versione 1. (feb 2017)
# Ordina gli items dal pannello tint2
# realizzato da Rosario Ciotola
# per SalentOS Luppiu
# email : blogsalentos@gmail.com
# www.salentos.it
###################################################
clear
T=`grep  panel_items ~/.config/tint2/tint2rc`
T1=${T#*= }
l=${#T1}
j=0
n=0
E=''
for ((i=0;i<$l;i++));do
	 p=${T1:i:1}
	 case $p in
		  L)
		  lista[j]=$n;n=$((n+1));j=$((j+1))
		  lista[j]="L show Launcher"
		  j=$((j+1))
		  ;;
		  T)
		  lista[j]=$n;n=$((n+1));j=$((j+1))
		  lista[j]="T  show Taskbar"
		  j=$((j+1))
		  ;;
		  S)
		  lista[j]=$n;n=$((n+1));j=$((j+1))
		  lista[j]="S  show Systray"
		  j=$((j+1))
		  ;;
		  B)
		  lista[j]=$n;n=$((n+1));j=$((j+1))
		  lista[j]="B  show Battery"
		  j=$((j+1))
		  ;;
		  C)
		  lista[j]=$n;n=$((n+1));j=$((j+1))
		  lista[j]="C show Clock"
		  j=$((j+1))
		  ;;
		  E)
		  E="$E""E";;
	  esac
done
echo $E
tasto=100
until [ $tasto -lt 4 ]; do
	  s=$(yad --title="Select item on panel" \
        --window-icon=/usr/share/pixmaps/menu.png  --image-on-top \
        --text-align=center --image=/usr/local/bin/styler/function/tint2/images/ltsbc.png \
        --width=300 --height=300 --center --list  --hide-column=1 --grid-lines=hor\
        --text="\n<b>Sort</b> items [<i>UP</i>] [<i>DOWN</i>]\n" \
        --column="nr":NUM --column="Item on panel" --no-click --print-column=1\
         "${lista[@]}"  --button=UP:100 --button=DOWN:200 \
         --button=gtk-apply:0 --button=gtk-cancel:1 --button="Restore LTSBC":4  \
          --multiple --separator=" " --dclick-action=none)       
		tasto=$?     
		echo "tasto $tasto"
		echo "selezione $s"		
      case  $tasto in
             100)
                 # tasto UP
                 iup=$((s-1))
                 if [ $iup -ge 0 ];then    
                     k1=$((s*2));k1=$((k1+1))
                     k2=$((iup*2));k2=$((k2+1))
                     DS=${lista[k2]}
                     lista[k2]=${lista[k1]}
                     lista[k1]=$DS
                     #s=$((s-1))
                fi                 
				;;         
             200)
                 # tasto DOWN
                 idown=$((s+1))
                 if [ $idown -lt $n ];then     
					k1=$((s*2));k1=$((k1+1))
					k2=$((idown*2));k2=$((k2+1))
                    DS=${lista[k2]}
                    lista[k2]=${lista[k1]}
                    lista[k1]=$DS
                    # s=$((s+1))
				fi
				;;  
				 4)
                 # Ripristina LTSBC
                 sed  -i "s/panel_items = $T1/panel_items = LTSBC$E/" ~/.config/tint2/tint2rc
				#riavvia tint2
				killall -SIGUSR1 tint2
				exit
                 ;;                
             252)
                 # tasto x finestra uscita
                 exit
             ;;  
esac
done
if [ $tasto -eq 0 ];then
	#calcola la nuova stringa
	j=1
	new=""
	for ((i=0;i<$n;i++));do
		j=$((1+i*2))
		new="$new${lista[j]:0:1}"
	done
	#scrive sul file tint2
	sed  -i "s/panel_items = $T1/panel_items = $new$E/" ~/.config/tint2/tint2rc
	#riavvia tint2
    killall -SIGUSR1 tint2
fi
exit    
#end of script
