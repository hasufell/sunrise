# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools eutils versionator

DESCRIPTION="GTK+ based GUI for xneur"
HOMEPAGE="http://www.xneur.ru/"
SRC_URI="http://dists.xneur.ru/release-${PV}/tgz/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

COMMON_DEPEND="gnome-base/libglade:2.0
	gnome-base/gconf:2
	>=sys-devel/gettext-0.16.1
	>=x11-libs/gtk+-2.18:2
	>=x11-misc/xneur-$(get_version_component_range 1-2)"
RDEPEND="${COMMON_DEPEND}
	nls? ( virtual/libintl )"
DEPEND="${COMMON_DEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

src_prepare() {
	rm -f m4/{lt~obsolete,ltoptions,ltsugar,ltversion,libtool}.m4 \
		ltmain.sh aclocal.m4 || die
	sed -i "s/-Werror -g0//" configure.in || die
	eautoreconf
}

src_configure() {
	econf $(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog NEWS
	doicon pixmaps/gxneur.png
}
