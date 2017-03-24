#!/bin/bash
# Compositing on

# checking if compositor is active, then activate/deactivate it.

function active {
  ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "compton" ~/.config/styler/function/proc.txt;
   
    if [ "$?" == "1" ];
      then
        compton --config ~/.config/compton.conf -cCb;
        rm ~/.config/styler/function/proc.txt;
      else
        echo "compositor is already active";
    fi;
} 

active;

# end of script