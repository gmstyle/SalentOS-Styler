#!/bin/bash
# Dock on

# checking if dock is active, then activate/deactivate it.

function active {
ps -U root -u root -N > ~/.config/styler/function/proc.txt;
dock=`grep -c "tint2" ~/.config/styler/function/proc.txt;`
$dock
   
    if [ "$dock" == "1" ];
      then
        tint2 -c ~/.config/tint2/dock_tint2rc;
        rm ~/.config/styler/function/proc.txt;
      else
        echo "dock already running"; 
    fi;
}

echo "Start: " $(date +%s)
sleep 1s && kill $$ &
while sleep 0.5; do active; done
echo "End: " $(date +%s)

# end of script