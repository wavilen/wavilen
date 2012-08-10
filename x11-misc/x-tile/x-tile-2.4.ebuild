# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit distutils

DESCRIPTION="X-tile is an application that allows you to select a number of
windows and tile them in different ways."
HOMEPAGE="http://www.giuspen.com/x-tile/"
SRC_URI="http://www.giuspen.com/software/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-python/setuptools"

src_prepare() {
	distutils_src_prepare
}

src_install() {
    distutils_src_install
}
