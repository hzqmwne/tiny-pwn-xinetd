#!/bin/sh

#exec >/dev/null 2>&1

# install xinetd
#sudo apt-get update
#sudo apt-get install xinetd

ROOTDIR=rootdir

mkdir $ROOTDIR
cd $ROOTDIR

mkdir -m 0755 bin
mkdir -m 0711 etc
mkdir -m 0711 lib64
mkdir -m 0711 lib
mkdir -m 0711 lib/x86_64-linux-gnu
mkdir -m 0700 usr
mkdir -m 0755 usr/sbin

cp --preserve=mode /lib/x86_64-linux-gnu/ld-2.23.so lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libc-2.23.so lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libdl-2.23.so lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libnsl-2.23.so lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libtinfo.so.5.9 lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libwrap.so.0.7.6 lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libnss_nis-2.23.so lib/x86_64-linux-gnu
cp --preserve=mode /lib/x86_64-linux-gnu/libnss_files-2.23.so lib/x86_64-linux-gnu
ln -s /lib/x86_64-linux-gnu/ld-2.23.so lib64/ld-linux-x86-64.so.2
ln -s libc-2.23.so lib/x86_64-linux-gnu/libc.so.6
ln -s libdl-2.23.so lib/x86_64-linux-gnu/libdl.so.2
ln -s libnsl-2.23.so lib/x86_64-linux-gnu/libnsl.so.1
ln -s libtinfo.so.5.9 lib/x86_64-linux-gnu/libtinfo.so.5
ln -s libwrap.so.0.7.6 lib/x86_64-linux-gnu/libwrap.so.0
ln -s libnss_nis-2.23.so lib/x86_64-linux-gnu/libnss_nis.so.2
ln -s libnss_files-2.23.so lib/x86_64-linux-gnu/libnss_files.so.2

cp --preserve=mode /bin/bash bin/
ln -s bash bin/sh
cp --preserve=mode /bin/cat bin/
cp ../ls bin/ ; chmod 0755 bin/ls
cp --preserve=mode /usr/sbin/xinetd usr/sbin
mkdir -m 700 etc/xinetd.d
cp --preserve=mode /etc/xinetd.conf etc/ ; chmod 600 etc/xinetd.conf
cp --preserve=mode /etc/protocols etc/ ; chmod 600 etc/protocols 

#cp /etc/localtime etc

# for debug
#cp /bin/busybox usr/sbin/
#cp /usr/bin/strace usr/sbin/

sudo chown -R root:root *
sudo tar zcvf ../rootdir_ubuntu_16_04.tar.gz * >/dev/null
sudo chown -R $USER:$USER * ../rootdir_ubuntu_16_04.tar.gz
cd ..

# clean up
rm -rf $ROOTDIR


