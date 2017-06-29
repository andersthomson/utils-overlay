# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="Small command-line program to download videos"
HOMEPAGE="https://github.com/spaam/svtplay-dl"
EGIT_REPO_URI="git://github.com/spaam/svtplay-dl"
EGIT_COMMIT="1.9.4"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm ~amd64"

DEPEND_COMMON="dev-python/pycrypto
	media-video/rtmpdump"
DEPEND="app-arch/zip"
RDEPEND="${DEPEND_COMMON}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
