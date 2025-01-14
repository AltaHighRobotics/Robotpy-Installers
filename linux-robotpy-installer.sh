apt install pip -y                                  #Installs the python package manager

pip config set global.break-system-packages true    #Will prevent your system from flagging robotpy as external packages, causing it to not install (makes a new file if not already made)
python3 -m pip install robotpy==2024.3.2.2          #Installs the correct version of robotpy, newer versions do not include phoenix5, which is BAD

apt install zenity                                              #A file selector for the installer to use, might already be installed with linux distros like ubuntu

zenity --info --text="PLEASE SELECT YOUR PROGRAMMING FOLDER"    #Brings up a UI that gives intruction
UserDirectorySelection=$(zenity --file-selection --directory)   #Will direct the user to select a directory where their robotpy files are located, ONE FOR EACH REPOSITORY
cd $UserDirectorySelection

python3 -m robotpy init                                 #Creates robotpy files for the user to modify in the case that they 
python3 -m pip install robotpy["commands2","phoenix5"]  #Installes robotpy's dependancies so that your code will work, installs robotpy-commands-v2 and robotpy[phoenix5] (IDK phoenix5's package name is, but you can install it with that name)

pip config set global.break-system-packages false       #Sets external package system back to system default (don't want your files being unsecure, do we pookie? <3)
