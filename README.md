> [!NOTE] 
> __TL;DR__: This tutorial is made to help you install windows through docker on your steamdeck

# What is this repo ?
This repo has been made to help you run windows on a steamdeck. Not a powerfull version, but still usable for desktop applications (NOT AAA GAMES etc !).

It could run basic desktop apps such as Word, Excel, Firefox, Discord, or other. The inital goal for me was to run the [DOFUS MMORPG](https://www.dofus.com/en) (and it works great! even multi-account!)

## How does it run windows ? 
This project is based on [Dockur - Windows](https://github.com/dockur/windows) which provide you a simple way to run a windows VM with docker through a KVM container. It is really easy to use and have a lot of cool features. If you're a bit handy with linux and docker, please look at their work !

> [!TIP]
> I made choices when I created scripts of this repo, for example I limited the storage to 30GB. But you could tweek them really easily by simply read the code and adapt it with the Dockur - Windows doc. Have fun !

# Install Automatically

## Before the install 

* You need to setup a admin password for your steamdeck with the `passwd` command. More information [here](https://nomadthecreator.substack.com/p/steam-deck-how-to-set-a-root-password).

## Clone the repo
1) First thing first, you need to clone this repo. To do so, use your steamdeck in [desktop mode](https://help.steampowered.com/en/faqs/view/671A-4453-E8D2-323C)

2) Two main ways here, you can __download the zip file__ or use the command
```bash
git clone https://github.com/Aatchouuuum/steamdeck-docker-windows.git
```
3) Now you'll have to open the directory in a terminal, by using the following command if you cloned the repo via CLI, or by opening your file explorer, navigating to the repo and right-click -> open terminal :
```bash
cd steamdeck-docker-windows
```
4) And run the auto install script :
```bash
./autoInstallDockerWindows.sh
```
And type `y` then press `enter` when ask for.

This script basically enable and configure pacman, a package manager used by SteamOS, download `docker` and `docker-compose` which are used to run our VM and download [Remmina](https://remmina.org/) from the [flathub repo](https://flathub.org/apps/org.remmina.Remmina) which are used to connect to Windows. Last, the script run the `docker-compose up -d` command to create our docker container that encapsulate Windows.
> [!IMPORTANT] 
> You can edit the `docker-compose.yaml` file to choose the windows version you want. <br> I configued the default `win11` as it is the faster to DL, but I would recommand you to use tiny11 for better performances.<br> The line 21 `- ./tiny11.iso:/storage/custom.iso` is here in case github allows me keep the `tiny11.iso` file in this repo but I doubt it. <br>To choose a version, refer to the [Dockur - Windows](https://github.com/dockur/windows#FAQ) doc.

> [!WARNING]  
> Sometimes, the script crash. You can try to relunch it, if it works : cool! Else try to reboot your Steamdeck and relunch the script. If it still doesn't work, you'll have to read the terminal output and debug it for your personnal case. Don't forget: Keep calm and read the terminal. <br> Tips: One of the main problem is the add of docker to the usergroup to escape the use of the `sudo` cmd.

5) Once the script has been lunched, a browser pointing to [localhost:8006](http://localhost:8006) should open. This will help you monitor the windows installation process. When it's done, you'll find a classic Windows interface. You can play with it or close the window and go to the next point.

6) Everything has been installed succesfuly, congrats! Now you can open Steam, go to your Library and click on `Add a game` -> `Add a Non-Steam Game...` at the bottom of the window. A window opens, click `Browse` and navigate to our repository then select the `startWindows.sh` file and click open. Click `Add Selected Programs` and "Ta-da!" your shortcut to run your windows VM is here. You can now find your windows-luncher shortcut, edit it by cliking proprieties, rename it to windows and add the windows logo contained in the repo.

7) Now you can configure Remminal in the next section. When it's done, think about rebooting your Steamdeck so all configurations can take place. Have fun !

# How to configure Remmina

1) When Remmina open, click the __+__ button in the top left corner.
2) Name it `Windows` and choose the protocol `RDP - Remote Desktop Protocol`.
3) In the `Server` input, type `localhost:3389`
4) In the `Username` input, type `docker`
5) Scroll and find `Resolution`. Here you need to setup a custom resolution. I personnaly use 1280x800 as it's the steamdeck's screen resolution.
   * to add a custom resolution, click the `...` button next to the selector, then click the `+` button and add your custom resolution. Then click `close` and select your freshly created new resolution.
6) Go to the advance tab and find the `Audio output mode` and select `Local`. In the same tab, you can aslo change the `Quality` value depending of your willing.
7) Click save and double click your brand new connection entry.
8) Use the top bar setting to full screen the display and configure it as you wish.
   
> [!NOTE]
> To quit the application, simply shutdown windows !
   
> [!TIP]
> To desable the default top menu bar: Start Remmina but insteed of lunching windows, click the option button (the "list" icon), then click `Preferences`, go to `Appearance`, put the `Fullscreen toolbar visibility` to `Off`, then check the 2 first checkboxes and uncheck the third one. 
