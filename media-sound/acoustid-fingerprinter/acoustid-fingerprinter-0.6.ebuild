# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="GUI application to submit audio fingerprints to the Acoustid database."
HOMEPAGE="https://acoustid.org/fingerprinter"
SRC_URI="https://bitbucket.org/acoustid/${PN}/downloads/${P}.tar.gz"
RESTRICT="mirror"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
DEPEND="dev-qt/qtgui:4
	media-libs/chromaprint
	media-libs/taglib
	virtual/ffmpeg"

RDEPEND="${DEPEND}"
