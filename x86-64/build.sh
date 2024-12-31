#!/bin/bash

echo "编译固件大小为: $PROFILE MB"

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始编译..."



# 定义所需安装的包列表
PACKAGES="luci-app-commands luci-app-ddns luci-app-ddns-go luci-i18n-ddns-go-zh-cn luci-app-fileassistant luci-app-filebrowser luci-app-netdata luci-app-openclash luci-app-socat luci-app-softethervpn luci-i18n-softethervpn-zh-cn luci-app-ocserv luci-app-upnp luci-app-wechatpush luci-app-zerotier frr frr-ospf6d frr-ospfd frr-ripd frr-ripngd frr-vtysh frr-watchfrr frr-zebra frr-libfrr luci-app-lxc luci-i18n-opkg-zh-cn luci-i18n-lxc-zh-cn  ddns-scripts-cloudflare luci-i18n-ddns-zh-cn luci-i18n-wechatpush-zh-cn luci-i18n-filebrowser-zh-cn luci-i18n-netdata-zh-cn luci-i18n-upnp-zh-cn luci-i18n-commands-zh-cn luci-i18n-zerotier-zh-cn  ddns-scripts-godaddy nano htop bash openvswitch kmod-openvswitch-vxlan luci-proto-vxlan luci-proto-wireguard luci-i18n-socat-zh-cn luci-i18n-appfilter-zh-cn luci-i18n-nlbwmon-zh-cn luci-i18n-diag-core-zh-cn luci-i18n-timecontrol-zh-cn xray-core  luci-i18n-v2raya-zh-cn luci-i18n-vlmcsd-zh-cn"
PACKAGES="$PACKAGES curl"
PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-filebrowser-zh-cn"
PACKAGES="$PACKAGES luci-app-argon-config"
PACKAGES="$PACKAGES luci-i18n-argon-config-zh-cn"
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ttyd-zh-cn"
PACKAGES="$PACKAGES luci-i18n-passwall-zh-cn"
PACKAGES="$PACKAGES luci-app-openclash"
PACKAGES="$PACKAGES luci-i18n-homeproxy-zh-cn"
PACKAGES="$PACKAGES openssh-sftp-server"
PACKAGES="$PACKAGES luci-i18n-dockerman-zh-cn"

# 构建镜像
echo "$(date '+%Y-%m-%d %H:%M:%S') - Building image with the following packages:"
echo "$PACKAGES"

make image PROFILE="generic" PACKAGES="$PACKAGES" FILES="/home/build/immortalwrt/files" ROOTFS_PARTSIZE=$PROFILE

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
