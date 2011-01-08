# Copyright 1999-2009  Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P="Pivy-${PV}"

DESCRIPTION="a Coin binding for Python"
HOMEPAGE="http://pivy.coin3d.org/"
SRC_URI="http://pivy.coin3d.org/download/pivy/releases/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=media-libs/coin-2.4.5
	media-libs/SoQt"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}" 

src_unpack(){
    distutils_src_unpack
    epatch \
	"${FILESDIR}/pivy-patch.patch"
	}
	

