#!/bin/bash

repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
/opt/crave/resync.sh
rm -rf packages/apps/ViPER4AndroidFX
git clone https://github.com/xiaomi-begonia-dev/android_packages_apps_ViPER4AndroidFX.git --depth 1 -b fourteen packages/apps/ViPER4AndroidFX
rm -rf vendor/bcr
git clone https://github.com/Chaitanyakm/vendor_bcr.git --depth 1 -b main vendor/bcr
. build/envsetup.sh
riseup sunny user
rise b
