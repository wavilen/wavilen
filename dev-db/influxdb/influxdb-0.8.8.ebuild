# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit user

DESCRIPTION="Scalable datastore for metrics, events, and real-time analytics"
HOMEPAGE="http://influxdb.org/"
SRC_URI="http://s3.amazonaws.com/influxdb/${P}.src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
    dev-libs/leveldb
	dev-db/rocksdb"
RDEPEND="${DEPEND}"

S="${WORKDIR}/src/github.com/${PN}/${PN}"


src_configure() {
    export GOPATH=${WORKDIR}
	econf
}

src_compile() {
    export GOPATH=${WORKDIR}
    make protobuf
	make parser
    go build -tags rocksdb -o "${PN}" github.com/${PN}/${PN}/daemon || die "compilation failed"
}

src_test() {
    ./${PN} -v || die "test failed"
}

pkg_preinst() {
    enewgroup ${PN}
    enewuser ${PN} -1 -1 -1 ${PN}
}

pkg_postinst()
{
	chown influxdb:influxdb -R /var/lib/influxdb
	chown influxdb:influxdb -R /var/log/influxdb
}

src_install() {
    dobin ${PN}
	insinto /usr/lib/systemd/system/
	newins ${FILESDIR}/${PN}.service ${PN}.service
	dodoc LICENSE
	dodoc config.sample.toml
	cp -i config.sample.toml ${PN}.conf
	sed -i 's/\/tmp\/influxdb\/development\/db/\/var\/lib\/influxdb\/data/g' ${PN}.conf
	sed -i 's/\/tmp\/influxdb\/development\/raft/\/var\/lib\/influxdb\/raft/g' ${PN}.conf
	sed -i 's/\/tmp\/influxdb\/development\/wal/\/var\/lib\/influxdb\/wal/g' ${PN}.conf
	sed -i 's/influxdb.log/\/var\/log\/influxdb\/influxdb.log/g' ${PN}.conf
	insinto /etc
	doins ${PN}.conf
	insinto /usr/share/${PN}
	doins cert.pem
	dodir /var/lib/influxdb/{data,raft,wal}
	dodir /var/log/influxdb
}
