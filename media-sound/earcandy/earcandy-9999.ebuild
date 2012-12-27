# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT="python2_7"
inherit bzr python

EBZR_REPO_URI="lp:earcandy"

DESCRIPTION="A sound level manager that fades applications in and out based on their profile and window focus"
HOMEPAGE="https://launchpad.net/earcandy"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
DOCS="README COPYING"

DEPEND="media-sound/pulseaudio
	dev-lang/python"

RDEPEND="${DEPEND}
	dev-python/ctypesgen
	dev-python/dbus-python
	dev-python/gconf-python
	dev-python/gst-python
	dev-python/pyalsa
	dev-python/pyalsaaudio
	dev-python/pygobject
	dev-python/pygtk
	dev-python/pyxml
	dev-python/notify-python
	gnome-base/libglade
	dev-python/libwnck-python"

DEPEND="${DEPEND}
	dev-vcs/bzr"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
