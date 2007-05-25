# Copyright 2003-2007 SabayonLinux
# Copyright 2007-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde eutils

DESCRIPTION="a frontend to various audio converters for KDE"
HOMEPAGE="http://kde-apps.org/content/show.php?content=29024"
SRC_URI="http://hessijames.googlepages.com/soundkonverter-${PV}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE="lame vorbis flac ffmpeg musepack kdeenablefinal arts aac"

DEPEND=">=media-libs/taglib-1.4
	>=media-sound/cdparanoia-3.9.8-r5
	>=x11-libs/qt-3.3.4
        aac? ( media-libs/libmp4v2 )
       "

RDEPEND="${DEPEND}
        lame? ( >=media-sound/lame-3.96 )
        vorbis? ( >=media-sound/vorbis-tools-1.0 )
        flac? ( >=media-libs/flac-1.1.1 )
        ffmpeg? ( >=media-video/ffmpeg-0.4.8 )
        musepack? ( >=media-sound/musepack-tools-1.15u )
        "

need-kde 3.5

#src_unpack() {
#	kde_src_unpack
#}

src_compile() {
#	append-flags -fno-inline
	local myconf="$(use_with aac mp4v2)
			$(use_enable kdeenablefinal final)
			$(use_with arts arts)"
	kde_src_compile || die "Compile error"
}

src_install() {
	kde_src_install || die "Installation failed"
        mv "${D}"/usr/share/doc/HTML "${D}"/usr/share/doc/${PF}/html
}

pkg_postinst() {
	echo 
	elog "  The audio USE flags are for your convience, but are not required."
	elog "	For AmaroK users there is a script included with this package."
	elog "	You can enable it with the Script Manager tool in Amarok."
	echo 
}

