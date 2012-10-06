# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/menumaker/menumaker-0.99.7.ebuild,v 1.6 2011/04/24 14:16:26 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"

inherit python eutils

DESCRIPTION="Utility that scans through the system and generates a menu of installed programs"
HOMEPAGE="http://menumaker.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~x86-fbsd"
IUSE="doc compiz awesome urxvt"

DEPEND="doc? ( sys-apps/texinfo )
		compiz? ( x11-wm/compiz )
		"
RDEPEND=""

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	use compiz && ( sed -i "/fronts = {/r ${FILESDIR}/compiz.inc" ${S}/MenuMaker/__init__.py && einfo "Include OK";
	cp "${FILESDIR}/Compiz.py" "${S}/MenuMaker/";
	cp "${FILESDIR}/MyGTKMenu.py" "${S}/MenuMaker/" )
	use awesome && ( sed -i "/fronts = {/r ${FILESDIR}/awesome.inc" ${S}/MenuMaker/__init__.py && einfo "Include OK";
	cp "${FILESDIR}/Awesome.py"  "${S}/MenuMaker/" )
	use urxvt && ( sed -i 's/(T.xvt, KwS("Rxvt", "Xvt"/&, "Urxvt"/' ${S}/MenuMaker/__init__.py; 
	sed -i 's/exes \= \["rxvt", "xvt"/&, "urxvt"/' ${S}/Prophet/Legacy/Shell.py ) 
}

src_configure() {
	econf PYTHON="$(PYTHON)"
}

src_compile() {
	emake -j1 || die "emake failed"

	if use doc; then
		cd doc
		emake html || die "Generation of documentation failed"
	fi
}

src_install() {
	emake -j1 DESTDIR="${D}" install || die "emake install failed"
	python_need_rebuild

	find "${D}" "(" -name "*.pyc" -o -name "*.pyo" ")" -print0 | xargs -0 rm -fr

	dodoc ChangeLog README NEWS AUTHORS INSTALL

	if use doc; then
		dohtml doc/mmaker.html/*
	fi
}

pkg_postinst() {
	python_mod_optimize /usr/$(get_libdir)/menumaker
}

pkg_postrm() {
	python_mod_cleanup /usr/$(get_libdir)/menumaker
}
