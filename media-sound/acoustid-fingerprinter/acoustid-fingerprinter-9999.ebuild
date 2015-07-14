# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

if [[ "${PV}" = "9999" ]]; then
	inherit git-r3
fi
inherit cmake-utils

if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="https://bitbucket.org/acoustid/${PN}.git"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://bitbucket.org/acoustid/${PN}/downloads/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="GUI application to submit audio fingerprints to the Acoustid database."
HOMEPAGE="https://acoustid.org/fingerprinter"
RESTRICT="mirror"
LICENSE="GPL-2"

SLOT="0"

IUSE=""
DEPEND="dev-qt/qtgui:4
	media-libs/chromaprint
	media-libs/taglib
	virtual/ffmpeg"

RDEPEND="${DEPEND}"
