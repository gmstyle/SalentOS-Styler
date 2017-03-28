#!/bin/bash

# File Name:mytint2rc
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

function restore_default {
if [ "$?" == "0" ];
     then 
       cp ~/.config/tint2/default_dock_tint2rc ~/.config/tint2/dock_tint2rc;
     else
       echo "You don't want restore to default";
   fi;
}

case $LANG in

       en* )

zenity --question --text="The dockbar will be restored to default.\nAre you sure you wish to proceed?"
;;

 it* )

zenity --question --text="La dockbar verrà ripristinata alle impostazioni iniziali.\nVuoi procedere?"
;;

 pt* )

zenity --question --text="A dockbar será redefinida para as configurações iniciais.\nVocê deseja continuar?"
;;

 de* )

zenity --question --text="Die dockbar wird auf die Werkseinstellungen zurückgesetzt werden.\n Wollen Sie fortfahren?"
;;

 es* )
zenity --question --text="La dockbar se restablecerá a los ajustes iniciales.\n¿Quieres continuar?"
;;

 fr* )

zenity --question --text="Le dockbar sera réinitialisé aux réglages initiaux.\nVoulez-vous continuer?"
;;

* )

zenity --question --text="The dockbar will be restored to default.\nAre you sure you wish to proceed?"

esac
restore_default;
killall -SIGUSR1 tint2;
exit