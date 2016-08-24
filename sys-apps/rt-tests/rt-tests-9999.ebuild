# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

DESCRIPTION="Programs to test various rt-linux features."
HOMEPAGE="http://git.kermel.org/cgit/linux/kernel/git/clrkwllms"
EGIT_REPO_URI="git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/${PN}.git"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

DEPEND="sys-process/numactl"
RDEPEND="${DEPEND}
	${PYTHON_DEPS}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_configure() {
	echo "Nothing to configure"
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" prefix="/usr" install
	python_replicate_script "${ED}"/usr/lib64/python2.7/site-packages/hwlatdetect.py
}
