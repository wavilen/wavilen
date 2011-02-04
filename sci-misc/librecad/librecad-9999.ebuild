# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: librecad-9999.ebuild $

EAPI="2"

inherit qt4-r2 subversion

DESCRIPTION="An generic 2D CAD program"
HOMEPAGE="http://www.librecad.org/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

ESVN_REPO_URI=https://librecad.svn.sourceforge.net/svnroot/librecad/trunk
#ESVN_RESTRICT=export

#src_unpack()
#{
#	subversion_src_unpack || die
#	rsync -rlpgo . "${S}" || die "${ESVN}: can't export to ${S}."
#}

src_install()
{
	dobin unix/librecad || die
	insinto /usr/share/"${PN}"
	doins -r unix/resources/* || die
	dohtml -r support/doc/* || die
	doicon res/main/"${PN}".png || die
	make_desktop_entry "${PN}" LibreCAD "${PN}.png" Graphics || die
}
