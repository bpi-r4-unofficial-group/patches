# How to use?

Requirement:

`sed`, `curl`

Clone the official repository
```shell
git clone https://github.com/BPI-SINOVOIP/BPI-R4-OPENWRT-V21.02.git
cd BPI-R4-OPENWRT-V21.02
```
Apply patches
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/bpi-r4-unofficial-group/patches/refs/heads/main/patch.sh)"
```

Then you may found you are able to build it now =)

# Details:
* Patched `/feeds.conf`:

  The feed pointed to a mistaken url has been changed to the [mirror repository](https://github.com/bpi-r4-unofficial-group/mtk-openwrt-feeds). The [mirror repository](https://github.com/bpi-r4-unofficial-group/mtk-openwrt-feeds) is synchronized daily through [CI/CD repository](https://github.com/bpi-r4-unofficial-group/CI-CD). Building & using the mirror library is because the bandwidth for synchronizing the [official repository](https://git01.mediatek.com/openwrt/feeds/mtkopenwrt-feeds) of MTK is low, which can save time when using the mirror. You may create a fork if you wanna use the [official repository](https://git01.mediatek.com/openwrt/feeds/mtkopenwrt-feeds).

* Patched `/package/Makefile`:

  Commented `$(curdir)/compile: $(curdir)/cryptsetup/host/compile"` in makefile because target `/$(curdir)/compile` and `$(curdir)/cryptsetup/host/compile` does not exist at all.

* Patched `/package/utils/dtc`:

  ...
