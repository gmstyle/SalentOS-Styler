#!/bin/bash
# Barra Tint2 Time (OFF)
# Created by the SalentOS Staff 
# Author: Lanto

clear

grep "Clock" ~/.config/tint2/tint2rc; 

if [ "$?" == "1" ];
  then
   echo "Clock is already disabled!";
  else
   grep "#time1_format*" ~/.config/tint2/tint2rc;
    if [ "$?" == "0" ];
     then
       echo "Clock is already disabled!";
     else
       sed -i "s/time1_format/#time1_format/g" ~/.config/tint2/tint2rc
       #riavvia tint2
       killall -SIGUSR1 tint2
fi;
fi;

# end of script 