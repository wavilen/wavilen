# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit git qt4-r2

DESCRIPTION="Foobar-like interface for qmmp"
HOMEPAGE="http://gitorious.org/qmmp-fooui"
EGIT_REPO_URI="git://gitorious.org/qmmp-fooui/qmmp-fooui.git"
EGIT_BRANCH="master"
unset SRC_URI
LANGS="ru"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=media-sound/qmmp-0.5.0"
RDEPEND="${DEPEND}"

src_prepare() {
	qt4-r2_src_prepare
	# fix translations directory
	einfo "Fixing LINGUAS path"
	sed -i "s/\:\/translations/\/usr\/share\/${PN}\/languages/" main.cpp
}

src_unpack() {
	git_src_unpack
}

src_install() {
	dobin ${PN}
	for X in ${LANGS}; do
		for Z in ${LINGUAS}; do
			if [[ ${X} == ${Z} ]]; then
				einfo "Installing ${Z} translation files"
				insinto	/usr/share/${PN}/languages/
				doins "${S}"/translations/${PN/-/_}_${X}.qm || die "failed to install ${X} translation"
			fi
		done
	done
	make_desktop_entry ${PN} ${PN/q/Q} qmmp \
		"AudioVideo;Player;Audio;Qt;" "Encoding=UTF-8" || die "make_desktop_entry failed"
}

