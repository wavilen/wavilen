# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="VLC-Qt is a free library used to connect Qt and libvlc libraries."
HOMEPAGE="http://tano.si/en/vlc-qt"
SRC_URI="mirror://sourceforge/${PN/lib/}/VLC-Qt/${PV}/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
   app-doc/doxygen
   >=x11-libs/qt-core-4.6
   media-video/vlc
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"
