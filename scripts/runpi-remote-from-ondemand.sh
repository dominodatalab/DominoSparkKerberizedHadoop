export SPARK_CONF_DIR=$SPARK_CONF_DIR_REMOTE
export SPARK_HOME=$SPARK_HOME_REMOTE

export HADOOP_HOME=$HADOOP_HOME_REMOTE
export HADOOP_YARN_HOME=$HADOOP_YARN_HOME_REMOTE
export HADOOP_HDFS_HOME=$HADOOP_HDFS_HOME_REMOTE
export HADOOP_MAPRED_HOME=$HADOOP_HOME_REMOTE
export HADOOP_CONF_DIR=$HADOOP_CONF_DIR_REMOTE

PATH=$HADOOP_HOME/bin:$HADOOP_HDFS_HOME/bin:$SPARK_HOME/bin:$PATH
#hdfs dfs -rmr /user/dominospark/mypi/
echo $2
hdfs dfs -rmr $2
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
#$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster ../python/calcpi.py /user/dominospark/mypi/
$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster ../python/calcpi.py $1 $2 
