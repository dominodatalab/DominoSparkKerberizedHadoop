export SPARK_CONF_DIR=$SPARK_CONF_DIR_REMOTE
export SPARK_HOME=$SPARK_HOME_REMOTE
PATH=$SPARK_HOME/bin:$PATH
hdfs dfs -rmr /user/dominospark/mypi/
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
$SPARK_HOME/bin/spark-submit --master yarn --deploy-mode cluster ../python/calcpi.py /user/dominospark/mypi/
