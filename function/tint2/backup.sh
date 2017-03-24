#!/bin/bash

function backup {
if [ "$?" == "0" ];
     then 
       cp ~/.config/tint2/tint2rc ~/.config/tint2/my_tint2rc_backup;
     else
       echo "You don't want a backup";
   fi;
}

case $LANG in

       en* )

zenity --question --text="You can create a backup file of your tint2 panel if something goes wrong.\nDo you want it?";;

 it* )

zenity --question --text="E' possibile creare un file di backup del tuo pannello tint2.\nVuoi crearlo?";;

 pt* )

zenity --question --width=500 --height=80 --text="Você pode criar um arquivo de backup do seu painel de tint2.\nVocê quer?";;

 de* )

zenity --question --width=500 --height=80 --text="Sie können eine Sicherungsdatei Ihrer tint2 Panel erstellen.\nWillst du es?";;

 es* )

zenity --question --width=500 --height=80 --text="Se puede crear un archivo de copia de seguridad del panel de tint2.\n¿Lo quieres?";;

 fr* )

zenity --question --width=500 --height=80 --text="Vous pouvez créer un fichier de sauvegarde de votre panneau de tint2.\nEst-ce que tu le veux?";;

* )

zenity --question --text="You can create a backup file of your tint2 panel if something goes wrong.\nDo you want it?"

esac
backup;

#end of script

