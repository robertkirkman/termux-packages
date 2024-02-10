#!/data/data/com.termux/files/usr/bin/bash

##
# BASH menu script that:
# 
# 
#  
#  
##


function sm64ex_coop() {
    echo ""
	echo "You chose SM64EX Coop this will take awhile depending on your device"
	bash /data/data/com.termux/files/usr/bin/build-sm64ex-coop.sh
	echo ""
}

function sm64ex_coop_render96() {
    echo ""
	echo "You chose SM64EX Coop Render96 HD this will take awhile depending on your device"
	bash /data/data/com.termux/files/usr/bin/build-sm64ex-coop-render96.sh
	echo ""
}

function sm64ex_omm() {
    echo ""
	echo "You chose SM64EX OMM this will take awhile depending on your device"
    echo ""
	bash /data/data/com.termux/files/usr/bin/build-sm64ex-omm.sh
    echo ""
}

function sm64ex_alo() {
    echo ""
	echo "You chose SM64EX ALO this will take awhile depending on your device"
    echo ""
	bash /data/data/com.termux/files/usr/bin/build-sm64ex-alo.sh
    echo ""
}

function sm64ex_60fps_ext() {
    echo ""
	echo "You chose SM64EX 60fps External Data (Enables Texture Packs *must have access to Android data files*) this will take awhile depending on your device"
	echo ""
    bash /data/data/com.termux/files/usr/bin/build-sm64ex-EXT.sh
    echo ""
}

function sm64ex_60fps_int() {
    echo ""
	echo "You chose SM64EX 60fps Internal Data (No Texture Packs) this will take awhile depending on your device"
	echo ""
    bash /data/data/com.termux/files/usr/bin/build-sm64ex-INT.sh
    echo ""
}

function sm64ex_60fps_ext_no_t() {
    echo ""
	echo "You chose SM64EX 60fps External Data (Enables Texture Packs) **No Touch Controls** this will take awhile depending on your device"
	echo ""
    bash /data/data/com.termux/files/usr/bin/build-sm64ex-EXTnoTouch.sh
    echo ""
}

function sm64ex_60fps_int_no_t() {
    echo ""
	echo "You chose SM64EX 60fps Internal Data (No Texture Packs) **No Touch Controls** this will take awhile depending on your device"
	echo ""
    bash /data/data/com.termux/files/usr/bin/build-sm64ex-INTnoTouch.sh
    echo ""
}

function sm64ex_porcino() {
    echo ""
	echo "You chose SM64EX Porcino this will take awhile depending on your device"
    echo ""
	bash /data/data/com.termux/files/usr/bin/build-sm64ex-porcino.sh
    echo ""
}

function starroad_normal() {
    echo ""
	echo "You chose Star Road normal build version this may take awhile depending on your device"
    echo ""
	bash /data/data/com.termux/files/usr/bin/build-starroad.sh
    echo ""
}

function reset_builder() {
    echo ""
	echo "You chose to reset the builder. This is necessary for an update to take effect. This will not erase anything in the home directory. It will close the app. You must reopen the app."
    echo ""
	bash /data/data/com.termux/files/usr/bin/reset.sh
    echo ""
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
BYellow='\e[1;33m'
clear='\e[0m'
red='\e[31m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

ColorYellow(){
	echo -ne $BYellow$1$clear
}

ColorRed(){
	echo -ne $red$1$clear
}

menu(){
echo -ne "
$(ColorYellow '====== Super Mario 64 Builder ======')
$(ColorGreen '1)') $(ColorRed 'SM64EX COOP')
$(ColorGreen '2)') $(ColorRed 'SM64EX COOP RENDER96 HD')
$(ColorGreen '3)') $(ColorRed 'SM64EX OMM')
$(ColorGreen '4)') $(ColorRed 'SM64EX ALO')
$(ColorGreen '5)') $(ColorRed 'SM64EX 60fps External')
$(ColorGreen '6)') $(ColorRed 'SM64EX 60fps Internal')
$(ColorGreen '7)') $(ColorRed 'SM64EX 60fps EXT No Touch')
$(ColorGreen '8)') $(ColorRed 'SM64EX 60fps INT No Touch')
$(ColorGreen '9)') $(ColorRed 'SM64EX Porcino')
$(ColorGreen '10)') $(ColorRed 'Star Road')
$(ColorGreen '0)') $(ColorRed 'Exit')
$(ColorGreen 'reset)') $(ColorRed 'RESET BUILDER AFTER UPDATE')
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) sm64ex_coop ; menu ;;
	        2) sm64ex_coop_render96 ; menu ;;
	        3) sm64ex_omm ; menu ;;
	        4) sm64ex_alo ; menu ;;
	        5) sm64ex_60fps_ext ; menu ;;
	        6) sm64ex_60fps_int ; menu ;;
	        7) sm64ex_60fps_ext_no_t ; menu ;;
	        8) sm64ex_60fps_int_no_t ; menu ;;
	        9) sm64ex_porcino ; menu ;;
	        10) starroad_normal ; menu ;;
		0) exit 0 ;;
		reset) reset_builder ; ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu