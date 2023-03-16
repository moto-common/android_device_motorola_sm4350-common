# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Platform Path
PLATFORM_COMMON_PATH := device/motorola/sm4350-common

# Platform
HOLI := holi
TARGET_KERNEL_VERSION := 5.4
PRODUCT_PLATFORM_MOT := true
TARGET_BOARD_PLATFORM := $(HOLI)

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 30

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vendor \
    vendor_boot \
    vbmeta \
    vbmeta_system

# Audio
# Enable Fluence NN Algo
PRODUCT_PROPERTY_OVERRIDES += \
     ro.vendor.audio.sdk.fluence.nn.enabled=true

PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# FPSensor Gestures
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/keylayout/uinput-fpsensor.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpsensor.kl \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/idc/uinput-fpsensor.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpsensor.idc

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# Graphics
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/display/DPU660.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display/DPU660.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/display/DPU670.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display/DPU670.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/display/DPU720.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display/DPU720.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/display/DPU7__.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display/DPU7__.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/display/advanced_sf_offsets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/display/advanced_sf_offsets.xml

# Init
PRODUCT_PACKAGES += \
    init.sm4350

# Media
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/video_system_specs.json:$(TARGET_COPY_OUT_VENDOR)/etc/video_system_specs.json

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Power
PRODUCT_USES_PIXEL_POWER_HAL := true

## Powerhint
ifneq ($(TARGET_IS_BLAIR),true)
  PRODUCT_COPY_FILES += \
      $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json
else
  PRODUCT_COPY_FILES += \
      $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/powerhint_blair.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json
endif

# QCOM Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Qualcomm WiFi Configuration
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=27,27

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product, vendor/motorola/sm4350-common/sm4350-common-vendor.mk)
