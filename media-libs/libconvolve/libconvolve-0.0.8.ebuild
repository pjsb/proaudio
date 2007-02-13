# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

RESTRICT="nomirror"
IUSE=""
DESCRIPTION="A simple C library for partitioned convolution"
HOMEPAGE="http://tapas.affenbande.org/?page_id=9"
SRC_URI="http://tapas.affenbande.org/jack_convolve/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"

DEPEND=">=media-libs/libdsp-5.0.1
	>=media-sound/jack-audio-connection-kit-0.99
	media-libs/libsndfile 
	media-libs/libsamplerate
	=sci-libs/fftw-3*
	dev-util/pkgconfig"

src_unpack(){
	unpack "${A}"
	cd ${S}
	epatch "${FILESDIR}/Makefile-destdir.patch"
	sed -e "s:^PREFIX.*:PREFIX = /usr:" -i Makefile
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS README
}
