# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games cmake-utils

DESCRIPTION="Stunt Rally - game based on VDrift and OGRE, with Track Editor"
HOMEPAGE="http://code.google.com/p/vdrift-ogre/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/StuntRally-${PV}-sources.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-games/ogre-1.8
		>=dev-games/ois-1.2
		>=dev-games/mygui-3.2
		>=dev-libs/boost-1.43
		>=media-libs/libsdl-1.2.14
		>=media-libs/libvorbis-1.2.2
		>=media-libs/libogg-1.1.4
		>=net-libs/enet-1.3"

RDEPEND="${DEPEND}"

S="${WORKDIR}/StuntRally-${PV}-sources"
