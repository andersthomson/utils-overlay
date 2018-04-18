# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

#inherit eutils git-r3 linux-info systemd toolchain-funcs user
inherit eutils autotools git-r3 toolchain-funcs

DESCRIPTION="Comskip"
HOMEPAGE="https://https://github.com/erikkaashoek/Comskip/"

if [[ ${PV#9999} != ${PV} ]]; then
		EGIT_REPO_URI="https://github.com/erikkaashoek/Comskip.git"
        KEYWORDS=""
else
        #expect a PV of the form 0.0_p1234 where 1234 is the svn revision
		EGIT_REPO_URI="https://github.com/erikkaashoek/Comskip.git"
		case $PV in
			"0.82.006_p16") EGIT_COMMIT="26de6b88b6c7e2f50c9ae109a79214a74de39960" ;;
			*) die "No version given"
		esac
        KEYWORDS="~amd64 ~x86 ~arm"
fi


LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

#RDEPEND+=""

#CONFIG_CHECK="~INOTIFY_USER"

DOCS=( README.md )

src_prepare() {
#	# remove '-Werror' wrt bug #438424
#	sed -e 's:-Werror::' -i Makefile || die 'sed failed!'
	XTRACOMMITS=`git describe --tags | cut -d- -f2`
	if [ "$XTRACOMMITS" ] ; then
		sed -ie 's/"\r$/.'$XTRACOMMITS'"\r/'  comskip.h
	fi
	cat comskip.h
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
