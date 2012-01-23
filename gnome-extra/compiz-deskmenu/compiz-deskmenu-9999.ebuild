# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit git

DESCRIPTION="desktop menu for compiz"
HOMEPAGE="http://cgit.compiz.org/~crdlb/compiz-deskmenu/"
#SRC_URI=""
EGIT_REPO_URI="git://anongit.compiz-fusion.org/users/crdlb/compiz-deskmenu"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "1 i DESTDIR := ${D}" Makefile || die "Sed failed!"
	}

src_install() {
	make install || die "Install failed"
	dodoc README || die "Install doc failed"
	}
