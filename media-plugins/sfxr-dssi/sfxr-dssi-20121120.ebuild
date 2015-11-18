# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="threads(+)"
NO_WAF_LIBDIR=1
inherit python-any-r1 waf-utils

DESCRIPTION="sfxr sound effect generator DSSI plugin"
HOMEPAGE="http://smbolton.com/linux/"
SRC_URI="http://smbolton.com/linux/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libwhy
	media-libs/alsa-lib
	media-libs/dssi
	media-libs/ladspa-sdk
	media-libs/liblo
	x11-libs/gtk+:2="
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	virtual/pkgconfig"

RESTRICT="mirror"

DOCS=( README )
