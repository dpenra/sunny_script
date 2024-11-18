#!/bin/bash

repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
/opt/crave/resync.sh
rm -rf packages/apps/ViPER4AndroidFX
git clone https://github.com/xiaomi-begonia-dev/android_packages_apps_ViPER4AndroidFX.git --depth 1 -b fourteen packages/apps/ViPER4AndroidFX
rm -rf vendor/bcr
git clone https://github.com/Chaitanyakm/vendor_bcr.git --depth 1 -b main vendor/bcr
. build/envsetup.sh
export BUILD_USERNAME=dpenra
export BUILD_HOSTNAME=crave
export TARGET_DEFAULT_PIXEL_LAUNCHER=true
export TARGET_ENABLE_PIXEL_FEATURES=true
export TARGET_PREBUILT_LAWNCHAIR_LAUNCHER=true
export TARGET_CORE_GMS=true
# export TARGET_DISABLE_EPPE=true
# export TARGET_USE_MIUI_SCANNER=true
export WITH_GMS=true
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
rise b
