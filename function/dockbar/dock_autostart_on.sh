#!/bin/bash
# enable conky autostart

function verify_dock {
  grep "(sleep 6 && tint2 -c" ~/.config/openbox/autostart.sh;
   if [ "$?" == "1" ];
     then 
       echo "#(sleep 6 && tint2 -c ~/.config/tint2/dock_tint2rc) &" >> ~/.config/openbox/autostart.sh;
       enable_dock;
     else
       enable_dock;
   fi;
}


function enable_dock {
  grep "#(sleep 6 && tint2 -c" ~/.config/openbox/autostart.sh;
   if [ "$?" == "0" ];
     then 
       sed -i 's/#(sleep 6/(sleep 6/g' ~/.config/openbox/autostart.sh;
     else
       echo "dock enabled";
   fi;
}

verify_dock;

# end of script