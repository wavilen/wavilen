#!/sbin/runscript
# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


NAME=smcroute
DAEMON=/usr/sbin/${NAME}
PIDFILE=/var/run/${NAME}.pid

depend() {
        need net
        use logger
}

start() {
    start-stop-daemon --start --pidfile ${PIDFILE} --exec ${DAEMON} -d ${DAEMON_OPTS}
    eend $?
}

stop() {
    start-stop-daemon --stop --pidfile ${PIDFILE} --exec ${DAEMON} -k
    eend $?
}


