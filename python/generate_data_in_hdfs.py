from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField, StringType, DoubleType,IntegerType
import random
import sys

def main(args):
    cnt=int(args[0])
    hdfs_endpoint = args[1] #hdfs://10.0.1.76:8020
    hdfs_path = args[2]
    master='yarn'
    if(len(args)>3):
        master = args[3]

    sparkSession = SparkSession.builder.appName("Generate Data") \
    .master(master) \
    .config("spark.dynamicAllocation.enabled", "false") \
    .config("fs.default.name", hdfs_endpoint) \
    .getOrCreate()

  
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
    sparkSession.stop()
if __name__ == '__main__':
    import sys
    main(sys.argv[1:])