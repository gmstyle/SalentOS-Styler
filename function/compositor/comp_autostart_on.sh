#!/bin/bash
# enable compton autostart

function check_comp {
  grep "#compton" ~/.config/openbox/autostart.sh;
   if [ "$?" == "0" ];
     then 
       sed -i "s/#compton --config*/compton --config/g" ~/.config/openbox/autostart.sh;
     else
       echo "compton autostart isn't enabled";
   fi;
}

check_comp;

# end of script