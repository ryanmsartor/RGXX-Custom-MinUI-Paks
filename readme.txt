+--,        |        +--,        |       +--,             |
|   )         __     |   )  --,  |  .    |   )  --,    _  |  .
+-.`   \  /  (  \    +--`  ,-.|  +-/     +--`  ,-.|  ./ \ +-/
|  \    \/    \      |    |   |  | \     |    |   |  |    | \
|   \   /   \__)     |    `\_/ \ |  \    |    `\_/ \ `\_/ |  \
       `
              for MinUI on Anbernic H700 devices              

 #########################
#    PAK PACK CONTENTS    #
 #########################

I. Bonus emulators within MinUI

 1) DC.pak - adds stock's Flycast Xtreme RetroArch core for Dreamcast emulation.
 2) DS.pak - adds stock's DraStic standalone for Nintendo DS emulation.
 3) N64.pak - adds stock's Mupen64 Plus Next RetroArch core for Nintendo 64 emulation.
 4) PSPRA.pak - adds stock's PPSSPP RetroArch core for Playstation Portable emulation.
 5) PSPSA.pak - adds stock's PPSSPP standalone for Playstation Portable emulation.
 6) VARCADE.pak - adds stock's FBNEO pre-configured for vertical arcade emulation (RG28xx only).

II. Tools to get more out of MinUI

 1) Reboot into Stock.pak (and REBOOT-INTO-MINUI.sh APP) - allow you to swap back and forth between
    MinUI and the stock or modified stock firmware without having to manually fiddle with files on 
    your SD cards.
 2) Switch to Collections.pak (and Switch to Consoles.pak) - allow you to swap between the default
    console-based view in MinUI, and a view that puts your custom collections front and center.
    I've also included some example Collections files to give you some ideas of how to build them.
 3) eBook Reader.pak - allows you to read eBooks from any location on either SD card.
 4) File Browser.pak - allows you to navigate and sometimes modify or launch files and applications
    on either SD card.
 5) Music Player.pak - allows you to play audio files from the Music folder on either SD card.
 6) Retroarch.pak - launches Retroarch with no core/content loaded, so you can mess with settings.
 7) 2048.pak - that one game where you smush powers of 2 together. It's already there buried in the
    stock firmware... might as well make it accessible.
 8) Arcade Detailed View.pak - toggles the names of your VARCADE games from their simplified names,
    to their full descriptions with parenthetical information (such as version number or
    publisher), to their bare filenames, and back again. Note that this tool will change its name
    to whatever view it will set the arcade titles to.



 ####################
#    INSTALLATION    #
 ####################

To install these paks, simply copy the included Emus, Roms, .Collections, and Tools folders onto
the root of the SD card you have already installed MinUI on, merging them with the existing folders
of the same name. 

Then, don't forget to add your ROMs to the appropriate subfolders in Roms - you'll want to do this
step before you run the dual boot scripts, because the one that switches back to MinUI from stock
is set to clean up any empty folders in the Roms folder, so you would haveto create new, correctly
named folders for your ROMs if that happened.

If you don't want to install a particular extra pak, no problem - there are no interdependencies 
between them that are not mentioned above. You can freely delete any of these extras either before 
or after you load them onto your SD card without affecting any functionality of either MinUI or the
stock firmware.



 ################
#    UPDATING    #
 ################

To update from one version of this Pak Pack to another, simply copy the files and folders from the
new version onto your SD card as though you were installing it anew, overwriting any conflicting 
files. I'll try not to break stuff.



 #####################
#    CUSTOMIZATION    #
 #####################

To create your own MinUI paks for other stock RA cores:

1) Make a copy of the N64.pak folder in Emus/rg35xxplus.
2) Rename that folder to the abbreviation of your target system, followed by ".pak", e.g. "NG.pak" 
   for Neo-Geo.
3) Open the launch.sh file in your new folder using Notepad or some other text editor.
4) Change the "mupen64plus_next" on the line that says "EMU_EXE=mupen64plus_next" to the exact name
   of your desired core, leaving out any trailing "_libretro.so".
5) Save the changes to launch.sh and close your text editor.
6) In the Roms folder, create a subfolder with the format nameofconsole (abbreviation), e.g. Neo-
   Geo (NG). Note that the abbreviation in parentheses has to be the exact same as the name of 
   your .pak.
7) Load up your roms, and go play your games!



 ####################
#    KNOWN ISSUES    #
 ####################

1) Swapping between default and collections-based views will clear your Recently Played list. Not 
   likely to change with future revisions.

2) The power button does not work for these bonus paks like it does in MinUI proper, nor does it
   work the same as it does for the stock firmware, and may instead power off or freeze the system,
   requiring you to restart it. So, no hot-swapping between the analog stick and D-pad using the
   power button, at the moment.

3) The stylus is not mapped to anything by default for DS emulation, so you'll have to figure out
   and map your own control scheme to get games that rely on it to be fully playable. Still working
   on this one too, since the stock firmware uses that pesky power button for this.

4) Many of these custom paks are written assuming you are running them off of the second SD card,
   so some things may not work as intended if you run MinUI completely off of SD card 1. Depending
   on demand, this may be fixed in the future. Or, you can modify the scripts yourself to change
   any reference of /mnt/sdcard/ to /mnt/mmc/ ...

5) VARCADE.pak currently only works properly on the RG28xx, though an update to address this is in 
   the works.


 ###############
#    CREDITS    #
 ###############

- Ryan Sartor (a.k.a. Ry) - that's me. I authored most of the custom scripts and other files and 
  folders in this pak pack, and I maintain the project as a whole. If you'd like to support my work
  you can donate at https://ko-fi.com/rymsar .

- Shaun Inman- for creating and maintaining the excellent MinUI, and for providing the dual boot
  scripts (which I have only minorly modified). Also, for tolerating all my Discord pings, and 
  always helping when I don't know how to accomplish something.

- G.R.H. (a.k.a. cbepx-me) - for creating many of the scripts in the stock firmware, which these 
  paks sometimes either reference or modify. Still unclear to me whether they are an Anbernic 
  employee, or just an enthusiastic community dev whose work Anbernic has co-opted <_<;; I'd like 
  to credit any other devs of the stock firmware as well, but to my knowledge none of their
  identities are public.

- Anbernic - for developing and making all these nifty RG__XX__ devices, without which none of the
  aforementioned work would exist.

- Testers - the following Discord users have been invaluable in testing on devices I do not yet
  have. Without their time and effort, this project would not be able to progress.
     - Lesynn
     - RNS
     - ozzyozzyjames
     - Brenoit

- If I forgot anyone else, please let me know so I can add them to the credits!

Please note that this release is not "official" or otherwise endorsed by MinUI or Shaun Inman. I 
also take no responsibility for anything that happens due to your use or misuse of the files in 
this release. That said, feel free to ping @rymsar in the #rg35xx_plush_28xx channel of the Retro
Handhelds Discord server if you have any questions, or suggestions for how to improve this Pak Pack.



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

v8 - 2024-06-?? [WORK STILL IN PROGRESS; NOT READY FOR RELEASE]
     - Native Pico-8 APP for stock firmware (RG28xx only)
     - Splore.pak and P8-NATIVE.pak for MinUI (RG28xx only)
     - VARCADE.pak now detects which device you are using and launches accordingly.