# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit autotools linux-info

DESCRIPTION="linux multicast router project"
HOMEPAGE="http://rigelmcr.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}/${P}

CONFIG_CHECK="~IP_MULTICAST ~IP_MROUTE"

src_prepare() {
	eautoreconf
}

src_install() {
    make DESTDIR="${D}" install || die "Install failed"
	dodoc rigelmcr.conf
	newinitd "${FILESDIR}/${PN}-init.d" ${PN} || die
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN} || die
}
