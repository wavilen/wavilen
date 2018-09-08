# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit linux-info linux-mod git-r3

DESCRIPTION="DIGImend kernel drivers"
HOMEPAGE="http://digimend.github.io/"
#SRC_URI="https://github.com/DIGImend/digimend-kernel-drivers/archive/v${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/DIGImend/digimend-kernel-drivers.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
MODULE_NAMES="hid-kye(extra:) hid-polostar(extra:) hid-uclogic(extra:) hid-viewsonic(extra:)"
BUILD_TARGETS="clean module"


src_compile() {
    unset ARCH
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}

src_install() {
#	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
#		emake DESTDIR="${D}" install
#	fi
#	einstalldocs
    linux-mod_src_install
    into /
	dosbin hid-rebind
	insinto /lib/udev/rules.d
	doins 90-hid-rebind.rules
    insinto /etc/depmod.d
	doins digimend.conf
}


