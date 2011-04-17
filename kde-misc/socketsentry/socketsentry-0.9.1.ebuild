# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
NEED_KDE="4.3"

inherit cmake-utils qt4 kde4-base flag-o-matic

KDEAPPS_ID="122348"
DESCRIPTION="KDE Plasma widget that displays real-time network traffic."
HOMEPAGE="http://www.kde-apps.org/content/show.php?content=${KDEAPPS_ID}"
SRC_URI="http://socket-sentry.googlecode.com/files/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 ~x86"
IUSE=""
RDEPEND="
net-libs/libpcap
sys-apps/dbus
x11-libs/qt-core
x11-libs/qt-dbus
"



pkg_setup() {
append-ldflags $(no-as-needed)
kde4-base_pkg_setup
}
