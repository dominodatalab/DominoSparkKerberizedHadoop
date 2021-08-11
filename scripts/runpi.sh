hdfs dfs -rmr /user/dominospark/mypi/
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
spark-submit --master yarn --deploy-mode cluster ../python/calcpi.py /user/dominospark/mypi/
