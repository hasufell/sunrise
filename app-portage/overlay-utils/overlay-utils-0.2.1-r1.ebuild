# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Utilities for Gentoo repository and overlay development"
HOMEPAGE="http://overlays.gentoo.org/proj/sunrise/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="app-portage/gentoolkit-dev
	dev-vcs/subversion
	>=sys-apps/portage-2.1"

S=${WORKDIR}

src_install() {
	dobin "${FILESDIR}"/sunrise-commit
	doman "${FILESDIR}"/sunrise-commit.1
}
