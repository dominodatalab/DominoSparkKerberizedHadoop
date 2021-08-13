#Name BASE PySpark Workspace Python 3.7 Hadoop 3.2.1 Spark 3.1.1
#Base Env - quay.io/domino/base:Ubuntu18_DAD_py3.7_r3.6_2019q4
ENV EMR_MASTER_PRIVATE_IP 10.0.123.114

ENV HADOOP_VERSION=3.2.1
ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
ENV SPARK_VERSION=3.1.1
ENV SPARK_HOME=/opt/spark

RUN wget -q https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
        tar -xf spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
        rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
        mv spark-${SPARK_VERSION}-bin-without-hadoop $SPARK_HOME && \
        chmod -R 777 $SPARK_HOME/conf

WORKDIR $SPARK_HOME/python
RUN python setup.py install
WORKDIR /

RUN wget -q http://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
         tar -xf hadoop-${HADOOP_VERSION}.tar.gz && \
         rm hadoop-${HADOOP_VERSION}.tar.gz && \
         mv hadoop-${HADOOP_VERSION} $HADOOP_HOME
RUN echo 'export PATH="$PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin"' >> $SPARK_HOME/conf/spark-env.sh        
RUN echo 'export SPARK_DIST_CLASSPATH="$(hadoop classpath):$HADOOP_HOME/share/hadoop/tools/lib/*:/usr/lib/hadoop-lzo/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*"' >> $SPARK_HOME/conf/spark-env.sh

RUN wget --quiet -P $SPARK_HOME/jars https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.3.0/hadoop-azure-3.3.0.jar   
RUN pip install spylon-kernel 
RUN python -m spylon_kernel install





USER root
RUN echo "ubuntu ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV SPARK_HOME_REMOTE=/etc/spark
ENV HADOOP_HOME_REMOTE=/usr/lib/hadoop
ENV HADOOP_YARN_HOME_REMOTE=/usr/lib/hadoop
ENV HADOOP_MAPRED_HOME_REMOTE=/usr/lib/hadoop
ENV HADOOP_CONF_DIR_REMOTE=/etc/hadoop/conf

ENV HDFS_HOME_REMOTE=/usr/lib/hadoop-hdfs
ENV HDFS_CONF_DIR_REMOTE=/etc/hadoop
RUN mkdir /tmp/domino-hadoop-downloads

RUN wget -q http://$EMR_MASTER_PRIVATE_IP:8000/hadoop-binaries-configs.tar.gz -O /tmp/domino-hadoop-downloads/hadoop-binaries-configs.tar.gz && \
    tar xzf /tmp/domino-hadoop-downloads/hadoop-binaries-configs.tar.gz -C /tmp/domino-hadoop-downloads/

RUN cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/hadoop /etc/hadoop && \
    cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/hive /etc/hive && \
    cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/spark /etc/spark 

RUN cp  /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/krb/krb5.conf /etc/

RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/aws /usr/share/aws
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/hadoop /usr/lib/hadoop
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/hadoop-hdfs /usr/lib/hadoop-hdfs
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/hadoop-lzo /usr/lib/hadoop-lzo
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/spark /usr/lib/spark
RUN cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/java/* /usr/share/java/
RUN cp /etc/hadoop/conf/*.xml $SPARK_HOME_REMOTE/conf/
#This allows connecting to EMR cluste HDFS in local mode  on ondemand spark client
RUN cp /etc/hadoop/conf/*.xml $SPARK_HOME/conf/
RUN echo ' ' >> $SPARK_HOME_REMOTE/conf/spark-env.sh    
RUN echo 'export PATH="$PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin"' >> $SPARK_HOME_REMOTE/conf/spark-env.sh        
RUN echo 'export SPARK_DIST_CLASSPATH="$($HADOOP_HOME_REMOTE/bin/hadoop classpath):$HADOOP_HOME_REMOTE/share/hadoop/tools/lib/*:/usr/lib/hadoop-lzo/lib/*"' >> $SPARK_HOME_REMOTE/conf/spark-env.sh