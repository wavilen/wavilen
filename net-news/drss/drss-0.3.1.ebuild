# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="A simple RSS news reader"
HOMEPAGE="http://drss.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/qt-webkit"
RDEPEND=""

src_compile() {
	make || die "Error: make failed!"
}

src_install() {
	dobin ${PN}
	make_desktop_entry ${PN} DRSS ${PN}logo.png
	doicon img/${PN}logo.png
}
