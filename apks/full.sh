adb devices
cd /home/user/Downloads/amonet/
#sudo ./bootrom-step.sh
#read
sudo ./fastboot-step.sh
read
cd /linrom/
adb push los12-tank.zip /sdcard/
adb push magisk-25.zip /sdcard/
adb shell twrp wipe data
read
adb shell twrp wipe cache
read
adb shell twrp wipe dalvik
read
adb shell twrp wipe /system
read
adb shell twrp install /sdcard/los12-tank.zip/
adb shell twrp install /sdcard/magisk-25.zip/
adb shell twrp reboot system
