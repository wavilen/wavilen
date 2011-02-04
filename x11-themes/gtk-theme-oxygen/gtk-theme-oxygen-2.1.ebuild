# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Oxygen-Molecule KDE & GTK+ unified theme"
HOMEPAGE="http://www.kde-look.org/content/show.php?content=103741"
SRC_URI="http://pub.nikoli.msk.ru/portage-overlay/distfiles/kde43-oxygen-molecule.tar.lzma"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	x11-themes/gtk-engines-murrine
	x11-themes/gtk-engines
	kde-base/oxygen-icons"

DEPEND=""

src_install() {
	insinto /usr/share/themes
	doins -r ./kde43-oxygen-molecule || die "doins failed."
}
