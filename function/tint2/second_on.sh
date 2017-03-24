#!/bin/bash
# Barra Tint2 Second (ON)
# Created by the SalentOS Staff 
# Author: LuigiAntonio

clear;

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
  then
   zenity --info --text="Clock is disabled!" --title="clock settings" --width=200 --height=70;
  else
   grep "%S" ~/.config/tint2/tint2rc; 
   if [ "$?" == "0" ];
    then
      zenity --info --text="Seconds are already enabled!" --title="clock settings" --width=200 --height=70;
    else
      grep "%I" ~/.config/tint2/tint2rc;  
      if [ "$?" != "0" ];
       then
        sed -i "s/time1_format = %H:%M/time1_format = %H:%M:%S/g" ~/.config/tint2/tint2rc;
        killall -SIGUSR1 tint2
       else
        sed -i "s/time1_format = %I:%M/time1_format = %I:%M:%S/g" ~/.config/tint2/tint2rc;
        killall -SIGUSR1 tint2
      fi;
   fi;
fi;

# end of script 