#
# Copyright (C) 2017-2018 The LineageOS Project
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
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/gm/sdm660-common/overlay
PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Properties
-include device/gm/sdm660-common/vendor_prop.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@4.0-impl:32 \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@4.0-impl:32 \
    android.hardware.audio.effect@2.0-service \
    audio.a2dp.default \
    audio.primary.sdm660 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    tinymix

PRODUCT_COPY_FILES += \
    device/gm/sdm660-common/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/gm/sdm660-common/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    device/gm/sdm660-common/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/gm/sdm660-common/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/gm/sdm660-common/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl:64 \
    android.hardware.boot@1.0-service \
    bootctrl.sdm660 \

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    libgptutils \
    libcutils \
    libz

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_COPY_FILES += \
	device/gm/sdm660-common/configs/camera/ov12a10_bear_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov12a10_bear_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx298_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx298_chromatix.xml \
	device/gm/sdm660-common/configs/camera/csidtg_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/csidtg_camera.xml \
	device/gm/sdm660-common/configs/camera/ov13850_q13v06k_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13850_q13v06k_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3l8_f3l8yam_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l8_f3l8yam_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx258_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx376_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx376_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3l8_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l8_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx363_ofilm_ogc1195_back1_i_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx363_ofilm_ogc1195_back1_i_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx318_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx318_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3h7_sunny_a8s05a_front_i_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3h7_sunny_a8s05a_front_i_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3h7_tsp_lcs8f01_front_ii_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3h7_tsp_lcs8f01_front_ii_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx362_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx362_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx230_qc2002_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_qc2002_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx230_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3h7_ofilm_off1012_front_iii_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3h7_ofilm_off1012_front_iii_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov13855_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13855_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov5670_f5670bq_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5670_f5670bq_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov8858_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8858_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k2l7sx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l7sx_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3m3sm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m3sm_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov2281_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov2281_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3m2xm_chromatix_bear.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix_bear.xml \
	device/gm/sdm660-common/configs/camera/ov13880_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13880_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3p3sm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p3sm_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov4688_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov4688_chromatix.xml \
	device/gm/sdm660-common/configs/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml \
	device/gm/sdm660-common/configs/camera/imx362_chromatix_bear.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx362_chromatix_bear.xml \
	device/gm/sdm660-common/configs/camera/imx298_gt24c64_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx298_gt24c64_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx362_gt24c64a_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx362_gt24c64a_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k2l7_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l7_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov12a10_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov12a10_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx258_mono_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_mono_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx258_mono_bear_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_mono_bear_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx363_ofilm_ogc0830_back1_i_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx363_ofilm_ogc0830_back1_i_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov5670_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5670_chromatix.xml \
	device/gm/sdm660-common/configs/camera/csidtg_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/csidtg_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov2680_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov2680_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov7251_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov7251_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3m2xx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xx_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov8856_bear_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8856_bear_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3m2xm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx363_sunny_a12n12c_back1_ii_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx363_sunny_a12n12c_back1_ii_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3l8_mono_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l8_mono_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx230_qc2002_with_gyro_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_qc2002_with_gyro_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx378_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx378_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov8856_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8856_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx258_lc898217xc_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_lc898217xc_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k2l7_8953_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l7_8953_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov8865_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8865_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov13850_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13850_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k4h8_ofilm_ogc0831_back2_i_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h8_ofilm_ogc0831_back2_i_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k4h8_sunny_d8s09b_back2_ii_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h8_sunny_d8s09b_back2_ii_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx258_bear_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_bear_chromatix.xml \
	device/gm/sdm660-common/configs/camera/s5k3p8sp_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p8sp_chromatix.xml \
	device/gm/sdm660-common/configs/camera/imx214_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx214_chromatix.xml \
	device/gm/sdm660-common/configs/camera/ov5695_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5695_chromatix.xml \



PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0_32 \
    android.hardware.camera.provider@2.4-impl:32 \
    android.hardware.camera.provider@2.4-service \
    libxml2 \
    Snap

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl:32 \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.1-service.clearkey \
    move_widevine_data.sh

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl:64 \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl:64 \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    copybit.sdm660 \
    gralloc.sdm660 \
    hwcomposer.sdm660 \
    libdisplayconfig \
    liboverlay \
    libqdMetaData.system \
    libtinyxml \
    libvulkan \
    memtrack.sdm660

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0-java

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.usb.rc \
    init.class_main.sh \
    init.qcom.power.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.rc \
    ueventd.qcom.rc

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IRSC
PRODUCT_COPY_FILES += \
    device/gm/sdm660-common/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# LED packages
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.sdm660-common

# Media
PRODUCT_COPY_FILES += \
    device/gm/sdm660-common/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/gm/sdm660-common/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/gm/sdm660-common/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# OEM Unlock
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/qti_fingerprint_interface.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# QCOM
#PRODUCT_COPY_FILES += \
#    device/gm/sdm660-common/configs/privapp-permissions-sdm660.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-sdm660.xml \
#    device/gm/sdm660-common/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
#    device/gm/sdm660-common/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# QMI
PRODUCT_PACKAGES += \
    libjson

# Radio
PRODUCT_PACKAGES += \
    librmnetctl

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# Recovery
PRODUCT_COPY_FILES += \
    device/gm/sdm660-common/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/gm/sdm660-common/recovery/root/init.recovery.usb.rc:root/init.recovery.usb.rc

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Seccomp
PRODUCT_COPY_FILES += \
    device/gm/sdm660-common/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/configstore@1.1.policy \
    device/gm/sdm660-common/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/gm/sdm660-common/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Touchscreen
PRODUCT_PACKAGES += \
    libtinyxml2

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Verity
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.1-service.sdm660-common

# VNDK
# Update this list with what each blob is actually for
# libicuuc: vendor.qti.hardware.qteeconnector@1.0-impl
# libstdc++: hexagon DSP blobs
PRODUCT_PACKAGES += \
    libicuuc.vendor \
    libstdc++.vendor \
    vndk_package

# Wi-Fi
PRODUCT_COPY_FILES += \
    device/gm/sdm660-common/wifi/fstman.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/fstman.ini \
    device/gm/sdm660-common/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    device/gm/sdm660-common/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    device/gm/sdm660-common/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    hostapd_cli \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwifi-hal-qcom \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf
