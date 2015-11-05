#!/bin/bash
# 2015-Mar-18 Updated to latest Kafka stable: 0.8.2.1
# 2015-Mar-20 Added the init.d script and changed to use binary download of scala 2.10, Kafka 0.8.2.1

set -e
set -u
app_user=zookeeper
name=zookeeper
version=3.4.6
package_version="-1"
description="Apache Zookeeper is a open-source server which enables highly reliable distributed coordination."
url="https://zookeeper.apache.org/"
arch="all"
section="misc"
license="Apache Software License 2.0"
bin_package="zookeeper-${version}.tar.gz"
bin_download_url="http://mirrors.whoishostingthis.com/apache/zookeeper/zookeeper-${version}/${bin_package}"
origdir="$(pwd)"

#_ MAIN _#
rm -rf ${name}*.deb
if [[ ! -f "${bin_package}" ]]; then
  wget -c ${bin_download_url}
fi
mkdir -p tmp && pushd tmp
rm -rf zookeeper
mkdir -p zookeeper
cd zookeeper
mkdir -p build/usr/lib/zookeeper
mkdir -p build/usr/lib/zookeeper/logs
mkdir -p build/etc/default
mkdir -p build/etc/init
mkdir -p build/etc/init.d
mkdir -p build/etc/zookeeper
mkdir -p build/var/log/zookeeper

cp ${origdir}/zookeeper.default build/etc/default/zookeeper
cp ${origdir}/zookeeper.upstart.conf build/etc/init/zookeeper.conf
cp ${origdir}/zookeeper.init.d build/etc/init.d/zookeeper

# Updated to use the Binary package
rm -rf zookeeper-${version}
tar zxf ${origdir}/${bin_package}
cd zookeeper-${version}
cp conf/* ../build/etc/zookeeper
mv * ../build/usr/lib/zookeeper
cd ../build

fpm -t deb \
    --deb-user ${app_user} \
    -n ${name} \
    -v ${version}${package_version} \
    --description "${description}" \
    --url="{$url}" \
    -a ${arch} \
    --category ${section} \
    --vendor "" \
    --license "${license}" \
    -m "${USER}@localhost" \
    --prefix=/ \
    -s dir \
    -- .
mv zookeeper*.deb ${origdir}
popd
