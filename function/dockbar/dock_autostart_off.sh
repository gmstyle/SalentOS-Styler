#!/bin/bash
# disable dock autostart

function disable_dock {
  grep "#(sleep 6 && tint2 -c ~/.config/tint2/dock_tint2rc)" ~/.config/openbox/autostart.sh;
   if [ "$?" == "1" ];
     then 
       sed -i 's/(sleep 6/#(sleep 6/g' ~/.config/openbox/autostart.sh;
     else
       echo "dock is already disabled";
   fi;
}

disable_dock;

# end of script