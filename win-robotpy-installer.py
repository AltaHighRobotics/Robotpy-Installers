import sys
import subprocess

print("ROBOTPY INSTALLER\n")
print("  [1] Default install:\n Will install JUST the robotpy library on your device (globally), you will have to install individual dependancies")
#print("  [2] Virtual Enviornment install:\n Will install robotpy only in your current repository (Because I want to know how venv works)          MUST BE IN REPOSITORY DIRECTORY")
print("  [2] Install and setup:\n Will install robotpy globally and also download all the dependancies automatically (commands2 and phoenix5)     MUST BE IN REPOSITORY DIRECTORY")
print('  [3] Help:\n "I have NO idea what I\'m doing, give me guidance, my king, my lord"\n')
uinput = input("What installation method would you like?: ")

runpy = subprocess.check_call
pyinstall = [sys.executable, "-m", "pip", "install", "[PACKAGE THAT IS TO BE INSTALLED]"]
runpy(["Set-ExecutionPolicy", "-Scope CurrentUser", "-ExecutionPolicy", "Unrestricted", "-Force"])
runpy(["Set-ExecutionPolicy", "-Scope CurrentUser", "-ExecutionPolicy", "Bypass", "-Force"])

def DefaultFunc():
    pyinstall[4] = 'robotpy==2024.3.2.2'
    runpy(pyinstall)  #Installs the working version of robotpy that includes phoenix5 dep, because the latest version of robotpy DOES NOT include phoenix5


def VenvFunc():
    #Sets up virtual enviornment
    runpy(['py', '-m', 'venv', '.venv'])
    runpy(['.venv\Scripts\\activate'])
    # runpy(['where', 'python'])
    runpy(['.venv\Scripts\\activate'])

    # python3 -m pip install robotpy
    # python3 -m venv .venv
    # .venv\Scripts\activate
    # python3 -m pip install robotpy["commands2", "phoenix5"]
    
    runpy(['pip', 'config', 'set', 'global.break-system-packages', 'true'])

    pyinstall[4] = 'robotpy==2024.3.2.2'        #Installs the working version of robotpy that includes phoenix5 dep, because the latest version of robotpy DOES NOT include phoenix5
    runpy(pyinstall)
    pyinstall[4] = 'robotpy[commands2]'
    runpy(pyinstall)
    pyinstall[4] = 'robotpy[phoenix5]'
    runpy(pyinstall)

    runpy(['pip', 'config', 'set', 'global.break-system-packages', 'false'])
    
    runpy(['deactivate'])


def FullFunc():
    pyinstall[4] = 'robotpy==2024.3.2.2'        #Installs the working version of robotpy that includes phoenix5 dep, because the latest version of robotpy DOES NOT include phoenix5
    runpy(pyinstall)
    pyinstall[4] = 'robotpy[commands2]'
    runpy(pyinstall)
    pyinstall[4] = 'robotpy[phoenix5]'
    runpy(pyinstall)

def ToddlerTeach():
    print("\nWhat's up script kiddies, here's a extensive explanation on how each option works:\n\n")
    print("Option 1: Default install\n\tThis option is very useful for when you just need a quick and easy robotpy installation, it will install throughtout your machine so that you don't have to reinstall it on other repositories (projects), it will not download extra dependancies such as commands2 (package name: robotpy-commands-v2) and phoenix5 (package name robotpy[phoenix5]), which are the ones that we usually use/n")
    # print("Option 2: Virtual Environment Robotpy Install\n\tThis option will install robotpy in a Virtual Environment (.venv) folder in your repository (project), which isolates it to your repository so that you have a cleaner installation. In order to work properly, you must be in the current project repository that you are going to be programming in. This option WILL automatically download your dependacies that you (most likely) need, those dependancies being commands2 (package name: robotpy-commands-v2) and phoenix5 (package name robotpy[phoenix5])\n")
    print("Option 2: Install Robotpy and Setup dependancies\n\tWill install robotpy globally to your machine AND download dependancies gloably to your machine, MUST BE IN PROJECT REPOSITORY, PLEASE PLEASE PLEASE FOLLOW THAT RULE\n")
    print("That's all cuties <3, have fun programming in python :3\n")


match uinput:
    case "1":
        DefaultFunc()
    # case "2":
    #     if input("Are you sure you're in the correct repository? enter nothing if no: "):
    #         VenvFunc()
    #     else:
    #         print("Good catch")
    case "2":
        if input("Are you sure you're in the correct repository? enter nothing if no: "):
            FullFunc()
        else:
            print("Good catch")
    case "3":
        ToddlerTeach()
    case _:
        print("You did not select an option, bruh")

runpy(["Set-ExecutionPolicy", "-Scope CurrentUser", "-ExecutionPolicy", "Restricted"])


#THE DEPTHS OF UNUSED CODE
    ## reqs = subprocess.check_output([sys.executable, '-m', 'pip', 'freeze'])                 #Lists all pip installed packages 
    ## installed_packages = [r.decode().split('==')[0] for r in reqs.split()]
    ## print(installed_packages)
    ## print(os.getcwd())   #Prints Current directory


# python3 -m pip install robotpy
# python3 -m venv .venv
# .venv\Scripts\activate
# python3 -m pip install robotpy["commands2", "phoenix5"]