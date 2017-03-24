#!/bin/bash
# dock off

# checking if dock is active, then activate/deactivate it.

function deactive {
ps -U root -u root -N > ~/.config/styler/function/proc.txt;
dock=`grep -c "tint2" ~/.config/styler/function/proc.txt;`
$dock
   
    if [ "$dock" == "2" ];
      then
        killall tint2;
	tint2;
        rm ~/.config/styler/function/proc.txt;
      else
        echo "dock isn't running";
    fi;
}

echo "Start: " $(date +%s)
sleep 1s && kill $$ &
while sleep 0.5; do deactive; done
echo "End: " $(date +%s)


# end of script