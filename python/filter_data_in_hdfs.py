from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField, StringType, DoubleType, IntegerType
import random
import sys
filter_criteria=int(sys.argv[1])
hdfs_endpoint = sys.argv[2] #hdfs://10.0.1.76:8020
hdfs_src_path = sys.argv[3]
hdfs_dest_path = sys.argv[4]
sparkSession = SparkSession.builder.appName("Generate Data") \
.config("spark.dynamicAllocation.enabled", "false") \
.config("fs.default.name", hdfs_endpoint) \
.getOrCreate()
sc=sparkSession.sparkContext

columns = StructType([ StructField("id", IntegerType(), True),
                       StructField("v1", IntegerType(), True),
                       StructField("v2", IntegerType(), True),
                       StructField("v3", IntegerType(), True) ])

df_load = sparkSession.read.csv(hdfs_src_path,columns)
df_load.where(df_load.id < filter_criteria).show()
df_load.write.csv(hdfs_dest_path)
sc.stop()
