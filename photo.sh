#!/bin/bash
#Auto backup Canon camera and convert to .tif 8-bit for GIMP.
#
# all files are redirected to ~/Pictures/test instead of ~/Pictures until done
#		     ^^ Don't forget to fix that ^^
#
#	v0.0.1 created 2015-12-17
#	D. Scott Boggs


currentDate=$(date +"%Y-%m-%d")		#save current date for filename
dirName=$"/home/scott/Pictures/test/Canon-Backup-$currentDate"
sudo mkdir $dirName   #create folder for today's dump

gphoto2 --auto-detect		#Don't forget to find the camera!
gphoto2 --get-all-files --folder="$dirName"	#get all files and save to new dir

mkdir "$dirName/TIFF8/"		#create a subdirectory for GIMP compatible TIFFs

