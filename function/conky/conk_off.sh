#!/bin/bash
# Conky off

# checking if conky is active, then activate/deactivate it.

function deactive {
  ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "conky" ~/.config/styler/function/proc.txt;
   
    if [ "$?" == "0" ];
      then
        killall conky;
        rm ~/.config/styler/function/proc.txt;
      else
        echo "conky isn't running";
    fi;
}

deactive;


# end of script