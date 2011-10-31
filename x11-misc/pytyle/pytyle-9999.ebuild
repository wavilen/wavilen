# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mercurial python

PYTHON_DEPEND="2"
EAPI=3

DESCRIPTION="PyTyle is an on-demand automatic and manual tiling manager"
HOMEPAGE="http://code.google.com/p/pytyle/"
unset SRC_URI
EHG_REPO_URI="https://code.google.com/p/${PN}/"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="=x11-libs/xpyb-9999"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/all-desktops.patch"
	}

src_install() {
	python2 setup.py install --root="${D}" || die
	}
