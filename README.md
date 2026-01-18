# tank-convert

Convert your 2nd gen Amazon Fire Stick to Lineage 12/Android 5.1 (clean Android TV!)

## Overview

This repository contains everything you need (minus the Lineage OS zip) to convert a 2nd gen Amazon Fire Stick to Lineage 12/Android 5.1. Currently, Android 5.1 is the only newest version available for this hardware, but there's a device tree for Android 7 available [here](https://github.com/cmtank/device_amazon_tank/tree/cm-14.1). If you know how to build LOS with different trees and actually do, please open an issue and I will link it.

## What You'll Need

### Hardware
- Butter knife
- Small conductive piece of wire (a twist tie works fine)
- USB-OTG hub with keyboard and mouse (for initial setup)
- A remote with a Power button (or HDMI-CEC enabled TV)

### Downloads
- **Lineage OS zip**: https://androidfilehost.com/?fid=8889791610682947296
- **OpenGAPPS** (specific build for this hardware): https://androidfilehost.com/?fid=8889791610682906163

## Installation Instructions

### Step 1: Installing TWRP

Follow the guide here: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/

**Hardware Setup:**
- The shortpoint is detailed in the TWRP installation guide
- For ground, hook the twist tie into the heatsink that is soldered to the PCB

### Step 2: Installing Lineage OS

Follow the guide here: https://forum.xda-developers.com/t/rom-unlocked-tank-lineageos-12-1.3961110/

## Troubleshooting

### "Downgrade failure" error
Comment out the if loop, lines 114-116 under `amonet/modules/main.py` and try again.

### Cannot reboot into Fastboot
Follow these instructions using the preincluded gpt folder: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/post-79056952

If you have run the gpt fix multiple times and are sure your short was placed correctly, try re-trying the exploit without the gpt fix (re-clone this repo and try again basically).

### "Optimizing apps" takes too long
Run the `amonet/boot-recovery.sh` script as sudo, and **AFTER** you run it plug the device into your Linux machine. This also applies if you want to flash more apps besides GAPPS (Magisk) or need to get back into TWRP.

## Post-Installation Setup

### Remote Control Options

**⚠️ Important:** In order to control your Fire Stick, your remote will need to have a Power button, otherwise the gen1 remote will not show up while trying to pair. This is due to older remotes using WiFi Direct, while newer ones use Bluetooth.

**Alternative control methods:**
- USB-OTG hub with keyboard and mouse
- HDMI-CEC enabled TV (test by using the arrow keys or check your TV's user manual)

### ADB Access

**ADB over Network:** Enabled by default, but you still need be able to first accept the pairing request. Once done, the best way to install apps is using the `adb install` command. Shell scripts are included in this repo under the `apk/` directory (`install.sh` and `remove.sh`).

**ADB over USB:** Can be used if you first go into TWRP and copy over your device's ADB RSA key.

For Unix/GNU systems:
```bash
# 1. Reboot your phone into recovery mode
# 2. Connect it to your computer
# 3. Open the terminal and type:

cd ~/.android
adb push adbkey.pub /data/misc/adb/adb_keys

# All done! Just adb shell reboot and feel the power!
```

*For Windows 10, the .android directory is located in the base of your `C:\User\user_name` directory.*

Thanks to issue #3.

### Accessing Settings

There are two ways of accessing settings:
1. Settings on the Android TV home screen
2. The settings app (tablet-style settings) in the App Drawer

## Included APKs

The APKs that worked for me are in the APK directory.

### Known App Issues

- **Prime Video:** The Play Store version did not work on some sticks
- **Disney+ and Netflix:** Not available on the Play Store (Google restricts apps based on device config)
- **Disney+:** Two versions included:
  - `dplusoff.apk` - Pulled from FireOS
  - `dplus.apk` - May not play videos (hit or miss). If you need the official APK, do note it will try to connect to the Amazon Appstore and show an annoying dialog, but should otherwise work fine
- **Smarttube (YouTube without ads)** - I included the latest version when I made the repo, but ofcourse you can update after installing or download the latest .apk manually.

### More APKs

[This repository](https://github.com/esc0rtd3w/firestick-loader) contains a LOT more APKs if you're looking for that. However, you will still need to follow this guide to first get your Firestick onto LOS.

## Button Remapping

1. Open the Play Store and search for "button remap"
2. Install the second result
3. Some features are pro. To change menu button functions, use the "add buttons" option, click the blue +, and press the key you want to map

**Note:** The Power button on your remote is not remappable (it only toggles device sleep mode), and the Alexa button does not activate the Google Assistant. A Google APK is included which should enable the Assistant.

### Exiting Custom Button Setup

Unfortunately, the back button may not work in this mode. If so, you will need to shell into the device and use:
- `input keyevent 4` - Back button
- `input keyevent 22` - DPAD right
- `input keyevent 23` - Enter

### Advanced Reboot Menu

To access bootloader from a remapped button:
1. Open the settings app from inside the app drawer
2. Open Developer Options
3. Enable "Advanced reboot"
4. When you open the power menu, click reboot and it will give you a selection

## ⚠️ Important Notes

- **Do not** transfer APKs into storage while in TWRP, as you cannot delete them once in LOS because they belong to root (UNLESS you settle on rooting the stick)
- Remember, ADB shell over USB cannot be used on first boot (if you do NOT transfer the key) as you need some way to accept the pairing request (use HDMI-CEC or USB-OTG if possible).

## Credits

Thank you to the developers for making this possible!
- [k4y0z](https://github.com/k4y0z)
- [xyz](https://github.com/xyzz)
- [diegocr](https://github.com/diegocr)
- [R0rt1z2](https://github.com/R0rt1z2)
