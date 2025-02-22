# Robotpy Installers
A simple installer for robotpy that works for linux and windows, can be used to download setups for most robot types, in virtual/global environments, and with different robotpy versions

## Linux
#### How to use:
Run the linux-robotpy-installer.sh, shouldn't matter where you run it.

Make sure that you have your robot's programming folder already made so that you can select it with the installer, e.g. ~/Robotics/Robots/NewRobotDir

RUN THIS:

`sudo ./linux-robotpy-installer.sh`

This will install python3.12, robotpy (current ver or ver 2024.3.2.2), and all the packages needed for specific robots

#### Error cases
- If you are a dummy-dum-dum and think that linux makes you smart, don't forget that you have to be in the SAME DIRECTORY as linux-robotpy-installer.sh
- Make sure you are running it as sudo because the program itself requires super user
- If you are still getting errors after testing your program, try uninstalling robotpy as you might have the latest version, then run it again
- If you installed the virtual environment version, check that your terminal entry line has the `(.env)` prefix, if you don't see it, then run:
    ```bash
    source .env/bin/activate # .env is a folder stored in the robot programming folder, NOT the /robot/ directory
    ```

###### Drive Train Packages:
robotpy-commands-v2 and robotpy[phoenix5]
###### Swerve Packages:
robotpy-commands-v2, robotpy[apriltag], robotpy[navx], robotpy[phoenix5], robotpy[rev]
###### Tank Packages:
Installer does not work with this robot yet
___
## Windows (barely works)
Run the win-robotpy-installer.py wherever you want to download its packages globally (since I haven't figured out window python venvs yet)
