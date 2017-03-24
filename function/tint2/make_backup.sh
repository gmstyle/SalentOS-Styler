#!/bin/bash


rm -f ~/.config/tint2/my_tint2rc_backup;
cp ~/.config/tint2/tint2rc ~/.config/tint2/my_tint2rc_backup;

case $LANG in

       en* )

zenity --info --text="Backup created!";;

 it* )

zenity --info --text="Backup creato con successo!";;

 pt* )

zenity --info  --text="Backup criado!";;

 de* )

zenity --info - --text="Backup erstellt!";;

 es* )

zenity --info  --text="Copia de seguridad creada!";;

 fr* )

zenity --info  --text="Sauvegarde créé!";;

* )

zenity --info --text="Backup created!"

esac;

#end of script

