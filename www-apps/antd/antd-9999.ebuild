# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2 eutils mono-env

DESCRIPTION="Antd"
HOMEPAGE="http://www.anthilla.com/en/projects/antd"
SRC_URI=""

LICENSE="BSD-2" #BSD-3 really...
SLOT="0"
KEYWORDS=""

EGIT_REPO_URI="git://github.com/Anthilla/Antd.git"
EGIT_MASTER="master"

DEPEND="dev-lang/mono"
RDEPEND="${DEPEND}"

src_prepare() {
	addpredict /etc/mono/registry/last-btime #nowarn
}

src_install() {
	elog "Installing Antd"
	dodir /framework
	dodir /cfg
	dodir /System
	dodir /Data
	dodir /mnt/cdrom/cfg.base.repo
	insinto /usr/lib/mono/Antd/
	doins -r Antd/bin/Release/*
	make_wrapper antd "mono /usr/lib/mono/Antd/Antd.exe"
}
