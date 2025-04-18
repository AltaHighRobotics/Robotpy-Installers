# Robotpy Installers

## Linux

Run the linux-robotpy-installer.sh to download its packages globally (which is fine)

RUN THIS:

`sudo ./linux-robotpy-installer.sh`

This will install python3.12, robotpy (latest or 2024 ver), robotpy-commands-v2 and robotpy[phoenix5] (as they are installed in the script respectively)

#### Error cases
If you are a dummy-dum-dum and think that linux makes you smart, don't forget that you have to be in the SAME DIRECTORY as linux-robotpy-installer.sh

Make sure you are running it as sudo because the program itself requires super user

If you are still getting errors after testing your program, try uninstalling robotpy as you might have the latest version, then run it again

If you use the command: `ls` and the installer is white, you need to run:
```bash
chmod +x linux-robotpy-installer.sh
```
## Windows (barely works)
Run the win-robotpy-installer.py wherever you want to download its packages globally
