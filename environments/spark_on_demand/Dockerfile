#Name Dockerfile
#Base Env - bitnami/spark:3.1.1
ENV HADOOP_VERSION=3.2.1
ENV HADOOP_HOME=/opt/bitnami/hadoop
ENV HADOOP_CONF_DIR=/opt/bitnami/hadoop/etc/hadoop
ENV SPARK_VERSION=3.1.1
ENV SPARK_HOME=/opt/bitnami/spark

USER root
RUN apt-get update && apt-get install -y wget && rm -r /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /opt/bitnami
RUN rm -rf /opt/bitnami/spark

RUN wget -q http://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz && \
         tar -xf hadoop-$HADOOP_VERSION.tar.gz && \
         rm hadoop-$HADOOP_VERSION.tar.gz && \
         mv hadoop-$HADOOP_VERSION /opt/bitnami/hadoop

# Add Spark Without Hadoop
RUN wget -q https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-without-hadoop.tgz && \
         tar -xf spark-$SPARK_VERSION-bin-without-hadoop.tgz && \
         rm spark-$SPARK_VERSION-bin-without-hadoop.tgz && \
         mv spark-$SPARK_VERSION-bin-without-hadoop /opt/bitnami/spark && \
         chmod -R 777 /opt/bitnami/spark/conf
RUN wget --quiet -P $SPARK_HOME/jars https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.3.0/hadoop-azure-3.3.0.jar

ENV PATH="$PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin"
RUN echo 'export SPARK_DIST_CLASSPATH="$(hadoop classpath):/opt/bitnami/hadoop/share/hadoop/tools/lib/*"' >> /opt/bitnami/spark/conf/spark-env.sh

WORKDIR /
RUN /opt/bitnami/scripts/spark/postunpack.sh
WORKDIR /opt/bitnami/spark
RUN wget --quiet -P $SPARK_HOME/bin https://domino-kubelet.s3-us-west-2.amazonaws.com/proxy.py
RUN install_packages python3-dev
RUN echo 'python $SPARK_HOME/bin/proxy.py &' >> /opt/bitnami/spark/conf/spark-env.sh
USER 1001