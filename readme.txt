+--,        |        +--,        |       +--,             |
|   )         __     |   )  --,  |  .    |   )  --,    _  |  .
+-.`   \  /  (  \    +--`  ,-.|  +-/     +--`  ,-.|  ./ \ +-/
|  \    \/    \      |    |   |  | \     |    |   |  |    | \
|   \   /   \__)     |    `\_/ \ |  \    |    `\_/ \ `\_/ |  \
       `
            ~ for MinUI on Anbernic H700 devices ~            

 #########################
#    PAK PACK CONTENTS    #
 #########################

I. Bonus emulators within MinUI

 1) DC.pak - adds stock's Flycast Xtreme RetroArch core for Dreamcast emulation.
 2) DS.pak - adds stock's DraStic standalone for Nintendo DS emulation.
 3) GBARA.pak - adds stock's MGBA RetroArch core with bezels and shaders for the SP-lovers.
 4) N64.pak - adds stock's Mupen64 Plus Next RetroArch core for Nintendo 64 emulation.
 5) NEOGEO.pak - adds stock's FBAlpha2012 RetroArch core for Neo-Geo emulation.
 6) P8-NATIVE.pak - adds native (i.e. not emulated) Pico-8. (see "Installing Pico-8" section)
 7) PSPRA.pak - adds stock's PPSSPP RetroArch core for Playstation Portable emulation.
 8) PSPSA.pak - adds stock's PPSSPP standalone for Playstation Portable emulation.
 9) VARCADE.pak - adds stock's FBNEO pre-configured for vertical arcade emulation.

II. Tools to get more out of MinUI

 1) Reboot into Stock.pak (and REBOOT-INTO-MINUI.sh APP) - allow you to swap back and forth between MinUI and the stock or modified stock firmware without having to manually fiddle with files on your SD cards.
 2) Switch to Collections.pak (and Switch to Consoles.pak) - allow you to swap between the default console-based view in MinUI, and a view that puts your custom collections front and center. I've also included some example Collections files to give you some ideas of how to build them.
 3) eBook Reader.pak - allows you to read eBooks from any location on either SD card.
 5) Music Player.pak - allows you to play audio files from the Music folder on either SD card.
 6) Retroarch.pak - launches Retroarch with no core/content loaded, so you can mess with settings.
 7) 2048.pak - that one game where you smush powers of 2 together. It's already there buried in the stock firmware... might as well make it accessible.
 8) Arcade Detailed View.pak - toggles the names of your VARCADE games from their simplified names, to their full descriptions with parenthetical information (such as version number or publisher), to their bare filenames, and back again. Note that this tool will change its name to whatever view it will set the arcade titles to.
 9) Splore.pak (and associated stock OS apps) - gives full access to Splore, which is Pico-8's lovely native launcher and uber-addictive free game store. (see "Installing Pico-8 section)
10) Clear Recently Played.pak - clears your Recently Played list in MinUI.


 ####################
#    INSTALLATION    #
 ####################

To install these paks, simply copy the included Emus, Roms, .Collections, and Tools folders onto the root of the SD card you have already installed MinUI on, merging them with the existing folders of the same name. Then, just add your Roms to the appropriate subfolders in "Roms/" and you should be good to go.

If you don't want to install a particular extra pak, no problem - the only paks that rely on the existence of one another are those related to Splore and native Pico-8. You can freely delete any of these extras either before or after you load them onto your SD card without affecting any functionality of either MinUI or the stock firmware.


 ########################
#    INSTALLING PICO-8   #
 ########################

Installing native Pico-8 is a little more involved, but ultimately comes down to dragging and dropping a few files and folders where you need them, then running a couple of tools.

Native Pico-8 on MinUI REQUIRES the following files and folders from this Pak Pack to be installed:

- "Roms/APPS/REBOOT-INTO-MINUI.sh"
- "Tools/rg35xxplus/Reboot into Stock.pak" (and its contents)
- "Tools/rg35xxplus/Splore.pak" (and its contents)
- "Tools/rgb30/Splore.pak" (and its contents)

In order to use Splore to download free games from the BBS, you will also need:

- "Roms/APPS/Install_Prereqs.sh"

To get the most out of native Pico-8, the following files and folders can be installed as well:

- "Emus/rg35xxplus/P8-NATIVE.pak" (and its contents)	= launches native P8 games from MinUI menu
- "Emus/rgb30/P8-NATIVE.pak" (and its contents)		= ensures full compatibility with MinUI's native P8 on RGB30
- "Roms/APPS/Splore.sh"					= allows native P8 and Splore to be launched as a stock OS app
- "Roms/APPS/Import_Carts_to_Splore.sh"			= adds existing carts in Roms/PICO folders to offline Splore
- "Roms/Pico-8 - Native (P8-NATIVE)" (and its contents)	= holds carts to launch with P8-NATIVE.pak
- "Roms/PICO" (and its contents)			= holds carts for stock's Fake-08 emulator; can be imported to Splore

1) Install your chosen subset of the above carts and apps by copying them to your SD card.

2) Next, you will need a copy of the latest and greatest version of the Raspberry Pi edition of Pico-8. This can be bought and downloaded at https://www.lexaloffle.com/games.php?page=updates . Inside the .zip should be a folder labeled "pico-8" - copy this whole folder (not just its contents) into "Tools/rgb30/Splore.pak". [Yes, the rgb30 Splore.pak, not the rg35xxplus one.]

3) If you already have some Pico-8 carts that you would like to put onto your device for offline play, you can add them to the "Roms/PICO" folder on either SD card at this point. If you are using a device that does not have Wi-Fi, you will definitely want to do this.

4) Now, load your SD cards into your device and boot it up. Then use the "Reboot into Stock" tool.

5) If you are using a device that has Wi-Fi, go to Settings > Network Settings > WIFI Settings, and set Enable WIFI to ON. Then input your WIFI Name and WIFI Password and make sure that you get assigned an IP address and your Status is Connected - then you can go back to the main menu.

6) If you are connected to the internet, go to App Center > APPS > TF02, and run Install_Prereqs. You will get a Loading message, and the screen may turn black. Just be patient, as it takes a minute or two to run this script. This step is required before you will be able to download and play non-local carts off of Splore. 

7) If you preloaded the "Roms/PICO" folders in step 3, run the Import_Carts_to_Splore app now. Again, if you are on a device without Wi-Fi, this step is pretty important.

8) Now, you will be able to use Splore to play Pico-8 natively - no inaccurate emulation required - from both the stock OS and MinUI! For best results, make sure that you are connected to the internet BEFORE launching Splore. If you have booted back to MinUI, just wait for the signal icon in the top right corner to appear.



 ################
#    UPDATING    #
 ################

To update from one version of this Pak Pack to another, simply copy the files and folders that you want to update from the new version onto your SD card as though you were installing it anew, overwriting any conflicting files. I'll try not to break stuff between releases.



 #####################
#    CUSTOMIZATION    #
 #####################

To create your own MinUI paks for other stock RetroArch cores:

1) Make a copy of the GBARA.pak folder in Emus/rg35xxplus.
2) Rename that folder to the abbreviation of your target system, followed by ".pak", e.g. A7800.pak
3) Open the launch.sh file in your new folder using Notepad or some other text editor.
4) On line 3, change the GBA in export EMU="GBA" to whatever the STOCK firmware refers to that system as, e.g. export EMU="A7800"
5) On line 4, change the mgba in EMU_EXE="mgba" to the exact name of your desired core, leaving out any trailing "_libretro.so", e.g. EMU_EXE="prosystem"
6) Save the changes to launch.sh and close your text editor.
7) In the Roms folder, create a subfolder with the format nameofconsole (abbreviation), e.g. Atari 7800 (A7800). Note that the abbreviation in parentheses has to be the exact same as the name of your .pak.
8) Load up your roms, and go play your games!

Note: This method will respect whatever settings you had on the stock firmware for shaders and bezels.



 ####################
#    KNOWN ISSUES    #
 ####################

1) Swapping between default and collections-based views will clear your Recently Played list. Not likely to change with future revisions.

2) Power key does either nothing, or weird stuff, in many custom paks - especially those based on RetroArch.



 ###############
#    CREDITS    #
 ###############

- Ryan Sartor (a.k.a. Ry) - that's me. I authored most of the custom scripts and other files and folders in this pak pack, and I maintain the project as a whole. If you'd like to support my work you can donate at https://ko-fi.com/rymsar .
- Shaun Inman - for creating and maintaining the excellent MinUI, and for providing the dual boot scripts (which I have only minorly modified). Also, for tolerating all my Discord pings, and always helping out with scripting when I don't know how to accomplish something.
- Brenoit - for his extensive help and testing, especially with regard to the native Pico-8 functionality. Cool dude.
- Sheikh (cybardev) - for contributing Clear Recently Played.pak, as well as for extensive  troubleshooting, testing, and contributing some scripting for DS.pak.
- Stubbs (Retro Handhelds) - for leading the amazing community that has connected me with all these wonderful people.
- Russ (RetroGameCorps) - for linking to this repo from his SP setup guide, leading to much greater visibility for our project.
- moto (game-de-it) - for sharing insight into the virtual analog stick switching mechanism in the stock firmware.
- G.R.H. (cbepx-me) - for creating many of the scripts in the stock firmware, which these paks sometimes either reference or modify.
- Anbernic - for developing and making all these nifty RG__XX__ devices, without which none of the aforementioned work would exist.
- Testers and bug reporters - Without their time and effort, this project would not be able to progress.
     - Lesynn      - RNS          - ozzyozzyjames    - lemonzest    - bub181
     - nbrXD       - axelrider    - Ramsa            - Adam D
- If I forgot anyone else, please let me know so I can add them to the credits!


Please note that this release is not "official" or otherwise endorsed by MinUI or Shaun Inman. I also take no responsibility for anything that happens due to your use or misuse of the files in this release. That said, feel free to ping @rymsar in the #rg35xx_plush_28xx channel of the Retro Handhelds Discord server if you have any questions, or suggestions for how to improve this Pak Pack.



 ##################
#    CHANGE LOG    #
 ##################

v1 - 2024-05-14
     - Initial release for RG28xx
     - Added N64.pak, DC.pak, PSPRA.pak

v2 - 2024-05-15
     - Added PSPSA.pak
     - Added Reboot into Stock.pak and REBOOT-INTO-MINUI.sh
     - First readme version, with instructions for creating custom RA paks for RG28xx

v3 - 2024-05-18
     - Added Switch to Collections.pak and .Switch to Consoles.pak
     - Added .Collections folder with example collections

v4 - 2024-05-20
     - Added DS.pak

v5 - 2024-05-21
     - Added VARCADE.pak
     - Added eBook Reader.pak
     - Added File Browser.pak
     - Added Music Player.pak

v6 - 2024-05-23
     - Added Retroarch.pak
     - Added 2048.pak
     - Added Arcade Detailed View.pak
     - Added map.txt and .map_detail.txt to VARCADE Roms folder

v7 - 2024-05-29
     - Initial support for H700 devices other than RG28xx
     - DS.pak and PSPSA.pak now detect which device you are using and launch accordingly
     - Fixed a bug with certain VARCADE games being present in your Roms folder preventing 
       you from viewing and launching any VARCADE games (modified map.txt and .map_detail.txt)
     - Overhauled the readme, if that matters for anything

v8 - 2024-06-16
     - Added P8-NATIVE.pak and Splore.pak for both H700 line and RGB30
     - Added stock OS apps: Splore.sh, Install_Prereqs.sh, Import_Carts_to_Splore.sh
     - Updated VARCADE.pak to only rotate controls for the RG28xx
     - Power key now switches back and forth from stylus input on DS.pak
     - Select key now switches back and forth between D-pad and Analog stick input for DC.pak and N64.pak
     - R2 key now switches back and forth between D-pad and Analog stick input for PSPRA.pak and PSPSA.pak

v9 - 2024-06-18
     - Added GBARA.pak for stock-like GBA, with bezels and shaders, especially for the SP-lovers.
     - Added NEOGEO.pak
     - Overhauled Arcade Detailed/Title/Filename View.pak to work for NEOGEO.pak as well
     - Updated most emulator launch scripts to be more SD card-agnostic
     - Fixed bug where d-pad/analog stick control hot-swapping disabled the A button
     - Updated instructions for creating custom paks and added list of default RA cores used by stock.

v10- 2024-06-24
     - Changed underlying mechanism of stylus input swap on DS.pak and fixed some bugs (thanks for the help Cybardev!)
     - Added Clear Recently Played.pak (thanks Shaun Inman and Cybardev!)
     - Power button is now the hotkey for input swap for PSPSA.pak
     - Fixed bug where dpad wouldn't work in the menu sometimes after using input swap hotkeys
     - Added List_Roms.sh stock OS app to generate a romlist.txt at the root of TF1
     - Added volume/brightness controls to Splore.sh stock app
     
v11- 2024-09-??
     - Removed File Browser.pak since MinUI proper now has Files.pak for this platform
     - Added missing.png to P8-Native and Splore paks since MinUI added show.elf for this platform
     - Corrected a few incorrect mappings in map.txt and .map_detail.txt (thx Shaun, bub181, lemonzest)
     - Fixed inputs for DS.pak that broke after a recent MinUI update (thx haysidney, kurtmorris, BrianMetallaoui, dleicht) 


