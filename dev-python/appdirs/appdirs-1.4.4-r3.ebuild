# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} pypy3 )

inherit distutils-r1

DESCRIPTION="Module for determining appropriate platform-specific dirs"
HOMEPAGE="
	https://github.com/ActiveState/appdirs/
	https://pypi.org/project/appdirs/
"
SRC_URI="
	https://github.com/ActiveState/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

python_test() {
	"${EPYTHON}" test/test_api.py -v || die "Tests fail with ${EPYTHON}"
}
