#!/bin/bash
# Apply
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Lanto
# Set 24h or am/pm

clear

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
  then
     zenity --info --text="Clock is not enabled!" --title="clock settings" --width=200 --height=70;
  else

   grep "time1_format = %H:%M" ~/.config/tint2/tint2rc; 
   if [ "$?" == "0" ];
    then
     sed -i "s/time1_format = %H:%M/time1_format = %I:%M/g" ~/.config/tint2/tint2rc;
     killall -SIGUSR1 tint2
    else
     sed -i "s/time1_format = %I:%M/time1_format = %H:%M/g" ~/.config/tint2/tint2rc;
     killall -SIGUSR1 tint2
   fi;
fi;

# end of script 