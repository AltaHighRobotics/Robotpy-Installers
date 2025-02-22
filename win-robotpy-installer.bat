@echo off
echo Installing Python...
timeout /t 1 >nul

:: Install Python and pip (if not already installed)
where python >nul 2>nul || (
    echo Python not found. Installing Python 3.12...
    choco install python --version=3.12 -y
)

where pip >nul 2>nul || (
    echo Pip not found. Installing pip...
    python -m ensurepip
)

:: Get user input for RobotPy version
set /p uinput="Do you want to install the newest version of RobotPy? (recommended) [Y/n]: "

:: Decide whether to install in a virtual environment
set /p EnvironmentChoice="Do you want to install in a virtual environment? [Y/n]: "

:: Get the user's robot type
set /p GRobotType="What robot are you using? (D/S/T/manual): "

if /I "%GRobotType%"=="manual" (
    echo "To install manually, edit the 'pyproject.toml' in the robot directory and run 'robotpy sync'."
    exit /b
) 

:: Validate robot type input
if not "%GRobotType%"=="D" if not "%GRobotType%"=="d" if not "%GRobotType%"=="S" if not "%GRobotType%"=="s" if not "%GRobotType%"=="T" if not "%GRobotType%"=="t" (
    echo Invalid input. Choose D, S, or T.
    exit /b
)

:: Virtual environment setup
if /I "%EnvironmentChoice%"=="y" (
    echo Please select your robot's folder...
    for /f "delims=" %%F in ('powershell -Command "[System.Windows.Forms.FolderBrowserDialog]::new().ShowDialog() | Out-Null; [System.Windows.Forms.FolderBrowserDialog]::new().SelectedPath"') do set UserDirectorySelection=%%F

    cd /d "%UserDirectorySelection%" || exit /b
    echo Creating virtual environment...
    python -m venv .env
    call .env\Scripts\activate

    echo "Make sure you activate the virtual environment when using RobotPy." > READ_ME_AFTER_INSTALLATION.txt
)

:: Install RobotPy
if /I "%uinput%"=="y" (
    python -m pip install robotpy
) else (
    python -m pip install robotpy==2024.3.2.2
)

:: Install dependencies based on robot type
if /I "%GRobotType%"=="D" (
    python -m pip install robotpy[commands2,phoenix5]
) else if /I "%GRobotType%"=="S" (
    python -m pip install robotpy[apriltag,commands2,navx,phoenix5,rev]
) else if /I "%GRobotType%"=="T" (
    echo "No pre-configured setup for Tank Bot. Please install manually."
)

python -m robotpy init

echo Installation Complete!
exit /b
