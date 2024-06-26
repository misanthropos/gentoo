# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

if [[ ${PV} == *9999 ]]; then
	EGIT_REPO_URI="https://github.com/hayamiz/twittering-mode.git"
	inherit git-r3
	IUSE="doc"
else
	SRC_URI="https://downloads.sourceforge.net/twmode/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	RESTRICT="test"
fi

DESCRIPTION="Emacs major mode for Twitter"
HOMEPAGE="http://twmode.sourceforge.net/"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="app-crypt/gnupg"

src_compile() {
	elisp-compile twittering-mode.el
	[[ ${PV} == *9999 ]] && use doc && emake -C doc/manual
}

src_install() {
	elisp-install ${PN} twittering-mode.el *.elc
	[[ ${PV} == *9999 ]] && use doc && dodoc doc/manual/twmode/twmode.html
}
