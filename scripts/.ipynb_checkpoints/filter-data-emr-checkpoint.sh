export SPARK_CONF_DIR=$SPARK_CONF_DIR_EMR
export SPARK_HOME=$SPARK_HOME_EMR


#PATH=$HADOOP_HOME/bin:$HADOOP_HDFS_HOME/bin:$SPARK_HOME/bin:$PATH
#hdfs dfs -rmr /user/dominospark/mypi/

/mnt/code/scripts/my_hdfs.sh dfs -rmr $4
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
#$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster ../python/calcpi.py #../python/generate_data_in_hdfs.py hdfs://10.0.1.76:8020 /user/dominospark/largedata/
$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster ../python/filter_data_in_hdfs.py $1 $2 $3 $4
