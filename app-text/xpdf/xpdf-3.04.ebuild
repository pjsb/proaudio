# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit fdo-mime gnome2 eutils flag-o-matic toolchain-funcs

DESCRIPTION="An X Viewer for PDF Files"
HOMEPAGE="http://www.foolabs.com/xpdf/"
SRC_URI="ftp://ftp.foolabs.com/pub/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="a4"

RDEPEND="media-libs/freetype
	sys-libs/zlib
	media-libs/libpng"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	append-flags '-DSYSTEM_XPDFRC="\"/etc/xpdfrc\""'
	# We know it's there, probably won't get rid of it, so let's make
	# the build output readable by removing it.
	einfo "Suppressing warning overload with -Wno-write-strings"
	append-cxxflags -Wno-write-strings
}

src_configure() {
	# portage use poppler for all the pdf related software. cups-filters need
	# poppler[utils], which install all pdf* binary files in /usr/bin. To
	# avoid file collisions, we use --prefix=/usr/local. Another solution
	# would be to rename these files, but that will break existing scripts
	# using these files.
	econf 	--with-freetype2-library=/usr/lib64 \
		--with-freetype2-includes=/usr/include/freetype2 \
		$(use_enable a4 a4-paper) \
		--prefix=/usr/local --mandir=/usr/local/share/man
}

src_compile() {
	tc-export CXX
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README ANNOUNCE CHANGES
	newicon "${S}/${PN}"/xpdfIcon.xpm xpdf.xpm
	insinto /usr/share/applications
	doins "${FILESDIR}"/xpdf.desktop
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}
