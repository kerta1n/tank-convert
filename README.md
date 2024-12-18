# tank-convert
Repo with everything you need (- the Lineage) to convert a 2nd gen Amazon Fire Stick to Lineage 12/Android 5.1 (clean Android TV!)

Currently, Android 5.1 is the only newest version available for this HW, but I did some digging and found a device tree for Android 7: https://github.com/cmtank/device_amazon_tank/tree/cm-14.1. If you happen to know how to build LOS with different trees and actually do, please open an issue and I will link it.  

Tools you need are a butter knife and a small conductive piece of wire (I used a twist tie and it worked fine). The shortpoint is in "Installing TWRP", for ground, I hooked the twist tie into the heatsink that is soldered to the PCB.  

The only thing you need to download from outside this repo is the Lineage OS zip file (Git storage limits). Use this: https://androidfilehost.com/?fid=8889791610682947296  

Installing TWRP: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/  

Installing LOS: https://forum.xda-developers.com/t/rom-unlocked-tank-lineageos-12-1.3961110/  

If you run into "downgrade failure", comment out the if loop, lines 114-116 under amonet/modules/main.py and try again.  

If you run into not being able to reboot into Fastboot, follow these instructions (use the preincluded gpt folder) https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/post-79056952  

If you have run the gpt fix multiple times and are sure your short was placed correctly, try re-trying the exploit without the gpt fix (re-clone this repo and try again basically)  

If after you start Android and your `Optimizing apps` takes too long, you want to flash more apps besides GAPPS (Magisk), or you need to get back into TWRP, run the `amonet/boot-recovery.sh` script as sudo, and AFTER you run it plug the device into your Linux machine.  

The OpenGAPPS build for this specific HW is for some reason not available on the website, so I've linked it here: https://androidfilehost.com/?fid=8889791610682906163  

I do not advise transferring APKs into storage while in TWRP, as you cannot delete them once in LOS because they belong to root (unless you end up rooting the stick)

In order to control your fire stick your remote will need to have a Power button, otherwise the gen1 remote will not show up while trying to pair, but you can use a USB-OTG hub (KB and mouse). This is due to the older remotes using WiFi Direct, newer ones use Bluetooth. And no, sadly you cannot ADB shell into it first boot as you need some way to accept the pairing request.  HOWEVER, if you have HDMI-CEC enabled on your TV, this should work with your TV's included remote. Test by using the arrow keys or check your TV's user manual. 

HOWEVER: ADB over USB can be used if you first go into TWRP and copy over your devices ADB RSA key.
If you are using any Unix/GNU system;
```
1. Reboot your phone into recovery mode.

2. Connect it to your computer.

3. Open the terminal and type:

 cd ~/.android
 adb push adbkey.pub /data/misc/adb/adb_keys

All done! Just adb shell reboot and feel the power!

*For Windows 10, .android directory is located in your the base of your C:\User\user_name directory.
```
Thanks to [issue #3](https://github.com/kerta1n/tank-convert/issues/3).

ADB shell over the network is enabled by default. The best way to install apps is using the adb install command, and I have included a few shell scripts as well.  

There are two ways of accessing settings, one is on the ATV home screen, the other is the settings app (what looks like a real tablet settings app) in the App Drawer.   
The Power button on your remote is not remappable (it only toggles the device sleep mode), and the Alexa button does not activate the Google Assistant. I have included the Google APK which should enable the Assistant.  

The APKs that worked for me are in APK directory. Prime Video from the Play Store did not work on some of the sticks I installed LOS on, and Disney+ and Netflix are not on the Play Store (Google looks at the device config and decides what apps will work with it). There are 2 Disney+ APK, `dplusoff.apk` was pulled from FireOS, but the regular `dplus.apk` may not play videos, but it's really a hit or miss. If you find that you need to use the official APK, the only caveat is that it will try to connect to the Amazon Appstore and bring up an annoying dialog. Otherwise it should work fine.  

I don't like Youtube ads, and neither does Smarttube (not sponsored). I included the latest version at the time of writing, but obviously you update after installing or download the latest one.  

To remap buttons, open the Play Store and search for "button remap". There should be two results. Install the second result. Some features are pro, and you may notice that you can't change the menu button functions. You can override this by using the "add buttons" option, clicking on the blue +, and pressing the key of which you want to map  

In order to exit adding custom buttons, you may notice the back button does not work. You will need to shell into the device. Once you have a shell open, you can use `input keyevent 4` as back button, `input keyevent 22` as DPAD right, and `input keyevent 23` as enter.  

If you map one of your buttons to the power menu to access bootloader, you will first need to enable the advanced reboot menu. Open the settings app from inside the app drawer, open developer options, and enable "Advanced reboot". Once you open the power menu, click reboot and it will give you a selection.  

[This repository](https://github.com/esc0rtd3w/firestick-loader) contains a LOT more APKs if you're looking for that. However, you will still need to follow this guide to first get your Firestick onto LOS. 

Thank you to the developers for making this possible! [k4y0z](https://github.com/k4y0z), xyz, [diegocr](https://github.com/diegocr), [R0rt1z2](https://github.com/R0rt1z2)
