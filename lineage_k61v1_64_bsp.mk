#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from camellia device
$(call inherit-product, device/Qin/k61v1_64_bsp/device.mk)

# Inherit some common Lineage OS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_CHARACTERISTICS := nosdcard

TARGET_BOOT_ANIMATION_RES := 
TARGET_GAPPS_ARCH := arm64
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_USES_AOSP_RECOVERY := true

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_k61v1_64_bsp
PRODUCT_DEVICE := k61v1_64_bsp
PRODUCT_MANUFACTURER := DuoQin
PRODUCT_BRAND := Qin
PRODUCT_MODEL := F21 PRO

# Build info
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
