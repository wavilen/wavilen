# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
NEED_KDE="4.4"

inherit cmake-utils 

KDEAPPS_ID="118356"
MY_PN="Sentinella"
DESCRIPTION="Sentinella monitors your system activity and, when a condition is met, takes an action."
HOMEPAGE="http://www.kde-apps.org/content/show.php?content=${KDEAPPS_ID}"
SRC_URI="http://prdownloads.sourceforge.net/${PN}/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 ~x86"
IUSE=""
RDEPEND="
>=x11-libs/qt-core-4.6
>=sys-libs/libsysactivity-0.3.1
"

