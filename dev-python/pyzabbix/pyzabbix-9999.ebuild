# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
inherit distutils-r1 git-r3

DESCRIPTION="PyZabbix is a Python module for working with the Zabbix API."
HOMEPAGE="http://github.com/lukecyca/pyzabbix"
unset SRC_URI
EGIT_REPO_URI="https://github.com/lukecyca/pyzabbix"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/requests"
RDEPEND="${DEPEND}"
