# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="2"

#NEED_PYTHON=2.4
PYTHON_DEPEND="2:2.4"

inherit distutils

MY_R="730"
DESCRIPTION="sK1 vector graphics editor"
HOMEPAGE="http://www.sk1project.org/"
SRC_URI="http://sk1project.org/downloads/sk1/${PV}pre_rev${MY_R}/${P}pre_rev${MY_R}.tar.gz"

LICENSE="|| ( GPL-2 LGPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="gnome kde"

DEPEND="dev-lang/python[tk]
	dev-python/reportlab
	>=dev-lang/tcl-8.5.0
	>=dev-lang/tk-8.5.0
	dev-python/imaging[tk]
	gnome? ( gnome-extra/zenity )
	kde? ( kde-base/kdialog )
	>=media-libs/freetype-2.3.5
	media-libs/lcms[python]
	>=sys-libs/glibc-2.6.1
	>=sys-libs/zlib-1.2.3-r1
	>=x11-libs/cairo-1.4.0
	x11-libs/libX11
	x11-libs/libXext"
RDEPEND="${DEPEND}"

S="${WORKDIR}/sK1-${PV}pre"
