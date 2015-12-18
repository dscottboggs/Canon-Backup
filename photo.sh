#!/bin/bash
#Auto backup Canon camera and convert to .tif 8-bit for GIMP.
#
# all files are redirected to ~/Pictures/test instead of ~/Pictures until done
#		     ^^ Don't forget to fix that ^^
#
#	v0.0.3 created 2015-12-18
#	D. Scott Boggs


currentDate=$(date +"%Y-%m-%d")		#save current date for filename
dirName=$"Canon-Backup-$currentDate"
dirLongName=$"$PWD/$dirName"
echo "Creating folder $dirName..."
sudo mkdir $dirLongName   #create folder for today's dump

echo "Dectecting Camera..."
gphoto2 --auto-detect		#Don't forget to find the camera!
echo "Retrieving files from camera and saving them to $dirLongName..."
cd $dirLongName
sudo gphoto2 --get-all-files		#get all files and save to new dir

echo "creating folder $dirName/TIFF8 for GIMP-compatible, uncompressed TIFFs..."
sudo mkdir $dirLongName/TIFF8/		#create a subdirectory for GIMP compatible TIFFs
echo "converting files..."
sudo rawtherapee -o TIFF8/ -b8 -t -c *.CR2
echo "making extra directories for later organization..."
sudo mkdir $dirLongName/GIMP_files/
sudo mkdir $dirLongName/Renders
echo "done."
