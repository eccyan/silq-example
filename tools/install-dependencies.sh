#!/bin/bash

packages=(
    git
    sudo
    dnf-utils
    net-tools
    util-linux
    ethtool
    glibc-langpack-en
    lld
)

if rpm -q --quiet yum-utils; then
    exit 1
fi

yum install -y "${packages[@]}"
