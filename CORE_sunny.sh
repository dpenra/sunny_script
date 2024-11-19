#!/bin/bash

# initiate
repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs

#sync
/opt/crave/resync.sh

# Remove existing directories for a fresh setup (cleans up old device, vendor, and other paths)
rm -rf device/xiaomi/sunny
rm -rf device/qcom/common
rm -rf device/qcom/qssi
rm -rf device/xiaomi/sunny-kernel
# rm -rf vendor/xiaomi/sunny
rm -rf vendor/qcom/common
rm -rf vendor/qcom/opensource/core-utils
rm -rf packages/apps/DisplayFeatures
rm -rf packages/apps/KProfiles
rm -rf hardware/xiaomi
rm -rf hardware/qcom-caf/sm8150/media
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi
rm -rf vendor/lineage
rm -rf packages/apps/Updater
rm -rf vendor/lineage-priv/keys

# Clone the necessary device repositories
git clone https://github.com/dpenra/device_xiaomi_sunny.git --depth 1 -b lineage-22 device/xiaomi/sunny
git clone https://github.com/yaap/device_qcom_common.git --depth 1 -b fifteen device/qcom/common
git clone https://github.com/AOSPA/android_device_qcom_qssi.git --depth 1 -b vauxite device/qcom/qssi
git clone https://github.com/dpenra-sunny/device_xiaomi_sunny-kernel.git --depth 1 -b fourteen device/xiaomi/sunny-kernel

# Clone vendor repositories for Xiaomi and Qualcomm dependencies
git clone https://github.com/yaap/vendor_xiaomi_sunny.git --depth 1 -b fifteen vendor/xiaomi/sunny
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth 1 -b fifteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git --depth 1 -b fifteen vendor/qcom/opensource/core-utils

# Clone package repositories for additional features
git clone https://github.com/cyberknight777/android_packages_apps_DisplayFeatures packages/apps/DisplayFeatures
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles.git --depth 1 -b main packages/apps/KProfiles

# Clone hardware repositories for Xiaomi and Qualcomm's SM8150 platform
git clone https://github.com/yaap/hardware_xiaomi.git --depth 1 -b fifteen hardware/xiaomi
git clone https://github.com/yaap/hardware_qcom-caf_sm8150_media.git --depth 1 -b fifteen hardware/qcom-caf/sm8150/media

# Clone prebuilt GCC toolchains for cross-compiling
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi

#source mods
git clone https://github.com/dpenra/android_vendor_lineage.git --depth 1 -b fifteen vendor/lineage
git clone https://github.com/dpenra/android_packages_apps_Updater.git --depth 1 -b fifteen packages/apps/Updater

. build/envsetup.sh
# Build output directory
export BUILD_USERNAME=dpenra
export BUILD_HOSTNAME=crave
export TARGET_DEFAULT_PIXEL_LAUNCHER=true
export TARGET_ENABLE_PIXEL_FEATURES=true
export TARGET_PREBUILT_LAWNCHAIR_LAUNCHER=true
export TARGET_CORE_GMS=true
# export TARGET_DISABLE_EPPE=true
# Enable Google Mobile Services (GMS)
export WITH_GMS=true
# Add Google-specific packages to the build
export PRODUCT_PACKAGES+=(
    MarkupGoogle
    LatinIMEGooglePrebuilt
    AiWallpapers
    WallpaperEmojiPrebuilt
    PrebuiltDeskClockGoogle
    CalculatorGooglePrebuilt
    CalendarGooglePrebuilt
)
riseup sunny user
# Start the build process
rise b
