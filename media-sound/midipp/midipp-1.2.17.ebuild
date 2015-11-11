# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit qmake-utils

DESCRIPTION="play any kind of music in seconds with your fingertips."
HOMEPAGE="http://www.selasky.org/hans_petter/midistudio/"
SRC_URI="https://github.com/myDistro/${PN}/archive/${PV}.tar.gz"

S="${S}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5 +jack"

DEPEND="
	!qt5? (
		dev-qt/qtcore:4
	)
	qt5? (
		dev-qt/qtcore:5
	)
	jack? ( media-sound/jack-audio-connection-kit )"

src_configure(){
	if use jack; then
		JACK="HAVE_JACK=YES"
	fi
	if use qt5 ; then
		eqmake5 HAVE_STATIC=YES $JACK PREFIX="${D}"
	else
		eqmake4 HAVE_STATIC=YES $JACK PREFIX="${D}"
	fi
}
