# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git

DESCRIPTION="Dana's composite manager (not for production use)"
HOMEPAGE="http://git.openbox.org/?p=dana/dcompmgr.git;a=summary"
unset SRC_URI
EGIT_REPO_URI="git://git.openbox.org/dana/dcompmgr"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/glib
		x11-proto/xcb-proto"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
}
