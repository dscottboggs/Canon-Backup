#!/bin/bash
#Auto backup Canon camera and convert to .tif 8-bit for GIMP.
#
# all files are redirected to ~/Pictures/test instead of ~/Pictures until done
#		     ^^ Don't forget to fix that ^^
#
<<<<<<< HEAD
#	v0.1.0 created 2015-12-18
=======
#	v0.1.1 created 2015-12-18
>>>>>>> test
#	D. Scott Boggs


currentDate=$(date +"%Y-%m-%d")		#save current date for filename
dirName=$"Canon-Backup-$currentDate"
dirLongName=$"$PWD/$dirName"
echo -e "\e[1m\e[31mCreating folder $dirName...\e[21m\e[39m"
sudo mkdir $dirLongName   #create folder for today's dump

echo -e "\e[1m\e[31mDectecting Camera...\e[21m\e[39m"
gphoto2 --auto-detect		#Don't forget to find the camera!
echo -e "\e[1m\e[31mRetrieving files from camera and saving them to $dirLongName...\e[21m\e[39m"
cd $dirLongName
sudo gphoto2 --get-all-files		#get all files and save to new dir

echo -e "\e[1m\e[31mCreating folder $dirName/TIFF8 for GIMP-compatible, uncompressed TIFFs...\e[21m\e[39m"
sudo mkdir $dirLongName/TIFF8/		#create a subdirectory for GIMP compatible TIFFs
echo -e "\e[1m\e[31mconverting files...\e[21m\e[39m"
sudo rawtherapee -o TIFF8/ -b8 -t -c *.CR2
echo -e "\e[1m\e[31mmaking extra directories for later organization...\e[21m\e[39m"
sudo mkdir $dirLongName/GIMP_files/
sudo mkdir $dirLongName/Renders
echo -e "\e[1m\e[31mdone.\e[21m\e[39m"


#		\e[1m	--	Bold
#		\e[21m	--	Normal weight
#		\e[31m	--	Red
#		\e[32m	--	Green
#		\e[33m	--	Yellow
#		\e[34m	--	Blue
#		\e[39m	--	Default color
