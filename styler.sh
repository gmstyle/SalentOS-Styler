#!/bin/bash

# File Name:styler.sh
# Purpose: styler.sh
# Authors:ken SalentOS Community, Lanto
# This file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

#################################################################################
TEXTDOMAINDIR=/usr/share/locale
TEXTDOMAIN=styler.sh

# NOTE: while you edit styler source code, please remember that the preselecter use exact row numbers to set-up styler's item. 
# In case you need to add/delete one or more rows in styler, please don't forbid to update the item's row reference in the following lines.

#Verify dockbar presence#

function verify_dockbar { 
if [ -f ~/.config/tint2/dock_tint2rc ]; then
    echo "Dock exists"
  else
    echo '#---- SALENTOS LUPPÌU-----------------
#-------------------------------------
#-------------------------------------
# Gradients
#-------------------------------------
# Backgrounds
# Background 1: Separator, Tooltip
rounded = 0
border_width = 0
border_sides = TBLR
background_color = #000000 0
border_color = #000000 0
background_color_hover = #000000 0
border_color_hover = #000000 0
background_color_pressed = #000000 0
border_color_pressed = #000000 0

# Background 2: Systray
rounded = 3
border_width = 0
border_sides = TBLR
background_color = #ffffff 30
border_color = #ffffff 0
background_color_hover = #ffffff 30
border_color_hover = #ffffff 0
background_color_pressed = #ffffff 30
border_color_pressed = #ffffff 0

# Background 3: 
rounded = 3
border_width = 2
border_sides = TBLR
background_color = #4285f4 30
border_color = #4285f4 100
background_color_hover = #4285f4 30
border_color_hover = #4285f4 100
background_color_pressed = #4285f4 30
border_color_pressed = #4285f4 100

# Background 4: Inactive taskbar, Panel
rounded = 7
border_width = 1
border_sides = TBLR
background_color = #000000 40
border_color = #000000 50
background_color_hover = #000000 40
border_color_hover = #000000 50
background_color_pressed = #000000 40
border_color_pressed = #000000 50

# Background 5: Active task
rounded = 3
border_width = 0
border_sides = TBLR
background_color = #000000 100
border_color = #000000 0
background_color_hover = #000000 100
border_color_hover = #000000 0
background_color_pressed = #000000 100
border_color_pressed = #000000 0

# Background 6: Urgent task
rounded = 2
border_width = 0
border_sides = TBLR
background_color = #321818 100
border_color = #000000 0
background_color_hover = #000000 50
border_color_hover = #000000 0
background_color_pressed = #000000 50
border_color_pressed = #000000 0

#-------------------------------------
# Panel
panel_items = L
panel_size = 100% 48
panel_margin = 0 0
panel_padding = 0 4 0
panel_background_id = 4
wm_menu = 0
panel_dock = 1
panel_position = bottom center horizontal
panel_layer = top
panel_monitor = all
primary_monitor_first = 0
panel_shrink = 1
autohide = 0
autohide_show_timeout = 0.5
autohide_hide_timeout = 0.5
autohide_height = 4
strut_policy = minimum
panel_window_name = tint2
disable_transparency = 0
mouse_effects = 0
font_shadow = 0
mouse_hover_icon_asb = 100 0 10
mouse_pressed_icon_asb = 100 0 0

#-------------------------------------
# Launcher
launcher_padding = 0 0 0
launcher_background_id = 0
launcher_icon_background_id = 0
launcher_icon_size = 0
launcher_icon_asb = 100 0 0
launcher_icon_theme = Elefaenza-Blue
launcher_icon_theme_override = 0
startup_notifications = 0
launcher_tooltip = 1
launcher_item_app = /usr/share/applications/exo-terminal-emulator.desktop
launcher_item_app = /usr/share/applications/exo-file-manager.desktop
launcher_item_app = /usr/share/applications/firefox.desktop
launcher_item_app = /usr/share/applications/salentoscc.desktop
launcher_item_app = /usr/share/applications/styler.desktop
launcher_item_app = /usr/share/applications/vlc.desktop
launcher_item_app = /usr/share/applications/gimp.desktop
launcher_item_app = /usr/share/applications/synaptic.desktop
launcher_item_app = /usr/share/applications/mousepad.desktop

#-------------------------------------
# Tooltip
tooltip_show_timeout = 0.8
tooltip_hide_timeout = 0.3
tooltip_padding = 5 3
tooltip_background_id = 1
tooltip_font_color = #ffffff 100
tooltip_font = Sans 10


# End of config' >> ~/.config/tint2/dock_tint2rc;
cp ~/.config/tint2/dock_tint2rc ~/.config/tint2/default_dock_tint2rc;


fi
}

