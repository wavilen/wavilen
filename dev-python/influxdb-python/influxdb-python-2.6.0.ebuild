# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy pypy3 )
inherit distutils-r1

DESCRIPTION="InfluxDB-Python is a client for interacting with InfluxDB."
HOMEPAGE="http://influxdb-python.readthedocs.org/"
SRC_URI="https://pypi.python.org/packages/source/i/influxdb/influxdb-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
    dev-db/influxdb"

S="${WORKDIR}/influxdb-${PV}"
