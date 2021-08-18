#!/bin/bash
sed -i 's|HADOOP_HOST_NAME|'$(hostname -i)'|g' config.json

rm -rf www
rm -rf /tmp/hadoop-binaries-configs

mkdir -p www
cp config.json www/
mkdir -p /tmp/hadoop-binaries-configs/configs
mkdir -p /tmp/krb/
cp  /etc/krb5.conf /tmp/krb/


cp -rL /etc/hadoop /tmp/hadoop-binaries-configs/configs
cp -rL /etc/hive /tmp/hadoop-binaries-configs/configs
cp -rL /etc/spark /tmp/hadoop-binaries-configs/configs
cp -rL /tmp/krb/ /tmp/hadoop-binaries-configs/configs

cp -r /usr/lib/hadoop /tmp/hadoop-binaries-configs
cp -r /usr/lib/hadoop-hdfs /tmp/hadoop-binaries-configs
cp -r /usr/lib/hadoop-lzo /tmp/hadoop-binaries-configs
cp -r /usr/lib/spark /tmp/hadoop-binaries-configs
cp -r /usr/share/aws /tmp/hadoop-binaries-configs
cp -r /usr/share/java /tmp/hadoop-binaries-configs
#cp -r /tmp/krb/ /etc/

cd /tmp/hadoop-binaries-configs/configs/hadoop/conf/
sed -i '$ d'  hdfs-site.xml
echo "<property>" >> hdfs-site.xml
echo "<name>dfs.client.use.datanode.hostname</name>" >> hdfs-site.xml
echo "<value>true</value>" >> hdfs-site.xml
echo "</property>" >> hdfs-site.xml
echo "</configuration>" >> hdfs-site.xml

cd /tmp
tar -zcf hadoop-binaries-configs.tar.gz hadoop-binaries-configs
cd ~
mv /tmp/hadoop-binaries-configs.tar.gz www/
mv /etc/krb5.com www/
cd www

nohup /usr/bin/python3 -m http.server &