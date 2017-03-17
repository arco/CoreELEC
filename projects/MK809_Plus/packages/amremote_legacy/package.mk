# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="amremote_legacy"
PKG_ARCH="arm aarch64"
PKG_LICENSE="other"
PKG_SITE="http://www.amlogic.com"
PKG_DEPENDS_TARGET="toolchain usbutils"
PKG_LONGDESC="amremote - IR remote configuration utility for Amlogic-based devices"

case "$LINUX" in
  amlogic-3.10)
    PKG_VERSION="6431040"
    PKG_SHA256="5859680b0951ed3d2265999b7ad5309060587815df4dd1c48c6fa9aae039d5c5"
    PKG_URL="https://github.com/codesnake/amremote/archive/$PKG_VERSION.tar.gz"
    ;;
  amlogic-3.14)
    PKG_VERSION="05b85d1f9821ae65dca250ba87b369327dd71df3"
    PKG_SHA256="895a64efc05cee3148b4c33f5acbffb87da095d8b8f289f78e0cec26d2ed6f9d"
    PKG_URL="https://github.com/CoreELEC/amremote/archive/$PKG_VERSION.tar.gz"
    ;;
  amlogic-4.9)
    PKG_VERSION="1db130a0ccd47f6b5c3d1dffab1e89613b796a8c"
    PKG_SHA256="5b96f2a1dd03200909eed749f5d97d1d02ee7fc8ac92d8fce6b5d6772ee642dc"
    PKG_URL="https://github.com/CoreELEC/amremote/archive/$PKG_VERSION.tar.gz"
    ;;
esac

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp remotecfg $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/lib/coreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/coreelec
}

post_install() {
  enable_service amlogic-remotecfg.service
  enable_service amlogic-remote-toggle.service
}
