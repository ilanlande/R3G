#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#添加openclash
#sed -i '$a src-git openclash https://github.com/vernesong/OpenClash.git' feeds.conf.default
#添加password
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
#新的argon主题
rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
#使用开源驱动
#rm -rf ./package/lean/mt
#删除有问题的netdata
#rm -rf ./package/lean/luci-app-netdata
# Add a feed source
sed -i 's/PATCHVER:=5.10/PATCHVER:=5.4/g' target/linux/x86/Makefile
sed -i '$a src-git lienol https://github.com/kenzok8/openwrt-packages.git' feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld'>>feeds.conf.default
./scripts/feeds update -a && ./scripts/feeds install -a
