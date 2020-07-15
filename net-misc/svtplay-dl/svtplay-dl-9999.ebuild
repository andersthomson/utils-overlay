# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit git-r3 distutils-r1

DESCRIPTION="Small command-line program to download videos"
HOMEPAGE="https://github.com/spaam/svtplay-dl"
EGIT_REPO_URI="https://github.com/spaam/svtplay-dl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/pycrypto"
BDEPEND="app-arch/zip"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
