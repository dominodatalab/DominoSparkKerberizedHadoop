from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField, StringType, DoubleType,IntegerType
import random
import sys
cnt=int(sys.argv[1])
hdfs_endpoint = sys.argv[2] #hdfs://10.0.1.76:8020
hdfs_path = sys.argv[3]
sparkSession = SparkSession.builder.appName("Generate Data") \
.config("spark.dynamicAllocation.enabled", "false") \
.config("fs.default.name", hdfs_endpoint) \
.getOrCreate()
sc=sparkSession.sparkContext
import random
#Create datasets
data = []

for i in range(cnt):
    data.append((i,random.randint(1,100),random.randint(1,100),random.randint(1,100)))

columns = StructType([ StructField("id", IntegerType(), True),
                       StructField("v1", IntegerType(), True),
                       StructField("v2", IntegerType(), True),
                       StructField("v3", IntegerType(), True) ])


df = sparkSession.createDataFrame(data=data, schema=columns)
df.write.csv(hdfs_path)
sc.stop()
