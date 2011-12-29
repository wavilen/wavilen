# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils eutils #versionator git

#C_PV=$(get_version_component_range 1-2)
DESCRIPTION="Tano can play almost every multimedia file, including SD and HD IP
Television channels"
HOMEPAGE="http://tano.si/"
#EGIT_REPO_URI="git://github.com/ntadej/tano"
#EGIT_BRANCH="$C_PV"
#EGIT_COMMIT="$PV"


#SRC_URI="mirror://sourceforge/${PN}/Tano%20Player/${PV}/${P/-/_}_src.tar.gz"
SRC_URI="https://github.com/ntadej/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/libvlc-qt"
RDEPEND="${DEPEND}"

S="${WORKDIR}/ntadej-tano-78a3b67"


src_install()
{
	cd ${WORKDIR}/${P}_build
	emake install DESTDIR="${D}" || die "Install failed"
	cd ${S}
	dodoc NEWS README VERSION || die "dodoc failed"
	newicon data/logo/48x48/logo.png ${PN}.png
	insinto /usr/share/applications
	doins tano.desktop
}
