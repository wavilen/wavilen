# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="CONKY-colors is an easier way to configure Conky."
HOMEPAGE="http://gnome-look.org/content/show.php/CONKY-colors?content=92328"
SRC_URI="http://gnome-look.org/CONTENT/content-files/92328-conky_colors-5.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="hdd sensor"

DEPEND="~app-admin/conky-1.8.0[X,curl,imlib,lua,lua-cairo,lua-imlib,ncurses]
		dev-python/pystatgrab
		net-misc/curl
		"
RDEPEND="${DEPEND}
		media-fonts/droid
		hdd? ( app-admin/hddtemp )
		sensor? ( sys-apps/lm_sensors )
		"

S=${WORKDIR}/${PN/-/_}

src_prepare() {
		sed -i -e "s:CFLAGS=-Wall -std=c99:& ${CFLAGS}:" Makefile || die "sed fix failed. Uh-oh..."
}

src_install() {
		emake DESTDIR="${D}" install || die "Install failed"
}

pkg_postinst() {
		elog "Update your font cache:"
		elog "\$sudo fc-cache -v -f"
}