function verify_dock_autostart {
  grep "dock_tint2rc" ~/.config/openbox/autostart.sh;
   if [ "$?" == "1" ];
     then 
       echo "#(sleep 6 && tint2 -c ~/.config/tint2/dock_tint2rc) &" >> ~/.config/openbox/autostart.sh;
     else
       echo "do nothing";
   fi;
}


##PRESLECTER##
#declare variables

export serenity=false;
export sea=true;
export fos=false;
export compton=false;
export comp_aut=false;
export conky=false;
export conky_aut=false;
export panel_top=true;
export panel_bottom=false;
export panel_right=false;
export panel_left=false;

export dock=false;
export dock_aut=false;
export dock_top=true;
export dock_bottom=false;
export dock_right=false;
export dock_left=false;

export date_on=false;
export date_off=true;
export clock=true;
export seconds=false;

export dock_date_on=false;
export dock_date_off=true;
export dock_clock=true;
export dock_seconds=false;

export autohide;
export autohide_dock;

# checking about active theme and preset styler radiobutton

function serenity {
 grep "serenity" $HOME/.config/openbox/rc.xml;
  if [ "$?" == "0" ];
   then
     echo "1" > $HOME/.config/styler/checkradio.sh;
       grep "serenity" $HOME/.gtkrc-2.0;
        if [ "$?" == "0" ];
         then 
           echo "11" > $HOME/.config/styler/checkradio.sh;
         else 
          echo "not found serenity in xfce";
        fi;
   else 
    echo "not found serenity";
  fi;
  

 grep "11" $HOME/.config/styler/checkradio.sh;
  if [ "$?" == "0" ];
   then
     export serenity="true" && export sea="false" && export fos="false";
   else 
     echo "not found serenity in openbox and xfce";
  fi;
}    
    
function sea {
 grep "sea" $HOME/.config/openbox/rc.xml;
  if [ "$?" == "0" ];
   then
     echo "2" > $HOME/.config/styler/checkradio.sh;       
     grep "sea" $HOME/.gtkrc-2.0;
      if [ "$?" == "0" ];
       then 
         echo "22" > $HOME/.config/styler/checkradio.sh;
       else 
        echo "not found sea in xfce";
      fi;
   else 
     echo "not found sea in openbox";
  fi;

 grep "22" $HOME/.config/styler/checkradio.sh;
  if [ "$?" == "0" ];
   then
     export serenity="false" && export sea="true"  && export fos="false";   
   else 
     echo "not found sea in openbox and xfce";
  fi;
}

function fos {
 grep "fos" $HOME/.config/openbox/rc.xml;
  if [ "$?" == "0" ];
   then
     echo "3" > $HOME/.config/styler/checkradio.sh;       
     grep "fos" $HOME/.gtkrc-2.0;
      if [ "$?" == "0" ];
       then 
          echo "33" > $HOME/.config/styler/checkradio.sh;
       else 
         echo "not found fos in xfce";
      fi;
   else 
     echo "not found fos in openbox";
  fi;

 
 grep "33" $HOME/.config/styler/checkradio.sh;
  if [ "$?" == "0" ];
   then
     export serenity="false" && export sea="false"  && export fos="true";
   else 
     echo "not found fos in openbox and xfce";
  fi;
}

# check if compositor is enabled

function compositor {
 ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "compton" ~/.config/styler/function/proc.txt;
   if [ "$?" == "0" ];
    then
     export compton=true;
    else
     export compton=false;
   fi;
  rm ~/.config/styler/function/proc.txt;
}
  
function check_comp {
  grep "#compton --config" ~/.config/openbox/autostart.sh;
   if [ "$?" == "0" ];
     then 
       export comp_aut=false;
     else
       export comp_aut=true;
   fi;
}

function conky {
 ps -U root -u root -N > ~/.config/styler/function/proc.txt;
  grep "conky" ~/.config/styler/function/proc.txt;
   if [ "$?" == "0" ];
    then
     export conky=true;
    else
     export conky=false;
   fi;
  rm ~/.config/styler/function/proc.txt;
}

