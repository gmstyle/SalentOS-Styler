#!/bin/bash
# disable conky autostart

function disable_conky {
  grep "#(sleep 5 && conky" ~/.config/openbox/autostart.sh;
   if [ "$?" == "1" ];
     then 
       sed -i 's/(sleep 5/#(sleep 5/g' ~/.config/openbox/autostart.sh;
     else
       echo "conky autostart is already disabled";
   fi;
}

disable_conky;

# end of script