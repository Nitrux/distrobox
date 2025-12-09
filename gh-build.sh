#!/usr/bin/env bash

set -x

### Clone the source
git clone -b 1.8.2.2 --depth=1 https://github.com/89luca89/distrobox.git src
mv src/* . && rm -r src

### Basic Packages
apt -qq update
apt -qq -yy install equivs git devscripts lintian --no-install-recommends

### Install Dependencies
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
debuild -b -uc -us

### Move Deb to current directory because debuild decided
### that it was a GREAT IDEA TO PUT THE FILE ONE LEVEL ABOVE
mv ../*.deb .
