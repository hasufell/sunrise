# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit kde4-base

MY_P=${P/_beta/~beta}
DESCRIPTION="A simple media player for KDE"
HOMEPAGE="http://bangarangkde.wordpress.com"
SRC_URI="http://bangarangissuetracking.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="kde-base/kdemultimedia-kioslaves"

S=${WORKDIR}/${PN}-${PN}
