# A simple installer for robotpy that works for linux, can be used to download setups for most robot types, in virtual/global environments, and with different robotpy versions #

sudo echo "Installing python"
sleep 1
sudo apt install python3.12                              # In case the user forgot to install python when they are literally a python programmer
sudo apt install pip -y                                  # Installs the python package manager
sudo apt install zenity                                  # A file selector for the installer to use, might already be installed with linux distros like ubuntu

# Gets the user input for version of robotpy (since we sometimes work with the 2024.3.2.2 version)
read -p "Do you want to install the newest version of robotpy? (recommended) [Y/n]: " uinput
# Will decide what environment the user wants to have the robotpy modules loaded in
read -p "Do you want to install in a virtual environment (rather than a globally)? [Y/n]: " EnvironmentChoice
# Gets the user's robot type so you don't install uneccessary packages
read -p "What robot are you going to be using? (D/S/T/manual): " GRobotType   

if [[ $GRobotType == "manual" ]]; then
    echo "To install packages/modules manually, go into the robot directory, and edit the \"pyproject.toml\" so that he packages you want are no longer commented out, and then run \"robotpy sync\""
elif [[ ! $GRobotType == *"D"* ]] && [[ ! $uinput2 == *"S"* ]] && [[ ! $uinput2 == *"T"* ]] && [[ ! $uinput2 == *"d"* ]] && [[ ! $uinput2 == *"s"* ]] && [[ ! $uinput2 == *"t"* ]]; then
    echo "Invalid input for robot selection, make sure you choose either Drive train, Swerve bot, or Tank bot"
    exit;
fi


if [[ -z $EnvironmentChoice ]] || [[ $EnvironmentChoice == 'y' ]] || [[ $EnvironmentChoice == 'Y' ]]; then
    zenity --info --text="PLEASE SELECT YOUR ROBOT'S FOLDER (make one now if you haven't already)"    # Brings up a UI that gives intruction
    UserDirectorySelection=$(zenity --file-selection --directory)   # Will direct the user to select a directory where their robotpy files are located, ONE FOR EACH REPOSITORY       # cd $UserDirectorySelection
    cd $UserDirectorySelection                                      # Puts user into the programming folder that they chose
    
    python3 -m venv .env            # Make virtual environment
    source ./.env/bin/activate      # Enter virtual environment
    
    echo -e "\nBeginning Installation"
    sleep 1
    echo "Reinstalling robotpy"
    pip config set global.break-system-packages true                        # Will prevent your system from flagging robotpy as external packages, causing it to not install (makes a new file if not already made)
    if [ -z $uinput ] || [ $uinput == "Y" ] || [ $uinput == "y" ]; then     # Will check whether the use inputted nothing, "y", or "Y"
        python3 -m pip install robotpy                                      # Installs the correct version of robotpy, newer versions do not include phoenix5
    else
        python3 -m pip install robotpy==2024.3.2.2
    fi
    case "$GRobotType" in
        D | d)      # If the user chose Drive Train )
            python3 -m pip install robotpy["commands2","phoenix5"];;                            # Installs robotpy's dependancies so that your code will work, installs robotpy-commands-v2 and robotpy[phoenix5] (IDK phoenix5's package name is, but you can install it with that name)

        S | s)      # If the user chose Swerve Bot )
            python3 -m pip install robotpy["apriltag","commands2","navx","phoenix5","rev"];;    # Installs robotpy's dependancies so that your code will work, installs packages: robotpy-commands-v2, robotpy[apriltag], robotpy[navx], robotpy[phoenix5], robotpy[rev]

        T | t)      # If the user chose Tank Bot )
            echo -e "No current configuration for tank bot at the moment, you will have to install manually through the project.toml or download from the \e]8;;https://github.com/AltaHighRobotics/Robotpy-Templates\aRobotpy Templates in Github\e]8;;\a";;
    esac
    pip config set global.break-system-packages false                        # Will prevent your system from flagging robotpy as external packages, causing it to not install (makes a new file if not already made)
    echo -e "\n\nInstallation Complete!\n"

else
    echo "Beginning Installation"
    sleep 1
    echo "Reinstalling robotpy"

    pip config set global.break-system-packages true                        # Will prevent your system from flagging robotpy as external packages, causing it to not install (makes a new file if not already made)
    if [ -z $uinput ] || [ $uinput == "Y" ] || [ $uinput == "y" ]; then     # Will check whether the use inputted nothing, "y", or "Y"
        python3 -m pip install robotpy                                      # Installs the correct version of robotpy, newer versions do not include phoenix5
    else
        python3 -m pip install robotpy==2024.3.2.2
    fi

    zenity --info --text="PLEASE SELECT YOUR ROBOT'S FOLDER (make one now if you haven't already)"    # Brings up a UI that gives intruction
    UserDirectorySelection=$(zenity --file-selection --directory)   # Will direct the user to select a directory where their robotpy files are located, ONE FOR EACH REPOSITORY       # cd $UserDirectorySelection
    cd $UserDirectorySelection                                      # Puts user into the programming folder that they chose
    python3 -m robotpy init                                         # Creates robotpy files for the user to modify in the case that they 

    case "$GRobotType" in
        D | d)      # If the user chose Drive Train )
            python3 -m pip install robotpy["commands2","phoenix5"];;                            # Installs robotpy's dependancies so that your code will work, installs robotpy-commands-v2 and robotpy[phoenix5] (IDK phoenix5's package name is, but you can install it with that name)

        S | s)      # If the user chose Swerve Bot )
            python3 -m pip install robotpy["apriltag","commands2","navx","phoenix5","rev"];;    # Installs robotpy's dependancies so that your code will work, installs packages: robotpy-commands-v2, robotpy[apriltag], robotpy[navx], robotpy[phoenix5], robotpy[rev]

        T | t)      # If the user chose Tank Bot )
            echo -e "No current configuration for tank bot at the moment, you will have to install manually through the project.toml or download from the \e]8;;https://github.com/AltaHighRobotics/Robotpy-Templates\aRobotpy Templates in Github\e]8;;\a";;
    esac
    pip config set global.break-system-packages false       # Sets external package system back to system default (don't want your files being unsecure, do we pookie? <3)
    echo -e "\n\nInstallation Complete!\n"
fi





#Stay silly friends :3
