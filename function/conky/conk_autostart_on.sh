#!/bin/bash
# enable conky autostart

function enable_conky {
  grep "#(sleep 5 && conky" ~/.config/openbox/autostart.sh;
   if [ "$?" == "0" ];
     then 
       sed -i 's/#(sleep 5/(sleep 5/g' ~/.config/openbox/autostart.sh;
     else
       echo "conky autostart is already enabled";
   fi;
}

enable_conky;

# end of script