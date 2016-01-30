# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit qmake-utils

DESCRIPTION="play any kind of music in seconds with your fingertips."
HOMEPAGE="http://www.selasky.org/hans_petter/midistudio/"
SRC_URI="https://github.com/myDistro/${PN}/archive/${PV}.tar.gz"

S="${S}/${PN}"

LICENSE="BSD-2"
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

myqmake(){
	if ! use qt5; then
		eqmake4 "${@}"
	else
		eqmake5 "${@}"
	fi
}

src_configure(){
	if use jack; then
		JACK="HAVE_JACK=YES"
	fi
	myqmake HAVE_STATIC=YES $JACK PREFIX="${D}"

}
