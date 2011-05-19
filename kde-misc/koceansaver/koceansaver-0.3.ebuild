# Copyright 1999-2010 Gentoo Foundation 
# Distributed under the terms of the GNU General Public License v2 
# $Header: $ 

EAPI=3
NEED_KDE="4.2"

inherit qt4-r2

MY_PN="KOceanSaver"
DESCRIPTION=""
HOMEPAGE="http://koceansaver.sourceforge.net/"
SRC_URI="http://prdownloads.sourceforge.net/${PN}/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_configure() {
	eqmake4 KOceanSaver.pro
}

src_compile() {
	emake || die "Make failed!"
}
