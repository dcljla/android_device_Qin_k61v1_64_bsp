#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES += \
    libmtk_bsg \
    libmtk_bsg.recovery

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# fastbootd
PRODUCT_PACKAGES += \
   android.hardware.fastboot@1.0-impl--mock \
   fastbootd

# F2FS utilities
PRODUCT_PACKAGES += \
   sg_write_buffer \
   f2fs_io \
   check_f2fs

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
   $(LOCAL_PATH)

# Install developer gsi keys into the ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Update engine
PRODUCT_PACKAGES += \
   otapreopt_script \
   update_engine \
   update_engine_sideload \
   update_verifier

PRODUCT_PACKAGES_DEBUG += \
   update_engine_client

PRODUCT_HOST_PACKAGES += \
   brillo_update_payload

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-mediatek \
    android.hardware.power@1.2.vendor:64

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/power_app_cfg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/power_app_cfg.xml \
    $(LOCAL_PATH)/configs/perf/powercontable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powercontable.xml \
    $(LOCAL_PATH)/configs/perf/powerscntbl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerscntbl.xml