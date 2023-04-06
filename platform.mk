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
TARGET_BOARD_PLATFORM := $(HOLI)
TARGET_KERNEL_VERSION := 5.4
PRODUCT_PLATFORM_MOT := true
PRODUCT_USES_QCOM_HARDWARE := true

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
## Enable Fluence NN Algo
PRODUCT_PROPERTY_OVERRIDES += \
     ro.vendor.audio.sdk.fluence.nn.enabled=true

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# Power
PRODUCT_USES_PIXEL_POWER_HAL := true

# QCOM Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=27,27

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product, vendor/motorola/sm4350-common/sm4350-common-vendor.mk)
