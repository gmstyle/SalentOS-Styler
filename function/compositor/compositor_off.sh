#!/bin/bash
# Compositing off

# checking if compositor is active, then activate/deactivate it.

function deactive {
  ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "compton" ~/.config/styler/function/proc.txt;
   
    if [ "$?" == "0" ];
      then
        killall compton;
        rm ~/.config/styler/function/proc.txt;
      else
        echo "compositor isn't active";
    fi;
}

deactive;


# end of script