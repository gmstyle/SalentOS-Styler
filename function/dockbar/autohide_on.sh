#!/bin/bash
# Autohide ON  (autohide=1)
# Created by the SalentOS Staff blog.salentOS.it 
# Author: Ciotola Rosario blogsalentos@gmail.com
sed -i '175s/.*/<autoHide>yes<\/autoHide>/' ~/.config/openbox/rc.xml;
#riavvia tint2
openbox --reconfigure
# end of script 