# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils 

DESCRIPTION="VLC-Qt is a free library used to connect Qt and libvlc libraries."
HOMEPAGE="http://projects.tano.si/library"
RESTRICT="mirror"
SRC_URI="http://download.tano.si/${PN/lib/}/${PV}/${PN}_${PV}_src.tar.gz"
#EGIT_REPO_URI="git://github.com/ntadej/vlc-qt"
#EGIT_BRANCH="master"
#EGIT_COMMIT="$PV"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
MAKEOPTS="-j1"

DEPEND="
   app-doc/doxygen
   >=dev-qt/qtcore-4.8
   <media-video/vlc-2.0.5
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"
