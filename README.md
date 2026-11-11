# Device Tree for Asus Zenfone Max Pro M1
The Asus Zenfone Max Pro M1 (codenamed _"X00TD"_) is a mid-range smartphone from Asus.
It was announced in April 2018 and released in May 2018.

## Device specifications

| Device                  | Asus Zenfone Max Pro M1                                     |
| ----------------------- | :---------------------------------------------------------- |
| SoC                     | Qualcomm SDM660 Snapdragon 636                              |
| CPU                     | 8x Qualcomm® Kryo™ 260 CPU                                  |
| GPU                     | Adreno 509                                                  |
| Memory                  | 3GB / 4GB RAM / 6GB (LPDDR4X)                               |
| Shipped Android version | 8.1.0                                                       |
| Storage                 | 64GB eMMC 5.1 flash storage                                 |
| MicroSD                 | Up to 2 TB                                                  |
| Battery                 | Non-removable Li-Po 5000 mAh                                |
| Dimensions              | 159 x 76 x 8.5 mm                                           |
| Display                 | 2160 x 1080 (18:9), 5.99 inch                               |
| Rear camera 1           | 13MP, 1.12-micron pixels, f/2.2 Dual LED flash              |
| Rear camera 2           | 5MP, 1.12-micron pixels, f/2.4                              |
| Front camera            | 8MP, 1-micron pixels, f/2.2 1080p 30 fps video, Selfie-light|

## Device picture

![Asus Zenfone Max Pro M1](https://github.com/Navin136/Navin136/blob/main/X00TD.jpg)

## AOSPA Android 17

The experimental `AOSPA-CLO` branch targets Paranoid Android Calcite on
the non-NFC X00TD with kernel 4.19 and A-only dynamic partitions. Use the
matching `AOSPA-CLO` local manifest, device, common, kernel, vendor and
audio branches. The original `AOSPA` branches remain separate.

Qualcomm dependencies follow native AOSPA/CLO paths. Display, media and
audio use AOSPA's legacy 89xx/4.19 base. The SDM660 vendor policy uses the
older official AOSPA policy branch and still needs Android 17 compilation
and runtime validation. This is a compatibility port, not an unmodified
Qualcomm BSP.

Initialize a separate server checkout with the official manifest:

```sh
repo init -u https://github.com/AOSPA/manifest -b calcite
git clone -b AOSPA-CLO https://github.com/Kyura-Ground/local_manifests .repo/local_manifests
```

Then run:

```sh
repo sync -c --no-tags -j4
./rom-build.sh X00TD
```

AOSPA supplies GApps. The tree keeps the stock system/vendor backing
devices and does not reserve Infinity's additional 1 GB for sideloaded
GApps. ZRAM sizing still follows the existing RAM detection scripts;
Dalvik uses stock ASUS heap properties. This port does not use libinit
hooks or framework patch files.

Lineage SDK overlays, LiveDisplay and the Lineage screen-off gesture
service are not installed. The device Power HAL retains its standard
Android double-tap-to-wake implementation.

The ASUS Bluetooth blobs need the legacy btconfigstore HIDL ABI; its
definitions are kept in the common tree. The existing basic USB service
and dummy perf client also live there. These compatibility sources retain their upstream
LineageOS attribution. Charging control uses AOSPA's own service, which
keeps the `vendor.lineage.health` interface name.

This is an initial bringup. Host configuration/header checks do not
replace a full server build, image size checks or hardware boot tests.
