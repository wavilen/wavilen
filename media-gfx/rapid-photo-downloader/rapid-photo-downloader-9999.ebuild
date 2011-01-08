# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit distutils bzr

EBZR_REPO_URI="https://code.launchpad.net/~dlynch3/rapid/trunk"

DESCRIPTION="Import your images efficiently and reliably"
HOMEPAGE="http://damonlynch.net/rapid/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="video"

RDEPEND=">=dev-lang/python-2.5
         >=dev-python/gnome-python-2.18
         >=dev-python/pygtk-2.10
         >=media-gfx/pyexiv2-0.2.0
         dev-python/notify-python
         video? ( dev-python/kaa-metadata )"

DEPEND="${RDEPEND}"


src_compile() {
	distutils_src_compile || die
}

src_install( ) {
	distutils_src_install
}
