# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit toolchain-funcs versionator

DESCRIPTION="Ncurses DC++ client"
HOMEPAGE="http://sourceforge.net/projects/nanodc/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="
	sys-libs/ncurses
	sys-libs/zlib
	dev-libs/libsigc++:2
	dev-libs/glib:2"
DEPEND="${RDEPEND}
	dev-util/scons
	virtual/pkgconfig"

BIGVERSION=nanodc-$(get_version_component_range 1-2 )

pkg_setup() {
	if [[[ gcc-major-version ] != 4 ]]; then
		eerror "We need at least gcc-4.0 to compile"
		die "gcc-4 required"
	fi
}

src_compile() {
	cd "${WORKDIR}/${BIGVERSION}/trunk/src"
	scons || die "scons failed!"
}

src_install() {
	dobin "${WORKDIR}/${BIGVERSION}/trunk/src/nanodc"
}
