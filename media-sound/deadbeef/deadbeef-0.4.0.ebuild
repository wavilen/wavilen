# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit fdo-mime

DESCRIPTION="mp3/ogg/flac/sid/mod/nsf music player based on GTK2"
HOMEPAGE="http://deadbeef.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="|| ( GPL-2 LGPL-2.1 )"

EAPI="2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="alsa oss pulseaudio +gtk curl lastfm +artwork +hotkeys +supereq sid ffap vtx adplug +vorbis ffmpeg +flac +sndfile wavpack cdda gme dumb libnotify"

RDEPEND="
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )
	gtk? ( x11-libs/gtk+:2 )
	curl? ( net-misc/curl )
	media-libs/libmad
	media-libs/libogg
	media-libs/libsamplerate
	vorbis? ( media-libs/libvorbis  )
	ffmpeg? ( media-video/ffmpeg )
	flac? ( media-libs/flac )
	sndfile? ( media-libs/libsndfile )
	wavpack? ( media-sound/wavpack )
	cdda? ( dev-libs/libcdio media-libs/libcddb )
	libnotify? ( x11-libs/libnotify )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"

src_configure() {
	econf $(use_enable alsa) $(use_enable oss) $(use_enable pulseaudio pulse) \
	      $(use_enable gtk gtkui) $(use_enable curl vfs-curl) $(use_enable lastfm lfm) \
	      $(use_enable artwork) $(use_enable hotkeys) $(use_enable supereq) \
	      $(use_enable sid) $(use_enable ffap) $(use_enable vtx) \
	      $(use_enable adplug) $(use_enable vorbis) $(use_enable ffmpeg) $(use_enable flac) \
	      $(use_enable sndfile) $(use_enable wavpack) $(use_enable cdda) $(use_enable gme) \
	      $(use_enable dumb) $(use_enable libnotify notify) || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
