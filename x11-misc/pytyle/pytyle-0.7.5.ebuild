# Copyright 1999-2009 Tiziano Müller
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="A manual tiling manager"
HOMEPAGE="http://pytyle.com"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/python-xlib"
RDEPEND="${DEPEND}"

PYTHON_MODNAME="PyTyle"

src_install() {
	DOCS="pytylerc"
	distutils_src_install
}

