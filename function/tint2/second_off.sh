#!/bin/bash
# Barra Tint2 Second (OFF)
# Created by the SalentOS Staff 
# Author: Lanto

clear;

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
  then
   zenity --info --text="Clock is disabled!" --title="clock settings" --width=200 --height=70;
  else
   grep "%S" ~/.config/tint2/tint2rc; 
   if [ "$?" == "1" ];
    then
      zenity --info --text="Seconds are already disabled!" --title="clock settings" --width=200 --height=70;
    else
     grep "%I" ~/.config/tint2/tint2rc;  
     if [ "$?" == "1" ];
      then
       sed -i "s/time1_format = %H:%M:%S/time1_format = %H:%M/g" ~/.config/tint2/tint2rc;
       killall -SIGUSR1 tint2;
      else
       sed -i "s/time1_format = %I:%M:%S/time1_format = %I:%M/g" ~/.config/tint2/tint2rc;
       killall -SIGUSR1 tint2;
    fi;
   fi;
fi;

# end of script 