# tank-convert
Repo with everything you need (- the Lineage) to convert a 2nd gen Amazon Fire Stick to Lineage 12 (Android 5.1)  

Currently, Android 5.1 is the only newest version available for this HW, but I did some digging and found a device tree for Android 7: https://github.com/cmtank/device_amazon_tank/tree/cm-14.1. If you happen to know how to build LOS with different trees and actually do, please open an issue and I will link it.  

Tools you need are a butter knife and a small conductive piece of wire (I used a twist tie and it worked fine)  

The only thing you need to download from outside this repo is the Lineage OS zip file. Use this: https://androidfilehost.com/?fid=8889791610682947296  

Installing TWRP: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/  

Installing LOS: https://forum.xda-developers.com/t/rom-unlocked-tank-lineageos-12-1.3961110/  

If you run into "downgrade failure", comment out the if loop, lines 114-116 under amonet/modules/main.py and try again.  

If you run into not being able to reboot into Fastboot, follow these instructions (use the preincluded gpt folder): https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/post-79056952  

If you have run the gpt fix multiple times and are sure your short was placed correctly, try re-trying the exploit without amonet (re-clone repo and try again basically)  

The OpenGAPPS build for this specific HW is for some reason not available, so I have included it with the repo (no need to download this, but source: https://androidfilehost.com/?fid=8889791610682906163)  

I do not advise transferring APKs into storage while in TWRP, as you cannot delete them once in LOS because they belong to root  

The APKs that worked for me are in APK directory (Prime Video from the Play Store did not work on some of the sticks I installed LOS on)  

Your remote will need to have a Power button, otherwise the gen1 remote will not show up while trying to pair, but you can use a USB-OTG hub (KB and mouse) And no, sadly you cannot ADB shell into it first boot as you need some way to accept the pairing request.  

ADB shell over the network is enabled by default. The best way to install apps is using the adb install command, and I have included a few shell scripts as well.  

There are two ways of accessing settings, one is on the ATV home screen, the other is the settings app (what looks like a real tablet settings app) in the App Drawer.   
The Power button on your remote is not remappable (it only toggles the device sleep mode), and the Alexa button does not activate the Google Assistant. I have included the Google APK which should enable the Assistant.  

To remap buttons, open the Play Store and search for "button remap". There should be two results. Install the second result. Some features are pro, and you may notice that you can't change the menu button functions. You can override this by using the "add buttons" option, clicking on the blue +, and pressing the key of which you want to map  

In order to exit adding custom buttons, you may notice the back button does not work. You will need to shell into the device. Once you have a shell open, you can use `input keyevent 4` as back button, `input keyevent 22` as DPAD right, and `input keyevent 23` as enter.  

If you map one of your buttons to the power menu to access bootloader, you will first need to enable this advanced reboot. Open the settings app from inside the app drawer, open developer options, and enable "Advanced reboot"  
