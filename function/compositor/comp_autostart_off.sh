#!/bin/bash
# disable compton autostart

function comp_off {
  grep "#compton --config" ~/.config/openbox/autostart.sh;
   if [ "$?" == "1" ];
     then 
       sed -i "s/compton --config*/#compton --config/g" ~/.config/openbox/autostart.sh;
     else
       echo "compton autostart is already disabled";
   fi;
}

comp_off;

# end of script