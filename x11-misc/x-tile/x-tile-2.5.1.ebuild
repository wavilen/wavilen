# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PLOCALES="cs de es_AR fr it pl ru zh_CN zh_TW"

PYTHON_COMPAT=( python{2_6,2_7})
inherit distutils-r1 l10n

DESCRIPTION="X-tile is an application that allows you to select a number of
windows and tile them in different ways."
HOMEPAGE="http://www.giuspen.com/x-tile/"
SRC_URI="http://www.giuspen.com/software/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		dev-python/gconf-python"

src_prepare() {
	einfo "Cleaning unused locales..."
	xtile_langs=$(grep -E "AVAILABLE_LANGS *=" modules/cons.py) || die
	xtile_langs_original=$(echo $xtile_langs |  sed -e 's/[]\/$*.^|[]/\\&/g')
	rem_locale() {
		rm "locale/${1}.po" || die
		xtile_langs=${xtile_langs/", '${1}'"/}
	}
	l10n_for_each_disabled_locale_do rem_locale
	sed -i "s/$xtile_langs_original/$xtile_langs/g" modules/cons.py
	distutils-r1_src_prepare
}

src_install() {
    distutils-r1_src_install
}
