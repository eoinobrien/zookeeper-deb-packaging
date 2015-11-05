zookeeper-deb-packaging
===================

Simple debian packaging for Apache Zookeeper, great for Ubuntu 14.04LTS

Based on the great [Kafka/Zookeeper Deb Packaging Repo](https://github.com/ntbrock/kafka-deb-packaging) by @ntbrock

# Usage

```sh
$ ./dist_zookeeper.sh
```

# Sample Output

```sh
~/git/zookeeper-deb-packaging$ ./dist_zookeeper.sh

--2015-11-05 19:40:11--  http://mirrors.whoishostingthis.com/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
Resolving mirrors.whoishostingthis.com (mirrors.whoishostingthis.com)... 54.246.233.92
Connecting to mirrors.whoishostingthis.com (mirrors.whoishostingthis.com)|54.246.233.92|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 17699306 (17M) [application/x-gzip]
Saving to: ‘zookeeper-3.4.6.tar.gz’

zookeeper-3.4.6.tar.gz                              100%[==================================================================================================================>]  16.88M  9.52MB/s   in 1.8s

2015-11-05 19:40:12 (9.52 MB/s) - ‘zookeeper-3.4.6.tar.gz’ saved [17699306/17699306]

~/Code/deb-packaging/zookeeper-deb-packaging/tmp ~/Code/deb-packaging/zookeeper-deb-packaging
Created package {:path=>"zookeeper_3.4.6-1_all.deb"}
~/Code/deb-packaging/zookeeper-deb-packaging

```

# Installation

```sh
$ dpkg -i zookeeper_3.4.6-1_all.deb
```

## Post install

```sh
$ sudo ln -s /etc/zookeeper/zoo_sample.cfg /etc/zookeeper/my_zoo.cfg
// Or create you\'re own my_zoo.cfg file

$ sudo update-rc.d zookeeper defaults 20
```



