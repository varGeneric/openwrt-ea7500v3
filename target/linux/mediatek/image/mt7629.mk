KERNEL_LOADADDR := 0x40008000

define Device/mediatek_mt7629-rfb
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := MT7629 rfb AP
  DEVICE_DTS := mt7629-rfb
  DEVICE_PACKAGES := swconfig
endef
TARGET_DEVICES += mediatek_mt7629-rfb

define Device/linksys_ea7xxx
  DEVICE_VENDOR := Linksys
  DEVICE_PACKAGES := kmod-usb3 wpad-basic uboot-envtools
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  KERNEL_SIZE := 4096k
  IMAGE_SIZE := 40960k
  UBINIZE_OPTS := -E 5
  IMAGES := sysupgrade.bin factory.bin
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata | check-size
  IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | \
	append-ubi | check-size | linksys-image type=$$$$(DEVICE_HWNAME)
endef

define Device/linksys_ea7500-v3
  $(Device/linksys_ea7xxx)
  DEVICE_MODEL := EA7500
  DEVICE_VARIANT := v3
  DEVICE_HWNAME := EA7500v3
  DEVICE_DTS := mt7629-linksys-ea7500-v3
  DEVICE_DTS_DIR := ../dts
endef
TARGET_DEVICES += linksys_ea7500-v3

