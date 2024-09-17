#!/bin/sh

DTC_PATCH="https://raw.githubusercontent.com/bpi-r4-unofficial-group/patches/refs/heads/main/9999-fix-fdtdump-c-array-overflow.patch"

replace_file() {
    path=$1
    shift
    while [ $# -gt 0 ]; do
        search=$1
        replace=$2
        sed -i "s|$search|$replace|g" "$path"
        shift 2
    done
}

echo "patching feeds.conf"
replace_file "feeds.conf" \
    "https://git01.mediatek.com/openwrt/feeds/mtkopenwrt-feeds" \
    "https://github.com/bpi-r4-unofficial-group/mtk-openwrt-feeds.git"

echo "patching package/Makefile"
replace_file "package/Makefile" \
    "\$(curdir)/compile: \$(curdir)/cryptsetup/host/compile" \
    "# \$(curdir)/compile: \$(curdir)/cryptsetup/host/compile"

echo "patching package/utils/dtc (fdtdump.c)"
mkdir -p package/utils/dtc/patches
curl -fsSL "$DTC_PATCH" -o "package/utils/dtc/patches/$(basename "$DTC_PATCH")"

echo "patching completed"
