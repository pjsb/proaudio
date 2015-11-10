# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5


DESCRIPTION="MIDI Player Pro is the software you need to be able to play any kind of music in seconds with your fingertips."
HOMEPAGE="http://www.selasky.org/hans_petter/midistudio/"
SRC_URI="https://github.com/myDistro/${PN}/archive/${PV}.tar.gz"


LICENSE="FREE"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""


DEPEND="
	dev-qt/qtcore
	media-sound/jack-audio-connection-kit"

DOCS=""

src_configure(){
	cd midipp
	qmake HAVE_STATIC=YES HAVE_JACK=YES PREFIX=${D}
}

src_compile() {
	cd midipp
	make
}

src_install(){
	cd midipp
	emake DESTDIR=${D} install
}
