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

The `AOSPA` branch targets Paranoid Android Calcite on the non-NFC X00TD
with the existing 4.19 kernel and A-only dynamic partition layout.
It is based on the `Infinity` device/common trees. Use the matching
`AOSPA` local manifest, device, common and kernel branches, together with
the `Infinity` proprietary vendor branch.

Initialize a separate server checkout with the official manifest:

```sh
repo init -u https://github.com/AOSPA/manifest -b calcite
```

Place the matching `local_manifest.xml` in `.repo/local_manifests/` after
the device, common, kernel and local manifest branches are published.
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

This is an initial bringup. Host configuration/header checks do not
replace a full server build, image size checks or hardware boot tests.
