#!/bin/bash

set -e

fastboot flash recovery bin/twrp.img
fastboot flash TEE2 bin/tz.img
fastboot oem reboot-recovery

echo ""
echo ""
echo "Your device should now reboot into TWRP"
echo ""
