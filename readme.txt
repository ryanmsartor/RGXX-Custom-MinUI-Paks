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
 6) PSPRA.pak - adds stock's PPSSPP RetroArch core for Playstation Portable emulation.
 7) PSPSA.pak - adds stock's PPSSPP standalone for Playstation Portable emulation.
 8) VARCADE.pak - adds stock's FBNEO pre-configured for vertical arcade emulation.

II. Tools to get more out of MinUI

 1) Reboot into Stock.pak (and REBOOT-INTO-MINUI.sh APP) - allow you to swap back and forth between MinUI and the stock or modified stock firmware without having to manually fiddle with files on your SD cards.
 2) Switch to Collections.pak (and Switch to Consoles.pak) - allow you to swap between the default console-based view in MinUI, and a view that puts your custom collections front and center. I've also included some example Collections files to give you some ideas of how to build them.
 3) eBook Reader.pak - allows you to read eBooks from any location on either SD card.
 5) Music Player.pak - allows you to play audio files from the Music folder on either SD card.
 6) Retroarch.pak - launches Retroarch with no core/content loaded, so you can mess with settings.
 7) 2048.pak - that one game where you smush powers of 2 together. It's already there buried in the stock firmware... might as well make it accessible.
 8) Arcade Detailed View.pak - toggles the names of your VARCADE games from their simplified names, to their full descriptions with parenthetical information (such as version number or publisher), to their bare filenames, and back again. Note that this tool will change its name to whatever view it will set the arcade titles to.
 9) Clear Recently Played.pak - clears your Recently Played list in MinUI.


 ####################
#    INSTALLATION    #
 ####################

To install these paks, simply copy the included Emus, Roms, .Collections, and Tools folders onto the root of the SD card you have already installed MinUI on, merging them with the existing folders of the same name. Then, just add your Roms to the appropriate subfolders in "Roms/" and you should be good to go.

If you don't want to install a particular extra pak, no problem. You can freely delete any of these extras either before or after you load them onto your SD card without affecting any functionality of either MinUI or the stock firmware.


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

 ###############
# NATIVE PICO-8 #
 ###############

Paks for playing native Pico-8 on MinUI for the RG_XX line of devices and RGB30 have been moved to: <https://github.com/ryanmsartor/Native-Pico-8-for-MinUI-for-RG_XX-devices-and-RGB30/releases/latest>.

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
     
v11- 2024-11-23
     - Removed File Browser.pak since MinUI proper now has Files.pak for this platform
     - Corrected a few incorrect mappings in map.txt and .map_detail.txt (thx Shaun, bub181, lemonzest)
     - Fixed inputs for DS.pak that broke after a recent MinUI update (thx haysidney, kurtmorris, BrianMetallaoui, dleicht) 
     - Removed Native Pico-8 and Splore paks - these are now hosted separately at <https://github.com/ryanmsartor/Native-Pico-8-for-MinUI-for-RG_XX-devices-and-RGB30/releases/latest>.
