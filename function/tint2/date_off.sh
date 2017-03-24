#!/bin/bash
# Barra Tint2 Date (OFF)
# Created by the SalentOS Staff 
# Author: Lanto

clear;

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
  then
     zenity --info --text="Clock is not enabled!" --title="clock settings" --width=200 --height=70;
  else
     grep "#time2_format*" ~/.config/tint2/tint2rc;
     if [ "$?" == "0" ];
      then
       echo "Date is already disabled!";
      else
      grep "time2_format*" ~/.config/tint2/tint2rc; 
      if [ "$?" == "1" ];
       then
        echo "Date is already disabled!";
       else
        sed -i "s/time2_format*/#time2_format/g" ~/.config/tint2/tint2rc;
         killall -SIGUSR1 tint2
      fi;
     fi;
fi;

# end of script 
