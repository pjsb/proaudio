# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit eutils

DESCRIPTION="A collection of presets for Jamin made by Gilberto Andre Borges"
HOMEPAGE="http://proaudio.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/proaudio/distfiles/jaminpresets${PV}_all.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""
RESTRICT="mirror"
RDEPEND="media-sound/jamin"
S="${WORKDIR}/${MY_PN}"

src_install() {
	insinto /usr/share/jamin/presets
	cd "${S}/usr/share/jamin/presets"
	dodoc 1_SOBREPRESETS
	rm 1_SOBREPRESETS
	doins *
}
