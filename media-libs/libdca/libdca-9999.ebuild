# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="https://github.com/foo86/dcadec.git"
inherit git-r3


DESCRIPTION="DTS Coherent Acoustics decoder with support for HD extensions"
HOMEPAGE="https://github.com/foo86/dcadec"
unset SRC_URI

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
    if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
        export PREFIX="${EROOT}"/usr
        emake || die "emake failed"
    fi
}
