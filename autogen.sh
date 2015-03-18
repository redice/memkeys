#!/bin/sh -e

### For CentOS 6.x
sudo yum install -y gperftools gperftools-devel libtool libpcap-devel pcre-devel ncurses-devel

# upgrade autoconf
autoconf="autoconf-2.69"
cd $sourceFolder
wget -nc http://ftp.gnu.org/gnu/autoconf/$autoconf.tar.xz
sudo tar -Jxvf $autoconf.tar.xz
cd $sourceFolder/$autoconf
sudo ./configure
sudo make && sudo make install

test -n "$srcdir" || srcdir=`dirname "$0"`
test -n "$srcdir" || srcdir=.

autoreconf --force --install --verbose "$srcdir"
test -n "$NOCONFIGURE" || "$srcdir/configure" "$@"