# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils autotools linux-info

DESCRIPTION="SMCRoute is a tool to manipulate the multicast routes of the Linux
kernel."
HOMEPAGE="http://alioth.debian.org/projects/smcroute"
SRC_URI="http://alioth.debian.org/frs/download.php/3204/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

CONFIG_CHECK="~IP_MULTICAST ~IP_MROUTE"

src_prepare() {
	epatch "${FILESDIR}/${P}-alt-changes.patch"
	cd src/
	eautoreconf
}

src_configure() {
	cd src/
	econf
}
src_compile() {
	cd src/
	make all
}

src_install() {
	dosbin src/mcsender src/smcroute
	doman doc/smcroute.8 doc/mcsender.8
	dodoc ChangeLog AUTHORS COPYING
	newinitd "${FILESDIR}/${PN}-init.d" ${PN} || die
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN} || die
}

