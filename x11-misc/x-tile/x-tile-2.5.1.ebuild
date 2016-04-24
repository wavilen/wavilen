# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="X-tile is an application that allows you to select a number of
windows and tile them in different ways."
HOMEPAGE="http://www.giuspen.com/x-tile/"
SRC_URI="http://www.giuspen.com/software/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
LANGS="cs de es_AR fr it pl ru zh_CN zh_TW"

for lang in ${LANGS}; do
        IUSE+=" linguas_${lang}"
done


DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		dev-python/gconf-python"

src_prepare() {
	einfo "Cleaning up locales..."
	xtile_langs=$(grep -E "AVAILABLE_LANGS *=" modules/cons.py) || die
	xtile_langs_original=$(echo $xtile_langs |  sed -e 's/[]\/$*.^|[]/\\&/g')
	for lang in ${LANGS}; do
		use "linguas_${lang}" && {
			einfo "- keeping ${lang}"
			continue
		}
		rm locale/"${lang}.po" || die
		xtile_langs=${xtile_langs/", '$lang'"/}
	done
	sed -i "s/$xtile_langs_original/$xtile_langs/g" modules/cons.py
	distutils-r1_src_prepare
}

src_install() {
    distutils-r1_src_install
}