function dock {
 ps -U root -u root -N > ~/.config/styler/function/proc.txt;
 dock=`grep -c "tint2" ~/.config/styler/function/proc.txt;`
 echo $dock
   if [ "$dock" == "2" ];
    then
     export dock=true;
    else
     export dock=false;
   fi;
  rm ~/.config/styler/function/proc.txt;
}
  
function check_conky {
  grep "#(sleep 5 && conky -d -c ~/.conkyrc) &" ~/.config/openbox/autostart.sh;
   if [ "$?" == "0" ];
     then 
       export conky_aut=false;
     else
       export conky_aut=true;
   fi;
}

function check_dock_aut {
  grep "#(sleep 6 && tint2 -c ~/.config/tint2/dock_tint2rc)" ~/.config/openbox/autostart.sh;
   if [ "$?" == "0" ];
     then 
       export dock_aut=false;
     else
       export dock_aut=true;
   fi;
}

function check_position {
 grep "panel_position = top center*" ~/.config/tint2/tint2rc;
  if [ "$?" == "0" ];
   then 
    export panel_top=true && export panel_bottom=false && export panel_right=false && export panel_left=false;
    echo "panel is on top";
   else
    grep "panel_position = bottom*" ~/.config/tint2/tint2rc;
     if [ "$?" == "0" ];
      then
       export panel_top=false && export panel_bottom=true && export panel_right=false && export panel_left=false;
       echo "panel is on bottom";
      else
       grep "panel_position = top left*" ~/.config/tint2/tint2rc
        if [ "$?" == "0" ];
         then 
          export panel_top=false && export panel_bottom=false && export panel_right=false && export panel_left=true;
          echo "panel is on left";
         else
          grep "panel_position = top right*" ~/.config/tint2/tint2rc
           if [ "$?" == "0" ];
            then
             export panel_top=false && export panel_bottom=false && export panel_right=true && export panel_left=false;
             echo "panel is on right";
            else
             echo "done";
           fi;
        fi;
     fi;
 fi;
}

function check_position_dock {
 grep "panel_position = top center*" ~/.config/tint2/dock_tint2rc;
  if [ "$?" == "0" ];
   then 
    export dock_top=true && export dock_bottom=false && export dock_right=false && export dock_left=false;
    echo "panel is on top";
   else
    grep "panel_position = bottom*" ~/.config/tint2/dock_tint2rc;
     if [ "$?" == "0" ];
      then
       export dock_top=false && export dock_bottom=true && export dock_right=false && export dock_left=false;
       echo "panel is on bottom";
      else
       grep "panel_position = center left*" ~/.config/tint2/dock_tint2rc;
        if [ "$?" == "0" ];
         then 
          export dock_top=false && export dock_bottom=false && export dock_right=false && export dock_left=true;
          echo "panel is on left";
         else
          grep "panel_position = center right*" ~/.config/tint2/dock_tint2rc;
           if [ "$?" == "0" ];
            then
             export dock_top=false && export dock_bottom=false && export dock_right=true && export dock_left=false;
             echo "panel is on right";
            else
             echo "done";
           fi;
        fi;
     fi;
 fi;
}

function clock { 
  grep "#time1_format*" ~/.config/tint2/tint2rc;
   if [ "$?" == "0" ];
     then 
       export clock=false;
     else
       export clock=true;
   fi;
}

function dock_clock { 
  grep "#time1_format*" ~/.config/tint2/dock_tint2rc;
   if [ "$?" == "0" ];
     then 
       export dock_clock=false;
     else
       export dock_clock=true;
   fi;
}

function date { 
  grep "#time2_format*" ~/.config/tint2/tint2rc;
   if [ "$?" == "0" ];
     then 
       export date_on=false;
       export date_off=true;
     else
       export date_on=true;
       export date_off=false;
   fi;
}

function dock_date { 
  grep "#time2_format*" ~/.config/tint2/dock_tint2rc;
   if [ "$?" == "0" ];
     then 
       export dock_date_on=false;
       export dock_date_off=true;
     else
       export dock_date_on=true;
       export dock_date_off=false;
   fi;
}

function seconds { 
  grep "%S" ~/.config/tint2/tint2rc;
   if [ "$?" == "0" ];
     then 
       export seconds=true;
     else
       export seconds=false;
   fi;
}

function dock_seconds { 
  grep "%S" ~/.config/tint2/dock_tint2rc;
   if [ "$?" == "0" ];
     then 
       export dock_seconds=true;
     else
       export dock_seconds=false;
   fi;
}

