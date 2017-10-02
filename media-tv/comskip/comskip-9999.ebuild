# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

#inherit eutils git-r3 linux-info systemd toolchain-funcs user
inherit eutils autotools git-r3 toolchain-funcs

DESCRIPTION="Comskip"
HOMEPAGE="https://https://github.com/erikkaashoek/Comskip/"
EGIT_REPO_URI="https://github.com/erikkaashoek/Comskip.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

#RDEPEND+=""

#CONFIG_CHECK="~INOTIFY_USER"

DOCS=( README.md )

#pkg_setup() {
#	enewuser tvheadend -1 -1 /dev/null video
#}

src_prepare() {
#	# remove '-Werror' wrt bug #438424
#	sed -e 's:-Werror::' -i Makefile || die 'sed failed!'
	eautoreconf
}

src_configure() {
	econf --prefix="${EPREFIX}"/usr \
		--datadir="${EPREFIX}"/usr/share 
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	default

#	newinitd "${FILESDIR}/tvheadend.initd" tvheadend
#	newconfd "${FILESDIR}/tvheadend.confd" tvheadend

#	systemd_dounit "${FILESDIR}/tvheadend.service"

#	dodir /etc/tvheadend
#	fperms 0700 /etc/tvheadend
#	fowners tvheadend:video /etc/tvheadend
}

#pkg_postinst() {
#	elog "The Tvheadend web interface can be reached at:"
#	elog "http://localhost:9981/"
#	elog
#	elog "Make sure that you change the default username"
#	elog "and password via the Configuration / Access control"
#	elog "tab in the web interface."
#}
