# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit bzr eutils

EBZR_REPO_URI="https://code.launchpad.net/~amandeepgrewal/notifyconf/trunk"

DESCRIPTION="GUI to configure notify-osd"
HOMEPAGE="https://code.launchpad.net/notifyconf"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-misc/notify-osd"
RDEPEND="${DEPEND}"

MY_PN="NotifyOSDConfiguration"

src_unpack() {
	bzr_fetch || die "${EBZR}: unknown problem in bzr_fetch()."
	cd ${S}
	epatch ${FILESDIR}/fix-qmake-path.patch
}

src_install() {
	dobin ${MY_PN}
	make_desktop_entry ${MY_PN} ${MY_PN} gnome-panel-notification-area "Settings;DesktopSettings;Qt"
}


