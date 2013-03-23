# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="ALSA Tray provides a systray icon and a command line interface for setting the volume of the ALSA Mixers."
HOMEPAGE="http://projects.flogisoft.com/alsa-tray/"
SRC_URI="http://projects.flogisoft.com/${PN}/download/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pyalsaaudio
		${DEPEND}"

src_install() {
	./install.sh --package "${D}"
}
