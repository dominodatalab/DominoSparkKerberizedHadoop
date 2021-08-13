#Name WORKSPACE PYSPARK PY3_7 EMR 6.3.0 ONDEMAND AND LOCAL
#Base Env - BASE PySpark Workspace Python 3.7 Hadoop 3.2.1 Spark 3.1.1
ENV HADOOP_YARN_HOME=/usr/lib/hadoop
ENV HADOOP_MAPRED_HOME=/usr/lib/hadoop
#ENV HADOOP_CONF_DIR=/etc/hadoop/conf

ENV HDFS_HOME=/usr/lib/hadoop-hdfs
ENV HDFS_CONF_DIR=/etc/hadoop

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
ENV SPARK_HOME=/opt/sparka
ENV SPARK_CONF_DIR=/opt/spark/conf
ENV SPARK_HOME_EMR=/usr/lib/spark
ENV SPARK_CONF_DIR_EMR=/etc/spark/conf
RUN \
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /home/ubuntu/.domino-defaults && \
#echo 'export HADOOP_HOME=/usr/lib/hadoop' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_YARN=/usr/lib/hadoop' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_HDFS_HOME=/usr/lib/hadoop-hdfs' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_MAPRED_HOME=/usr/lib/hadoop' >> /home/ubuntu/.domino-defaults && \
#echo 'export PYTHONPATH=${PYTHONPATH:-}:${SPARK_HOME_REMOTE:-}/python/' >> /home/ubuntu/.domino-defaults && \
echo 'export PYTHONPATH=${PYTHONPATH:-}:${SPARK_HOME:-}/python/lib/py4j-0.10.7-src.zip' >> /home/ubuntu/.domino-defaults && \
echo 'export PYTHONPATH=${PYTHONPATH:-}:${SPARK_HOME:-}/python/' >> /home/ubuntu/.domino-defaults && \
echo 'export PYTHONPATH_EMR=${PYTHONPATH:-}:${SPARK_HOME_EMR:-}/python/lib/py4j-0.10.7-src.zip' >> /home/ubuntu/.domino-defaults && \
echo 'export PATH=${PATH:-}:${HDFS_HOME:-}/bin' >> /home/ubuntu/.domino-defaults && \
echo 'export PATH=${PATH:-}:${HADOOP_HOME:-}/bin' >> /home/ubuntu/.domino-defaults && \
echo 'export PATH=${PATH:-}:${SPARK_HOME:-}/bin' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_CONF_DIR=/etc/hadoop/conf' >> /home/ubuntu/.domino-defaults
RUN chmod -R 777 $SPARK_HOME/conf
RUN pip install py4j && pip install findspark