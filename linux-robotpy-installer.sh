sudo echo "Installing python"
sleep 1
sudo apt install python3.12                              #In case the user forgot to install python when they are literally a python programmer
sudo apt install pip -y                                  #Installs the python package manager
sudo apt install zenity                                  #A file selector for the installer to use, might already be installed with linux distros like ubuntu

pip config set global.break-system-packages true    #Will prevent your system from flagging robotpy as external packages, causing it to not install (makes a new file if not already made)

read -p "Do you want to install the newest version of robotpy? (recommended) [Y/n]: " uinput     # Gets the user input for version of robotpy
read -p "What robot are you going to be using? (D/S/T): " GRobotType         # Gets the user's robot type
if [[ ! $GRobotType == *"D"* ]] && [[ ! $uinput2 == *"S"* ]] && [[ ! $uinput2 == *"T"* ]] && [[ ! $uinput2 == *"d"* ]] && [[ ! $uinput2 == *"s"* ]] && [[ ! $uinput2 == *"t"* ]]; then
    echo "Invalid input for robot selection, make sure you choose either Drive train, Swerve bot, or Tank bot"
    exit;
fi

echo "Beginning Installation"
sleep 1
echo "Reinstalling robotpy"
if [ -z $uinput ] || [ $uinput == "Y" ] || [ $uinput == "y" ]; then     #Will check whether the use inputted nothing, "y", or "Y"
    python3 -m pip install robotpy                      #Installs the correct version of robotpy, newer versions do not include phoenix5
else
    python3 -m pip install robotpy==2024.3.2.2
fi

zenity --info --text="PLEASE SELECT YOUR PROGRAMMING FOLDER"    #Brings up a UI that gives intruction
UserDirectorySelection=$(zenity --file-selection --directory)   #Will direct the user to select a directory where their robotpy files are located, ONE FOR EACH REPOSITORY       # cd $UserDirectorySelection
cd $UserDirectorySelection                                      #Puts user into the programming folder that they chose
python3 -m robotpy init                                 #Creates robotpy files for the user to modify in the case that they 

case "$GRobotType" in
    D | d)      # If the user chose Drive Train )
        python3 -m pip install robotpy["commands2","phoenix5"];;  #Installes robotpy's dependancies so that your code will work, installs robotpy-commands-v2 and robotpy[phoenix5] (IDK phoenix5's package name is, but you can install it with that name)

    S | s)      # If the user chose Swerve Bot )
        python3 -m pip install robotpy["apriltag","commands2","navx","phoenix5","rev"];;  #Installes robotpy's dependancies so that your code will work, installs packages: robotpy-commands-v2, robotpy[apriltag], robotpy[navx], robotpy[phoenix5], robotpy[rev]

    T | t)      # If the user chose Tank Bot )
        echo "No current configuration for tank bot at the moment, you may have to install manually through the project.toml";;
esac
pip config set global.break-system-packages false       #Sets external package system back to system default (don't want your files being unsecure, do we pookie? <3)

#Stay silly friends
