# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="xicursorset - set cursor image for an XInput2 pointer"
HOMEPAGE="http://git.ao2.it/xicursorset.git/"
EGIT_REPO_URI="git://git.ao2.it/xicursorset.git"
EGIT_BRANCH="master"
unset SRC_URI

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libXi
	x11-libs/libXcursor
"
RDEPEND="${DEPEND}"

src_install () {
		dobin ${PN}
}
