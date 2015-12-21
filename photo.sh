#!/bin/bash
#Auto backup Canon camera and convert to .tif 8-bit for GIMP.
#
# 	0.1.3 created 2015-12-21
#	D. Scott Boggs


currentDate=$(date +"%Y-%m-%d")		#save current date for filename
dirName=$"Canon_Backup_$currentDate"
dirLongName=$"/home/$USER/Pictures/$dirName"
echo -e "\e[1m\e[31mCreating folder $dirName...\e[21m\e[39m"
sudo mkdir $dirLongName   #create folder for today's dump
sudo chmod 777 $dirLongName

echo -e "\e[1m\e[31mDectecting Camera...\e[21m\e[39m"
gphoto2 --auto-detect		#Don't forget to find the camera!
echo -e "\e[1m\e[31mRetrieving files from camera and saving them to $dirLongName...\e[21m\e[39m"
cd $dirLongName
sudo gphoto2 --get-all-files		#get all files and save to new dir

echo -e "\e[1m\e[31mCreating folder $dirName/TIFF8 for GIMP-compatible, uncompressed TIFFs..."
echo -e "You may now disconnect your camera.\e[21m\e[39m"
sudo mkdir $dirLongName/TIFF8/		#create a subdirectory for GIMP compatible TIFFs
sudo chmod 777 $dirLongName/TIFF8/
echo -e "\e[1m\e[31mconverting files...\e[21m\e[39m"
sudo rawtherapee -o TIFF8/ -b8 -t -c *.CR2
echo -e "\e[1m\e[31mmaking extra directories for later organization...\e[21m\e[39m"
sudo mkdir $dirLongName/GIMP_files/
sudo chmod 777 $dirLongName/GIMP_files/
sudo mkdir $dirLongName/Renders/
sudo chmod 777 $dirLongName/Renders/
echo -e "\e[1m\e[31mdone.\e[21m\e[39m"


#		\e[1m	--	Bold
#		\e[21m	--	Normal weight
#		\e[31m	--	Red
#		\e[32m	--	Green
#		\e[33m	--	Yellow
#		\e[34m	--	Blue
#		\e[39m	--	Default color
