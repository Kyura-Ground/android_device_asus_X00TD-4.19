#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit some common Infinity-X stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit from X00TD device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Infinity-X stuff.
INFINITY_BUILD_TYPE := UNOFFICIAL
INFINITY_MAINTAINER := qǝuʞz
TARGET_BUILD_DEVICE_AS_WEBCAM := true
TARGET_BUILD_GOOGLE_TELEPHONY := false
TARGET_SHIPS_FULL_GAPPS := false
TARGET_SHIPS_GOOGLE_DIALER := false
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_MOTO_CALCULATOR := true
WITH_GAPPS := false

# Inherit some common device props
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := infinity_X00TD
PRODUCT_DEVICE := X00TD
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone Max Pro M1
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=ASUS_X00TD \
    BuildDesc="sdm660_64-user 10 QKQ1 72 release-keys" \
    BuildFingerprint=asus/ASUS_X00TD/ASUS_X00TD:10/QKQ1/17.2017.2012.438-20201203:user/release-keys
