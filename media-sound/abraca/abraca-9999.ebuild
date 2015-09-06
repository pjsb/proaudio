# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit multilib git-r3 waf-utils

DESCRIPTION="Abraca is a GTK2 client for the XMMS2 music player."
HOMEPAGE="http://abraca.github.com/Abraca"

EGIT_REPO_URI="https://github.com/Abraca/Abraca.git"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS=""
RDEPEND=">=media-sound/xmms2-0.8
	x11-libs/gdk-pixbuf
	>=x11-libs/gtk+-3.12
	>=dev-libs/libgee-0.10.5
	dev-lang/vala:0.24"
DEPEND="${RDEPEND}"

pkg_setup() {
	export VALAC="$(type -P valac-0.24)"
}
