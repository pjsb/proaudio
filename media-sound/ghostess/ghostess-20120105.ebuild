# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils autotools-utils
RESTRICT="mirror"
IUSE="jack"
DESCRIPTION="graphical DSSI host, based on jack-dssi-host"
HOMEPAGE="http://www.smbolton.com/linux.html"
SRC_URI="http://www.smbolton.com/linux/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="amd64 x86"
SLOT="0"

RDEPEND="media-libs/dssi
	media-libs/liblo
	media-libs/ladspa-sdk
	x11-libs/gtk+:2
	jack? ( media-sound/jack-audio-connection-kit )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	local myeconfargs=( $(use_with jack jackmidi) )
	autotools-utils_src_configure
}
