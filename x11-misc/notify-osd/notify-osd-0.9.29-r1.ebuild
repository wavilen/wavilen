# Copyright 1999-2010 Gentoo Foundation 
# Distributed under the terms of the GNU General Public License v2 
# $Header: $ 
 
EAPI="0" 
 
inherit gnome2 eutils 
 
DESCRIPTION="Daemon that displays passive pop-up notifications" 
HOMEPAGE="https://launchpad.net/notify-osd" 
SRC_URI="mirror://ubuntu/pool/main/n/${PN}/${PN}_${PV}.orig.tar.gz" 
 
LICENSE="GPL-3" 
SLOT="0" 
KEYWORDS="~amd64 ~x86" 
IUSE="" 
 
DEPEND=">=x11-libs/libwnck-2.28.0
	>=gnome-base/gconf-2.28.1
	>=dev-util/pkgconfig-0.23
	>=x11-libs/libnotify-0.4.5
	!xfce-extra/xfce4-notifyd
	!x11-misc/notification-daemon 
	sys-apps/dbus 
	>=x11-libs/gtk+-2.14" 
RDEPEND="${DEPEND}" 
 
src_unpack() { 
               gnome2_src_unpack 
               epatch "${FILESDIR}/notify-osdMOD.patch" 
}

src_compile() {
	econf
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
}
