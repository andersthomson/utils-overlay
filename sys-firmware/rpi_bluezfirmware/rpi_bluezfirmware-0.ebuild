# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )


DESCRIPTION="Rpi formware for zero w bluetooth"
#HOMEPAGE="http://www.bluez.org"
#SRC_URI="mirror://kernel/linux/bluetooth/${P}.tar.xz"

#LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm ~arm64 hppa ~mips ppc ppc64 x86"
#IUSE=""

src_unpack() {
	mkdir "${WORKDIR}"/"${PN}-${PV}"
	cp "${FILESDIR}"/BCM43430A1.hcd "${WORKDIR}"/"${PN}-${PV}/"
}

src_prepare() {
	default 
	cp "${FILESDIR}"/BCM43430A1.hcd "${WORKDIR}"/"${PN}-${PV}/"
}
src_install() {
	insinto /lib/firmware
    #doins "${WORKDIR}"/"${PN}-${PV}"/CM43430A1.hcd
    doins "${FILESDIR}"/BCM43430A1.hcd
}
