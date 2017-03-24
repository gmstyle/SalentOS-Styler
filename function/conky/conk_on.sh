#!/bin/bash
# Conky on

# checking if conky is active, then activate/deactivate it.

function active {
  ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "conky" ~/.config/styler/function/proc.txt;
   
    if [ "$?" == "1" ];
      then
        conky -d;
        rm ~/.config/styler/function/proc.txt;
      else
        echo "conky is already active";
    fi;
} 

active;

# end of script