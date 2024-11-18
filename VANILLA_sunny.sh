#!/bin/bash

# Initialize the ROM manifest for RisingTech on branch 'fifteen' with Git LFS enabled
# repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs

# Sync the repository with various options for efficient and clean syncing:
# -c: Current branch only
# --no-clone-bundle: Skip clone bundle usage
# --optimized-fetch: Perform optimized fetch for faster syncing
# --prune: Remove obsolete branches
# --force-sync: Ensure a full sync of all repositories
# -j$(nproc --all): Use all available CPU cores
# repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)
# /opt/crave/resync.sh

rm -rf packages/apps/ViPER4AndroidFX
git clone https://github.com/xiaomi-begonia-dev/android_packages_apps_ViPER4AndroidFX.git --depth 1 -b fourteen packages/apps/ViPER4AndroidFX
rm -rf vendor/bcr
git clone https://github.com/Chaitanyakm/vendor_bcr.git --depth 1 -b main vendor/bcr
. build/envsetup.sh
export OUT_DIR=out2
export BUILD_USERNAME=dpenra
export BUILD_HOSTNAME=crave
export RISING_PACKAGE_TYPE="VANILLA_AOSP"
export WITH_GMS=false
export TARGET_CORE_GMS=false
# export TARGET_DISABLE_EPPE=true
# export TARGET_USE_MIUI_SCANNER=true
riseup sunny user
rise b