function autohide { 
  grep "autohide = 0" ~/.config/tint2/tint2rc;
   if [ "$?" == "0" ];
     then 
       export autohide=false;
     else
       export autohide=true;
   fi;
}

function autohide_dock { 
  grep "<autoHide>no</autoHide>" ~/.config/openbox/rc.xml;
   if [ "$?" == "0" ];
     then 
       export autohide_dock=false;
     else
       export autohide_dock=true;
   fi;
}

# execute preselecter

  verify_dockbar;
  verify_dock_autostart;
  serenity;
  sea;
  fos;
  compositor;
  check_comp;
  conky;
  check_conky;
  check_position;
  check_position_dock;
  dock;
  check_dock_aut;
  clock;
  date;
  seconds;
  dock_clock;
  dock_date;
  dock_seconds;
  autohide;
  autohide_dock;

 
# launch styler

Desktop=$"Desktop" Tint2=$"Tint2" Dock=$"Dock"
export Styler=$(cat <<End_of_Text

<window title="SalentOS Styler" window-position="1" icon-name="menu" decorated="true" height-request="620" width-request="950" resizable="true">
<vbox>
<hbox>


          <button tooltip-text="`gettext $"About"`" height-request="28" width-request="28">
          <input file stock="gtk-dialog-info"></input>
          <action>/usr/local/bin/styler/license</action>
          </button>
        

</hbox>

          
              <pixmap><height>48</height><width>48</width>
              <input file>/usr/share/pixmaps/menu.png</input>
              </pixmap>

<text use-markup="true">
                 <label>"<b>`gettext $"SalentOS Styler"`</b>"</label></text>

                 
<text use-markup="true" width-chars="40"><label>""</label>
       </text>
<notebook tab-pos="2" labels="$Desktop|$Tint2|$Dock">
<hbox>
          
<frame Style>

    <vbox>
                   <pixmap><height>270</height><width>500</width>
                   <variable>IMAGE</variable> 
                   <input file>$HOME/.config/styler/preview/background.png</input>
                   </pixmap>
  </vbox>

<vbox>
<hbox>
<radiobutton active="$serenity">
     <label>Serenity</label>
     <variable> theme3 </variable>
     <action>  theme="theme3"; echo $theme3;cp /usr/local/bin/styler/images/temi/serenity.png $HOME/.config/styler/preview/background.png; sed -i '5s/.*/TEMA="serenity"/' $HOME/.config/styler/function/themes_app/selecter.sh; </action> 
     <action type="refresh">IMAGE</action>  
   </radiobutton>

<radiobutton active="$sea">
     <label>Sea</label>
     <variable> theme1 </variable>
     <action> theme="theme1"; echo $theme1;cp /usr/local/bin/styler/images/temi/sea.png $HOME/.config/styler/preview/background.png; sed -i '5s/.*/TEMA="sea"/' $HOME/.config/styler/function/themes_app/selecter.sh; </action> 
     <action type="refresh">IMAGE</action>
   </radiobutton>

<radiobutton active="$fos">
     <label>Fos</label>
     <variable> theme2 </variable>
     <action>  theme="theme2"; echo $theme2;cp /usr/local/bin/styler/images/temi/fos.png $HOME/.config/styler/preview/background.png; sed -i '5s/.*/TEMA="fos"/' $HOME/.config/styler/function/themes_app/selecter.sh; </action> 
     <action type="refresh">IMAGE</action>
   </radiobutton>

</hbox>
</vbox>

<hbox>

        <button>
           <input file stock="gtk-apply"></input>
           <label>"`gettext $"Apply"`"</label>
           <action> $HOME/.config/styler/function/themes_app/selecter.sh</action> 
        </button>

</hbox>

</frame>

<frame Customize>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>

<vbox>
<frame Appearance>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>

<hbox>		

<button tooltip-text="`gettext $"Wallpaper settings"`"> 
<input file>/usr/share/pixmaps/nitrogen.png</input><height>16</height><width>16</width>
      <label>Nitrogen</label>
      <action>nitrogen</action>
    </button>

<button tooltip-text="`gettext $"Openbox Configuration Tool"`"> 
<input file>/usr/share/pixmaps/obconf.png</input><height>16</height><width>16</width>
      <label>Obconf</label>
      <action>obconf &</action>
    </button>
  
<button tooltip-text="`gettext $"Icons & GTK Theme"`">
<input file icon="style"></input><height>16</height><width>16</width>
      <label>"`gettext $"Appearance"`"</label>
      <action>lxappearance &</action>
      </button>

</hbox>
</frame>
 </vbox>
           
<vbox>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>
<frame Compositing>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>

          
	<hbox>


                  <checkbox>
                     <default>"$compton"</default>
                     <label>On/Off</label>		     
                     <action>if true /usr/local/bin/styler/function/compositor/compositor_on.sh</action>
		     <action>if false /usr/local/bin/styler/function/compositor/compositor_off.sh</action> 
		  </checkbox>
               
                 <checkbox>
                    <label>Autostart</label>	
                    <default>"$comp_aut"</default>
                    <action>if true /usr/local/bin/styler/function/compositor/comp_autostart_on.sh</action>
		    <action>if false /usr/local/bin/styler/function/compositor/comp_autostart_off.sh</action> 
		 </checkbox>

                <button tooltip-text="`gettext $"Edit Config"`">
                 <label>"`gettext $"Edit Config"`"</label>
                 <action>mousepad $HOME/.config/compton.conf</action> 
                </button>
           </hbox>
</frame>
</vbox>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>
<frame Conky>

 <hbox>
               <checkbox>
                  <label>On/Off</label>
                  <default>"$conky"</default>
                  <variable>checkbox3</variable> 
                  <action>if true /usr/local/bin/styler/function/conky/conk_on.sh</action>
	          <action>if false /usr/local/bin/styler/function/conky/conk_off.sh</action>
                 </checkbox>

                <checkbox>
                    <label>Autostart</label>	
                    <default>"$conky_aut"</default>
                    <action>if true /usr/local/bin/styler/function/conky/conk_autostart_on.sh</action>
		    <action>if false /usr/local/bin/styler/function/conky/conk_autostart_off.sh</action> 
		 </checkbox>

             <button tooltip-text="`gettext $"Change the conky theme"`" height-request="32" width-request="72" stock-icon-size="4" ><input file icon="style"></input><height>16</height><width>16</width>
             <label>"`gettext $"Theme"`"</label>
               <variable>checkbox4</variable>
                <action>/usr/local/bin/styler/function/conky/theme_selecter.sh</action>
              </button>


		
    </hbox>
          
</frame>
</frame>             

</hbox>
<vbox>

<hbox> 	 
<frame Theme>
<vbox spacing="0">
<vbox scrollable="true" hscrollbar-policy="1" vscrollbar-policy="1" height="110">

                    <button tooltip-text="`gettext $"Click to select SalentOS_Default"`">
                    <variable>IMAGE1</variable>
                    <input file>"/usr/local/bin/styler/function/tint2/tint2_TM/images/SalentOS_Default.png"</input>
                    <action>echo $IMAGE1;if echo $IMAGE1 "true"; then cp /usr/local/bin/styler/function/tint2/tint2_TM/themes/SalentOS_Default.tint2rc $HOME/.config/styler/function/tint2/tint2rctemp;fi &</action>
                    </button>
                   
                    <button tooltip-text="`gettext $"Click to select SalentOS_panel_1"`">
                    <variable>IMAGE18</variable>
                    <input file>"/usr/local/bin/styler/function/tint2/tint2_TM/images/SalentOS_panel_1.png"</input>
                    <action>echo $IMAGE18;if echo $IMAGE18 "true"; then cp /usr/local/bin/styler/function/tint2/tint2_TM/themes/SalentOS_panel_1.tint2rc $HOME/.config/styler/function/tint2/tint2rctemp;fi &</action>
                    </button>

                    <button tooltip-text="`gettext $"Click to select SalentOS_panel_2"`">
                    <variable>IMAGE2</variable>
                    <input file>"/usr/local/bin/styler/function/tint2/tint2_TM/images/SalentOS_panel_2.png"</input>
                    <action>echo $IMAGE2;if echo $IMAGE2 "true";then cp /usr/local/bin/styler/function/tint2/tint2_TM/themes/SalentOS_panel_2.tint2rc $HOME/.config/styler/function/tint2/tint2rctemp;fi &</action>
                    </button>

                    <button tooltip-text="`gettext $"Click to select SalentOS_panel_3"`">
                    <variable>IMAGE3</variable>
                    <input file>"/usr/local/bin/styler/function/tint2/tint2_TM/images/SalentOS_panel_3.png"</input>
                    <action>echo $IMAGE3;if echo $IMAGE3 "true";then cp /usr/local/bin/styler/function/tint2/tint2_TM/themes/SalentOS_panel_3.tint2rc $HOME/.config/styler/function/tint2/tint2rctemp;fi &</action>
                    </button>

                    <button tooltip-text="`gettext $"Click to select SalentOS_panel_4"`">
                    <variable>IMAGE1</variable>
                    <input file>"/usr/local/bin/styler/function/tint2/tint2_TM/images/SalentOS_panel_4.png"</input>
                    <action>echo $IMAGE1;if echo $IMAGE1 "true"; then cp /usr/local/bin/styler/function/tint2/tint2_TM/themes/SalentOS_panel_4.tint2rc $HOME/.config/styler/function/tint2/tint2rctemp;fi &</action>
                    </button>
 
                    <button tooltip-text="`gettext $"Click to select SalentOS_panel_5"`">
                    <variable>IMAGE1</variable>
                    <input file>"/usr/local/bin/styler/function/tint2/tint2_TM/images/SalentOS_panel_5.png"</input>
                    <action>echo $IMAGE1;if echo $IMAGE1 "true"; then cp /usr/local/bin/styler/function/tint2/tint2_TM/themes/SalentOS_panel_5.tint2rc $HOME/.config/styler/function/tint2/tint2rctemp;fi &</action>
                    </button>

 </vbox>

<hbox>
              

     <button>
           <input file stock="gtk-apply"></input>
           <label>"`gettext $"Apply"`"</label>
           <action>/usr/local/bin/styler/function/tint2/apply.sh</action>
   </button>
     <button>
           <input file stock="gtk-undo"></input>
           <label>"`gettext $"Backup"`"</label>
           <action>/usr/local/bin/styler/function/tint2/make_backup.sh</action>
   </button>

</hbox>


<vbox>
<frame Edit>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>
<hbox>
<frame Position>

<vbox>

              <radiobutton active="$panel_top">            
                  <label>"`gettext $"Up"`"</label>
                  <variable>RADIOBUTTON4</variable>
                  <action>if true /usr/local/bin/styler/function/tint2/position_top.sh</action>
               </radiobutton>
              <radiobutton active="$panel_bottom"> 
                  <label>"`gettext $"Down"`"</label>
                  <variable>RADIOBUTTON5</variable>
                  <action>if true /usr/local/bin/styler/function/tint2/position_bottom.sh</action>
	   </radiobutton>
              <radiobutton active="$panel_left"> 
                   <label>"`gettext $"Left"`"</label>
		<variable>RADIOBUTTON6</variable>
	    <action>if true /usr/local/bin/styler/function/tint2/position_left.sh</action>
	</radiobutton>   
              <radiobutton active="$panel_right"> 
			<label>"`gettext $"Right"`"</label>
			<variable>RADIOBUTTON7</variable>
			<action>if true /usr/local/bin/styler/function/tint2/position_right.sh</action>
		</radiobutton>
				

</vbox>
</frame>

<frame Adjustments>
<vbox>
<checkbox>
                                        <default>"$autohide"</default>
                                        <variable>checkbox10</variable>
					<label>"`gettext $"autoHide"`"</label>
					<variable>B</variable>
					 <action>if true /usr/local/bin/styler/function/tint2/autohide_on.sh</action>
                                         <action>if false /usr/local/bin/styler/function/tint2/autohide_off.sh</action>
                                    </checkbox>
	     <button>            
                  <label>"`gettext $"Resize"`"</label>
                  <variable>CHECKBOX8</variable>
		    <action>/usr/local/bin/styler/function/tint2/sizes.sh</action> 
		 </button>
<button>            
                  <label>"`gettext $"Sections"`"</label>
		    <action>/usr/local/bin/styler/function/tint2/itemsel.sh</action> 
		 </button>
 <button>
      <label>"`gettext $"Edit panel config"`"</label>
      <variable>checkbox12</variable>
      <action>mousepad $HOME/.config/tint2/tint2rc</action>
    </button>

   <button tooltip-text="`gettext $"Tint2 Icon theme"`">
      <input file icon="style"></input><height>16</height><width>16</width>
        <label>"`gettext $"Tint2 Icons Theme"`"</label>
        <action>/usr/local/bin/styler/function/tint2/select_icons.sh</action>
     </button>
                              

<text use-markup="true" width-chars="10"><label>""</label>
       </text>
</vbox>

</frame>

<frame Launchers>



<vbox>
	     <button>            
                  <label>"`gettext $"Add"`"</label>
                  <variable>CHECKBOX8</variable>
		    <action>/usr/local/bin/styler/function/tint2/partedue.sh</action> 
		 </button>
                
                  <button>
                  <label>"`gettext $"Order"`"</label>
                  <variable>CHECKBOX9</variable> 
			<action>/usr/local/bin/styler/function/tint2/partetre.sh</action> 
		 </button>
               <button>
                  <label>"`gettext $"Remove"`"</label>
                  <variable>CHECKBOX10</variable>
			<action>/usr/local/bin/styler/function/tint2/parteuno.sh</action> 
		 </button>
</vbox>

</frame>
<frame Clock>



<vbox>
	       <button>            
                  <label>AM/PM</label>
                  <variable>RADIOBUTTON16</variable>
		    <action>/usr/local/bin/styler/function/tint2/time_format.sh</action>
                 </button>
                
                  <checkbox>
                  <default>"$clock"</default>
		  <label>On/Off</label>
                  <variable>RADIOBUTTON17</variable> 
			<action>if true /usr/local/bin/styler/function/tint2/time_on.sh</action>
                        <action>if false /usr/local/bin/styler/function/tint2/time_off.sh</action> 
		 </checkbox>

                 <checkbox>
                  <label>"`gettext $"Seconds"`"</label>
                  <default>"$seconds"</default>
                  <variable>RADIOBUTTON19</variable> 
			<action>if true /usr/local/bin/styler/function/tint2/second_on.sh</action>
			<action>if false /usr/local/bin/styler/function/tint2/second_off.sh</action>
		 </checkbox>

</vbox>
</frame>
<frame Date>




<vbox>
	    
                
                  <radiobutton active="$date_on">
                  <label>On</label>
                  <variable>RADIOBUTTON21</variable> 
			<action>if true /usr/local/bin/styler/function/tint2/date_on.sh</action> 
		 </radiobutton>
                 <radiobutton active="$date_off">
                  <label>Off</label>
                  <variable>RADIOBUTTON22</variable>
			<action>if true /usr/local/bin/styler/function/tint2/date_off.sh</action> 
		 </radiobutton> 

</vbox>
</frame>
<frame Options>
<vbox>
               <button>
                    <input file stock="gtk-undo"></input>
                    <label>"`gettext $"Restore default"`"</label>
                    <action>/usr/local/bin/styler/function/tint2/restore_default.sh</action>
               </button>
               <button>
                    <input file stock="gtk-undo"></input>
                    <label>"`gettext $"Restore last backup"`"</label>
                    <action>/usr/local/bin/styler/function/tint2/restore_backup.sh</action>
                  </button>
                <button>
                    <input file stock="gtk-refresh"></input>
                    <label>"`gettext $"Restart"`"</label>
                    <action>/usr/bin/tint2restart</action>
                 </button>

</vbox>
</frame>
</hbox>

</frame>
</vbox>


</vbox>
</frame>

</hbox>
</vbox>

<vbox>
<hbox> 	 
<frame>

<vbox>
                   <pixmap><width>700</width>
                   <variable>IMAGE2</variable> 
                   <input file>/usr/local/bin/styler/function/dockbar/images/dock.png</input>
                   </pixmap>
</vbox>
<vbox spacing="0">
<vbox>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>
<frame Edit>
<text use-markup="true" width-chars="40"><label>""</label>
       </text>
<hbox>
<frame Dock>
<vbox>
<checkbox>
                  <label>On/Off</label>
		  <default>"$dock"</default>
                  <variable>checkbox13</variable> 
			<action>if true /usr/local/bin/styler/function/dockbar/dock_on.sh</action>
			<action>if false /usr/local/bin/styler/function/dockbar/dock_off.sh</action> 
		 </checkbox>

<checkbox>
                  <label>Autostart</label>
		  <default>"$dock_aut"</default>
                  <variable>checkbox15</variable> 
			<action>if true /usr/local/bin/styler/function/dockbar/dock_autostart_on.sh</action>
			<action>if false /usr/local/bin/styler/function/dockbar/dock_autostart_off.sh</action>  
		 </checkbox>

</vbox>
</frame>
<frame Position>


<vbox>

              <radiobutton active="$dock_top">            
                  <label>"`gettext $"Up"`"</label>
                  <variable>RADIOBUTTON4</variable>
                  <action>if true /usr/local/bin/styler/function/dockbar/position_top.sh</action>
               </radiobutton>

               <radiobutton active="$dock_bottom">
                  <label>"`gettext $"Down"`"</label>
                  <variable>RADIOBUTTON5</variable>
                  <action>if true /usr/local/bin/styler/function/dockbar/position_bottom.sh</action>
		</radiobutton>

               <radiobutton active="$dock_left">
                   <label>"`gettext $"Left"`"</label>
	           <variable>RADIOBUTTON6</variable>
		   <action>if true /usr/local/bin/styler/function/dockbar/position_left.sh</action>
		</radiobutton>

		<radiobutton active="$dock_right">
		    <label>"`gettext $"Right"`"</label>
		    <variable>RADIOBUTTON7</variable>
		   <action>if true /usr/local/bin/styler/function/dockbar/position_right.sh</action>
		</radiobutton>
				

</vbox>
</frame>
<frame Launchers>


<vbox>
	     <button>            
                  <label>"`gettext $"Add"`"</label>
                  <variable>CHECKBOX11</variable>
		    <action>/usr/local/bin/styler/function/dockbar/partedue.sh</action> 
		 </button>
                
                  <button>
                  <label>"`gettext $"Order"`"</label>
                  <variable>CHECKBOX12</variable> 
			<action>/usr/local/bin/styler/function/dockbar/partetre.sh</action> 
		 </button>
               <button>
                  <label>"`gettext $"Remove"`"</label>
                  <variable>CHECKBOX13</variable>
			<action>/usr/local/bin/styler/function/dockbar/parteuno.sh</action> 
		 </button>
</vbox>
</frame>
<frame Adjustments>
<vbox>
<checkbox>
					<label>"`gettext $"autoHide"`"</label>
					<default>"$autohide_dock"</default>
                                        <variable>checkbox16</variable>
					<variable>B</variable>
					 <action>if true /usr/local/bin/styler/function/dockbar/autohide_on.sh</action>
                                         <action>if false /usr/local/bin/styler/function/dockbar/autohide_off.sh</action>

                                </checkbox>
	     <button>            
                  <label>"`gettext $"Resize"`"</label>
                  <variable>CHECKBOX8</variable>
		    <action>/usr/local/bin/styler/function/dockbar/sizes.sh</action> 
		 </button>
               
                                <button>
                                  <label>"`gettext $"Edit panel config"`"</label>
                                   <variable>checkbox17</variable>
                                    <action>mousepad $HOME/.config/tint2/dock_tint2rc</action>
                                   </button>
				<button tooltip-text="`gettext $"Tint2 Icon theme"`">
      <input file icon="style"></input><height>16</height><width>16</width>
        <label>"`gettext $"Tint2 Icon theme"`"</label>
        <action>/usr/local/bin/styler/function/dockbar/select_icons.sh</action>
     </button>
                              

<text use-markup="true" width-chars="10"><label>""</label>
       </text>
</vbox>
</frame>


<frame Options>

<vbox>

<button>
           <input file stock="gtk-undo"></input>
           <label>"`gettext $"Backup"`"</label>
           <action>/usr/local/bin/styler/function/dockbar/make_backup.sh</action>
   </button>
<button>
                    <input file stock="gtk-undo"></input>
                    <label>"`gettext $"Restore last backup"`"</label>
                    <action>/usr/local/bin/styler/function/dockbar/restore_backup.sh</action>
                  </button>
<button>
                    <input file stock="gtk-undo"></input>
                    <label>"`gettext $"Restore default"`"</label>
                    <action>/usr/local/bin/styler/function/dockbar/restore_default.sh</action>
               </button>
<button>
                    <input file stock="gtk-refresh"></input>
                    <label>"`gettext $"Restart"`"</label>
                    <action>/usr/bin/tint2restart</action>
                 </button>

</vbox>
</frame>
</hbox>

</frame>
</vbox>

</vbox>

</frame>
</hbox>

</vbox>

</notebook>

<hbox>
<button>
           <input file stock="gtk-close"></input>
           <label>"`gettext $"Exit"`"</label>
            <action>EXIT:cancel</action>
        </button>

 </hbox>
</vbox>
</window>

End_of_Text
)
gtkdialog --program=Styler
unset Styler
