#!/bin/bash
# Apply
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Lanto

/usr/local/bin/styler/function/tint2/backup.sh;
cp $HOME/.config/styler/function/tint2/tint2rctemp $HOME/.config/tint2/tint2rc;
rm -f $HOME/.config/styler/function/tint2/tint2rctemp;
killall -SIGUSR1 tint2;
exit