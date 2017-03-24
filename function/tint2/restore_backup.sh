#!/bin/bash
# File Name:restore_last_backup
# Purpose: Tint2_Theme_Manager
# Authors: Lanto SalentOS Community
#This program is free software; you can redistribute it and-or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
################################################################################# 

function restore_backup {
if [ "$?" == "0" ]; then
	
	rm -f ~/.config/tint2/tint2rc && cp ~/.config/tint2/my_tint2rc_backup ~/.config/tint2/tint2rc;
     else
       echo "You don't want restore last backup";
   fi;


case $LANG in

       en* )

zenity --question --text="The panel will be restored to your last backup.\nAre you sure you wish to proceed?"
;;

 it* )

zenity --question --text="Il pannello verrà ripristinato al tuo ultimo backup.\nVuoi procedere?" 
;;

 pt* )

zenity --question --text="O painel irá repor o último backup.\nVocê deseja continuar?"
;;

 de* )

zenity --question --text="Das Panel wird zurückgesetzt letzten Sicherung.\n Wollen Sie fortfahren?"
;;

 es* )

zenity --question --text="El panel se restablecerá a su última copia de seguridad.\n¿Quieres continuar?"
;;

 fr* )

zenity --question --text="Le panneau sera réinitialisé votre dernière sauvegarde.\nVoulez-vous continuer?"
;;

* )

zenity --question --text="The panel will be restored to your last backup.\nAre you sure you wish to proceed?"
esac

}

function verify { 
if [ -f ~/.config/tint2/my_tint2rc_backup ]; then
    echo "File esiste"
    restore_backup;
    killall -SIGUSR1 tint2;
  else
    case $LANG in

       en* )

zenity --warning --text="No backup to restore. Make one before."
;;

 it* )

zenity --warning --text="Nessun backup da ripristinare. Creane prima uno." 
;;

 pt* )

zenity --warning --text="Nenhum backup para restaurar. Faça um antes."
;;

 de* )

zenity --warning --text="Keine Sicherung wiederherstellen. Machen Sie einen vor."
;;

 es* )

zenity --warning --text="Ninguna copia de seguridad para restaurar. Hacer una antes."
;;

 fr* )

zenity --warning --text="Pas de sauvegarde à restaurer. Faire un avant.";;

* )

zenity --warning --text="No backup to restore. Make one before."

esac

fi

}


verify;

# end of script