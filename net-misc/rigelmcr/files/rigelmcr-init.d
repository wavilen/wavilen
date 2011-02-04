#!/sbin/runscript
# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/igmpproxy/files/igmpproxy-init.d,v 1.1 2009/05/03 20:05:14 idl0r Exp $

depend() {
	need net
	use logger
}

start() {
	ebegin "Starting rigelmcr"
	start-stop-daemon --start --background \
		--make-pidfile --pidfile /var/run/rigelmcr.pid \
		--exec /usr/sbin/rigelmcr -- \
		${RIGELMCR_OPTS} "${RIGELMCR_CONFIG:-/etc/rigelmcr.conf}"
	eend $?
}

stop() {
	ebegin "Stopping rigelmcr"
	start-stop-daemon --stop --pidfile /var/run/rigelmcr.pid
	eend $?
}

