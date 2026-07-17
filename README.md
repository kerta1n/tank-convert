# tank-convert

Convert your 2nd gen Amazon Fire Stick to LineageOS (clean, FOSS Android TV with no OS-level ads!)

## Overview

This repository contains everything you need to convert a 2nd gen Amazon Fire Stick to Lineage 12/Android 5.1. 

> [!IMPORTANT]
> **Currently, Android 5.1 is the only newest available Lineage version for this hardware.** 
> However, there is actually a device tree for Android 7 available [here](https://github.com/cmtank/device_amazon_tank/tree/cm-14.1) (whether it is finished or not is unconfirmed). If you know how to build LOS with different trees and actually do build a ZIP, please open an issue.

## What You'll Need

### Hardware
- Butter knife
- Small conductive piece of wire (a twist tie works fine)
- USB-OTG hub with keyboard and mouse (for initial setup)
- A remote with a Power button (or HDMI-CEC enabled TV)

### Downloads (ZIP files)
See the [Releases section](https://github.com/kerta1n/tank-convert/releases).

This current release contains the Lineage build from 9/27/2020. If you'd like to install a 2022 build instead, please see my comment [here](https://github.com/kerta1n/tank-convert/issues/6#issuecomment-3986131471).

## Installation Instructions

### Step 0: Obtaining files

1. Make sure `git` is installed and available on PATH.
2. Run `git clone https://github.com/kerta1n/tank-convert.git` in a Temp (`/tmp`) or your `Documents` directory.
3. Download both the Lineage build .zip file (has `UNOFFICIAL` in the filename) into the newly created `tank-convert` folder, and optionally the OpenGAPPS build if you want to use Google services (such as Play Store, Assistant, etc.)

### Step 1: Installing TWRP

Follow the guide here: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/

**Hardware Setup:**
- The shortpoint is detailed in the attachments of the [TWRP installation guide](https://xdaforums.com/attachments/fire-tv-stick-2-tank-jpg.4730951/). You need to short points `CLK` and `GND` (ground).
- For ground, hook the twist tie or wire into the metal heatsink that is soldered to the PCB (this is referencing the frame that you just pulled that weirdly-shaped dual metal rectangle off of, which covers the CPU and storage chip)

### Step 2: Installing Lineage OS

Follow the guide here: https://forum.xda-developers.com/t/rom-unlocked-tank-lineageos-12-1.3961110/

## Troubleshooting

### "Downgrade failure" error
Comment out the if loop, lines 114-116 under [`amonet/modules/main.py`](amonet-tank-v1.2.2/amonet/modules/main.py#L114-L117) and try again.

### Cannot reboot into Fastboot
Follow these instructions using the preincluded gpt folder: https://forum.xda-developers.com/t/unlock-root-twrp-unbrick-fire-tv-stick-2nd-gen-tank.3907002/post-79056952

If you have run the `gpt` fix multiple times and are SURE your short was placed correctly, try re-trying the exploit without the `gpt` fix (which just means delete & re-clone this repository and try again).

### "Optimizing apps" takes too long
Run the [`amonet/boot-recovery.sh`](amonet-tank-v1.2.2/amonet/boot-recovery.sh) script as sudo, and **AFTER** you run it plug the device into your Linux machine. This also applies if you want to flash more apps besides GAPPS (Magisk) or need to get back into TWRP.

## Post-Installation Setup

### Remote Control Options

**⚠️ Important:** In order to control your Fire Stick, your remote will need to have a Power button, otherwise the Gen 1 remote will not show up while trying to pair. This is due to older remotes using WiFi Direct (which Lineage does not look for upon setup), while newer ones use Bluetooth.

**Alternative control methods:**
- MicroUSB USB-OTG hub with connected keyboard (and optionally a mouse if you want to avoid overusing the `Tab` key)
- HDMI-CEC enabled TV (test by using the arrow keys on your TV's remote or check your TV's user manual)

### ADB Access

**ADB over Network:** Enabled by default, but you still need be able to first accept the pairing request. Once done, the best way to install apps is using the `adb install` command. Shell scripts [`install.sh`](apks/install.sh) and [`remove.sh`](apks/remove.sh) are included in this repository under the `apk/` directory.

**ADB over USB:** Can be used if you first go into TWRP and copy over your device's ADB RSA key:

*For Unix/GNU systems:*
```bash
# 1. Reboot your phone into recovery mode
# 2. Connect it to your computer
# 3. Open the terminal and type:

cd ~/.android
adb push adbkey.pub /data/misc/adb/adb_keys

adb shell reboot
```

*For Windows 10/11, the .android directory is located in `%USERPROFILE%` (paste this into File Explorer).*

Thanks to [issue #3](https://github.com/kerta1n/tank-convert/issues/3).

### Accessing Settings

There are two ways of accessing settings:
1. Settings on the Android TV home screen
2. The settings app (tablet-style settings) in the App Drawer

## Included APKs

The APKs that worked for me are in the [`apks`](apks/) directory.

### Known App Issues

- **Prime Video:** The Play Store version did not work on some sticks
- **Disney+ and Netflix:** Not available on the Play Store (Google restricts apps based on device config)
- **Disney+:** Two versions included:
- [`dplusoff.apk`](apks/dplusoff.apk) - Pulled from FireOS
- [`dplus.apk`](apks/dplus.apk) - May not play videos (hit or miss). If you need the official APK, do note it will try to connect to the Amazon Appstore and show an annoying dialog, but should otherwise work fine
- **Smarttube (YouTube without ads)** - I included the latest version when I created this repository, but of course you should update after installing or download the latest .apk manually from the [official repository](https://github.com/yuliskov/SmartTube).

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
