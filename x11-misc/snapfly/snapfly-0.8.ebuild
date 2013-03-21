# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="SnapFly is a lightweight PyGTK menu which can be run as a daemon"
HOMEPAGE="http://code.google.com/p/snapfly/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_install() {
	cd ${S}
#	install -d ${D}/usr/{bin,share/${PN},share/pixmaps,icons,share}
#	install -d ${D}/usr/share/${PN}/po/
	dodir /usr/{bin,share/${PN},share/pixmaps,share/icons/hicolor,share}
	dodir /usr/share/${PN}/po/
	dodir /usr/share/${PN}/src/
	install -m 755 ${PN}-show ${D}/usr/bin/${PN}-show
	cp -a icons/* ${D}/usr/share/icons/
	cp -a po/* ${D}/usr/share/${PN}/po/
	cp -a src/* ${D}/usr/share/${PN}/src/
	doman man/ru/snapfly.1
	sed -i -e "30 a \ \ \ \ os.chdir(\'/usr/share/${PN}\')" ${PN}
	sed -i -e '32,33 d' ${PN}
	sed -i -e '32,33s/^\ \ \ \ //g' ${PN}
	cp -a ${PN} ${D}/usr/share/${PN}/ 
	ln -s /usr/share/${PN}/${PN} ${D}/usr/bin/${PN}
	ln -s /usr/share/icons/hicolor/48x48/apps/${PN}.png	${D}/usr/share/pixmaps/${PN}.png
	make_desktop_entry ${PN} SnapFly ${PN} "Utility;Core;GTK"
}
