# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="CONKY-colors is an easier way to configure Conky."
HOMEPAGE="http://gnome-look.org/content/show.php/CONKY-colors?content=92328"
SRC_URI="http://www.deviantart.com/download/244793180/conky_colors_by_helmuthdu-d41qrmk.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="hdd sensor"

DEPEND="~app-admin/conky-1.8.1[X,curl,imlib,lua,lua-cairo,lua-imlib,ncurses]
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
		sed -i -e "s:ln -fs \$(DESTDIR)/usr/share/conkycolors/bin/conkyTask /usr/bin/ct:ln -fs /usr/share/conkycolors/bin/conkyTask \$(DESTDIR)/usr/bin/ct:" Makefile || die "sed fix failed. Uh-oh..."

}

src_install() {
		emake DESTDIR="${D}" install || die "Install failed"
}

pkg_postinst() {
		elog "Update your font cache:"
		elog "\$sudo fc-cache -v -f"
}
