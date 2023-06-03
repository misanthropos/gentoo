# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A flexible modern C++ library for string manipulation and storage"
HOMEPAGE="https://github.com/zrax/string_theory/"
SRC_URI="https://github.com/zrax/string_theory/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/string_theory-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE="test"
DEPEND="test? ( dev-cpp/gtest )"
RESTRICT="!test? ( test )"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DST_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

src_test() {
        cd "${BUILD_DIR}/test" || die
        ./st_gtests || die
}
