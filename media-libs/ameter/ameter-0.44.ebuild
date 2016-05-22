# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="ALSA meter plugin with a graphical display"
HOMEPAGE="http://laugeo.free.fr/ameter-html"
SRC_URI="http://laugeo.free.fr/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/alsa-lib
	media-libs/libsdl
	media-libs/sdl-image"
RDEPEND="${DEPEND}"
