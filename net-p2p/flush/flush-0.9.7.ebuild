# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils distutils flag-o-matic versionator

DESCRIPTION="A GTK-based BitTorrent client by Dmitry Konishchev"
HOMEPAGE="http://sourceforge.net/projects/flush/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE="+libnotify"

DEPEND=">=x11-libs/gtk+-2.16.6
	>=dev-cpp/gtkmm-2.16.0
	>=dev-cpp/glibmm-2.20.1	
    libnotify? (
	>=x11-libs/libnotify-0.4.5-r1
	>=x11-misc/notify-osd-0.9.29-r1
    )
	>=sys-devel/gettext-0.17
	>=dev-libs/libconfig-1.3.2
	>=dev-libs/boost-1.35.0
	>=sys-apps/dbus-1.2.3
	
	>=net-libs/rb_libtorrent-0.14.8"
RDEPEND="${DEPEND}"

src_configure() {
	BOOST_PKG="$(best_version ">=dev-libs/boost-1.35")"
	BOOST_VER="$(get_version_component_range 1-2 "${BOOST_PKG/*boost-/}")"
	BOOST_VER="$(replace_all_version_separators _ "${BOOST_VER}")"
	BOOST_INC="/usr/include/boost-${BOOST_VER}"
	BOOST_LIB="/usr/$(get_libdir)/boost-${BOOST_VER}"

    append-flags -pthread
	econf \
		--with-boost=${BOOST_INC} \
		--with-boost-libdir=${BOOST_LIB} \
		LIBS="-lboost_thread -lboost_date_time" \
			--disable-bundle-package \
			--enable-system-libconfig \
			--enable-system-libtorrent
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc COPYING ChangeLog

	# Fix icon if using different icon theme in GNOME
	insinto /usr/share/pixmaps
	doins ./icons/hicolor/72x72/apps/flush.png
}
