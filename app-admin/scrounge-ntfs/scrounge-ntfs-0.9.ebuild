# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Data recovery program for NTFS file systems."
HOMEPAGE="http://thewalter.net/stef/software/scrounge/"
SRC_URI="http://thewalter.net/stef/software/scrounge/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README NEWS AUTHORS COPYING || die
}

