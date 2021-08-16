export SPARK_CONF_DIR=/etc/spark/conf
export SPARK_HOME=/usr/lib/spark


#PATH=$HADOOP_HOME/bin:$HADOOP_HDFS_HOME/bin:$SPARK_HOME/bin:$PATH
#hdfs dfs -rmr /user/dominospark/mypi/


export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
#$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster ../python/calcpi.py #../python/generate_data_in_hdfs.py hdfs://10.0.1.76:8020 /user/dominospark/largedata/
$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster $@
