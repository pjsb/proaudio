# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )
inherit autotools eutils gnome2 python-single-r1
if [[ "${PV}" = "9999" ]]; then
	inherit git-r3
fi

DESCRIPTION="JACK audio mixer using GTK2 interface."
HOMEPAGE="http://home.gna.org/jackmixer/"

if [[ "${PV}" = "9999" ]]; then
	SRC_URI=""
	EGIT_REPO_URI="git://repo.or.cz/jack_mixer.git"
	KEYWORDS=""
else
	SRC_URI="http://download.gna.org/jackmixer/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"

IUSE="gconf lash phat"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="dev-python/fpconst[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/pyxml[${PYTHON_USEDEP}]
	media-sound/jack-audio-connection-kit"
RDEPEND="${DEPEND}
	gconf? ( dev-python/gconf-python:2 )
	lash? ( virtual/liblash[python] )
	phat? ( media-libs/pyphat )"

src_prepare() {
	epatch "${FILESDIR}"/missing-gconf-2.m4.patch
	AT_M4DIR="m4" eautoreconf
	gnome2_src_prepare
}

src_install() {
	gnome2_src_install
	python_fix_shebang "${ED}/usr/bin"
	python_optimize "${ED}/usr/share/${PN}"
	dosym /usr/bin/jack_mixer.py /usr/bin/jack_mixer
	einstalldocs
}
