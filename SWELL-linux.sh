#!/bin/bash

# CopyRight Notice Block
: '
-------------------------------------------
Name: SWELL 'Starbound Workshop Easy Linker Linux'
Version: 1.0.8
Created by: Misunderstood Wookiee
Contributors: NovaCrypt
CopyRight: (c) Apr 2023, All Rights Reserved!
--------------------------------------------
'
# End of CopyRight Notice Block

# START OF SCRIPT
clear

#  STEAM APPS AND DEDICATED SERVER MODS DIRECTORY CONFIGURATION
#  *** TO CHANGE: EDIT AFTER THE EQUALS SIGN
SteamAppsDir="${HOME}/.local/share/Steam/steamapps"
DediServerModDir="${HOME}/.local/share/Steam/steamapps/common/Starbound Dedicated Server/mods"

# MENU SELECTION SUB-ROUTINES BLOCK
function1() {
  # begin symbolic linking section
  clear

  # Create Links for Content.pak
  for directory in "${SteamAppsDir}/workshop/content/211820/"*; do
	  target="${directory}/content.pak"
		link="${DediServerModDir}/${directory##*/}.pak"
		if [[ -e $target ]]; then
		  if [[ ! -e $link ]]; then
				ln -s "$target" "$link"
			else
				echo $link already exists.
			fi
		fi
  done

  # Create Links for Contents.pak
  for directory in "${SteamAppsDir}/workshop/content/211820/"*; do
	  target="${directory}/contents.pak"
		link="${DediServerModDir}/${directory##*/}.pak"
		if [[ -e $target ]]; then
		  if [[ ! -e $link ]]; then
				ln -s "$target" "$link"
			else
				echo $link already exists.
			fi
		fi
  done

	# clear

	echo "
	==============S.A.I.L================
	Symbolic Link Process Completed
	-------------------------------------
	======PRESS ANY KEY TO CONTINUE======
	"
	read
	# end of symbolic linking section
	menu
}

function2() {
	# begin copying files section
	clear
	# Copy content.pak
	for directory in "${SteamAppsDir}/workshop/content/211820/"*; do
		file="${directory}/content.pak"
		dest="${DediServerModDir}/${directory##*/}.pak"
		if [[ -e $file ]]; then
			if [[ ! -e $dest ]]; then
				cp "$file" "$dest"
			else
				echo $dest already exists.
			fi
		else
		  echo $file does not exist.
		fi
	done

	# Copy contents.pak
	for directory in "${SteamAppsDir}/workshop/content/211820/"*; do
		file="${directory}/contents.pak"
		dest="${DediServerModDir}/${directory##*/}.pak"
		if [[ -e $file ]]; then
			if [[ ! -e $dest ]]; then
				cp "$file" "$dest"
			else
				echo $dest already exists.
			fi
		fi
	done

	clear

	echo
	echo "
	==============S.A.I.L================
	Workshop Files Copied Succesfully
	-------------------------------------
	======PRESS ANY KEY TO CONTINUE======
	"
	read
	# end of copying files section
	menu
}

function3() {
	# begin print copy copyright section
	clear
	echo "
	*********************************************
	COPYRIGHT AND DISTRIBUTION
	*********************************************
	___________________________________________________________________________
	You have permission to distrubute this program without any alteration and
	the copyright notice block is included without changes.
	___________________________________________________________________________
	However you may -
	Decompile, and edit for personal use but NOT distribute
	altered versions of this program without permission from the author!
	___________________________________________________________________________
	---------------------------------------------
	Created by: Misunderstood Wookiee
	Contributors: Novacrypt
	CopyRight: (c) Apr 2023, All Rights Reserved!
	---------------------------------------------
	======PRESS ANY KEY TO RETURN TO MAIN MENU======
	"
	read
	# end of copyright print section
	menu
}

quit() {
	# begin quit section
	clear
	echo "
	==============S.A.I.L===============
	__________SHUTTING DOWN!____________
	-------------------------------------
	======PRESS ANY KEY TO QUIT======
	"
	read
  exit
	# end of quit section - if it has not quit by now WTF and well just WTF!
}
# END OF BLOCK

# PRINT MAIN MENU
menu() {
	clear
	echo "
	_____________Starbound Workshop Easy Linker ______________
	______________________ Main Menu _________________________
	1. Create Workshop Mod Links
	2. Create a Copy of Workshop Mods
	3. Credits
	-------------------------------------
	__________PRESS 'Q' TO QUIT__________
	"
	# END OF BLOCK

	# MENU CHOICE SUB-ROUTINE BLOCK
	echo "Please select a number:"
	read -n 1 input
	if [[ "$input" == "1" ]]; then
		function1
	elif [[ "$input" == "2" ]]; then
		function2
	elif [[ "$input" == "3" ]]; then
		function3
	elif [[ "$input" == "q" ]]; then
		quit
	else
		# if no valid selection print this -
		clear
		echo "
		============INVALID INPUT============
		*************************************
		Please select a number from the Main Menu
		[1-3] or select 'Q' to quit.
		*************************************
		======PRESS ANY KEY TO CONTINUE======
		"
		read
		menu
	fi
}
# END OF BLOCK
if [[ ! -e $DediServerModDir ]]; then
  mkdir -r $DediServerModDir
fi

menu
# SCRIPT ENDS HERE