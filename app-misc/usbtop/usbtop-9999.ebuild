# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit eutils cmake-utils git-r3


DESCRIPTION="usbtop stuff"
HOMEPAGE="https://github.com/aguinet/usbtop"

EGIT_REPO_URI="https://github.com/aguinet/usbtop.git"
if [[ ${PV} = 9999* ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT=v${PV}
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="AS-IS"
SLOT="0"
IUSE=""

DEPENDS=""
BDEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
