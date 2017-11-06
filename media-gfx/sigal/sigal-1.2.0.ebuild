# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Simple static web gallery generator"
HOMEPAGE="http://sigal.saimon.org/"
SRC_URI="https://github.com/saimn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/argh
        dev-python/click
        dev-python/jinja
        dev-python/markdown
        dev-python/pilkit"
RDEPEND="${DEPEND}"
