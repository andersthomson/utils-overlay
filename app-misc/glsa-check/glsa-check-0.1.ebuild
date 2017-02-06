# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit systemd


DESCRIPTION="Do a glsa check and mail it"

LICENSE="AS-IS"
SLOT="0"
IUSE=""

DEPENDS=""
RDEPEND="app-portage/gentoolkit
		mail-client/mailx"

S=${WORKDIR}

src_install() {
	systemd_dounit "${FILESDIR}"/glsa-check.{service,timer}
}
