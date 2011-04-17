# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
NEED_KDE="4.4"
KDE_LINGUAS="en_GB et ga pt pt_BR sv uk"

inherit kde4-base

DESCRIPTION="KDE ATI Monitor. A GUI for aticonfig and a monitoring applet."
HOMEPAGE="http://freshmeat.net/projects/katimon"
SRC_URI="http://www.v13.gr/files/${PN}/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="
	dev-python/pyqwt
	kde-base/pykde4
	dev-python/PyQt4
	x11-drivers/ati-drivers
	"

src_unpack() {
	unpack ${A}
	cd "${S}/src/"
	epatch "${FILESDIR}/dir_search_ati.patch"
}
