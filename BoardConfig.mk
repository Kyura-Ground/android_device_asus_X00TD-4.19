#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
include device/asus/sdm660-common/BoardConfigCommon.mk

DEVICE_PATH := device/asus/X00TD

# Assert
TARGET_OTA_ASSERT_DEVICE := ASUS_X00TD,X00TD,X00T

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm636

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/asus/X00TD_defconfig
#TARGET_KERNEL_CONFIG := vendor/debugfs.config

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit the proprietary files
include vendor/asus/X00TD/BoardConfigVendor.mk
