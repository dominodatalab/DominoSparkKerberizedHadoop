from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField, StringType, DoubleType, IntegerType
import random
import sys

def main(args):
    filter_criteria=int(args[0])
    hdfs_endpoint = args[1] #hdfs://10.0.1.76:8020
    hdfs_src_path = args[2]
    hdfs_dest_path = args[3]
    master='yarn'
    if(args.length>4):
        master = args[4]
    sparkSession = SparkSession.builder.appName("Generate Data") \
    .conf("master",master)
    .config("spark.dynamicAllocation.enabled", "false") \
    .config("fs.default.name", hdfs_endpoint) \
    .getOrCreate()
    sc=sparkSession.sparkContext

    columns = StructType([ StructField("id", IntegerType(), True),
                           StructField("v1", IntegerType(), True),
                           StructField("v2", IntegerType(), True),
                           StructField("v3", IntegerType(), True) ])

    df_load = sparkSession.read.csv(hdfs_src_path,columns)
    df_load_filtered = df_load.where(df_load.id < filter_criteria)
    df_load_filtered.write.csv(hdfs_dest_path)
    sc.stop()
if __name__ == '__main__':
    import sys
    main(sys.argv[1:])

