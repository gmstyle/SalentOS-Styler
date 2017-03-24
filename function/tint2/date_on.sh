#!/bin/bash
# Barra Tint2 Date (ON)
# Created by the SalentOS Staff 
# Author: Lanto

clear;

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
  then
     echo "Clock is not enabled!";
  else
     grep "#time2_format*" ~/.config/tint2/tint2rc;
     if [ "$?" == "0" ];
      then
       sed -i "s/#time2_format*/time2_format/g" ~/.config/tint2/tint2rc;
       killall -SIGUSR1 tint2
      else
       grep "time2_format*" ~/.config/tint2/tint2rc;
       if [ "$?" == "0" ];
        then
         echo "Date is already enabled!";
        else
         sed -i '/time1_font*/i\time2_format = %A %d %B\ntime2_font = sans 6' ~/.config/tint2/tint2rc;
         killall -SIGUSR1 tint2
       fi; 
     fi;
fi;

# end of script 