# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Small command-line program to download videos"
HOMEPAGE="https://github.com/spaam/svtplay-dl"
EGIT_REPO_URI="git://github.com/spaam/svtplay-dl"
EGIT_COMMIT="2.1"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/pycrypto
	media-video/rtmpdump"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
