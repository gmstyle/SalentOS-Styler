#!/bin/bash
# Barra Tint2 Time (ON)
# Created by the SalentOS Staff 
# Author: Lanto

clear;

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
      then
       sed -i '/# End of config/i\#Clock\n time1_format = %H:%M\n time1_font = Liberation Sans 11 bold\n clock_font_color = #FFFFFF 100' ~/.config/tint2/tint2rc;
       killall -SIGUSR1 tint2
  else
     grep "#time1_format*" ~/.config/tint2/tint2rc;
  if [ "$?" == "0" ];
  then
   sed -i "s/#time1_format = %H:%M/time1_format = %H:%M/g" ~/.config/tint2/tint2rc;
   killall -SIGUSR1 tint2
  else
   echo "Clock is already enabled!";
 fi;
fi;

# end of script 