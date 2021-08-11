from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField, StringType, DoubleType
import random
import sys
sparkSession = SparkSession.builder.appName("Calculate Pi") \
.config("spark.dynamicAllocation.enabled", "false") \
.getOrCreate()
sc=sparkSession.sparkContext
def inside(p):
    x, y = random.random(), random.random()
    return x*x + y*y < 1

columns = StructType([ StructField("name", StringType(), True),
                      StructField("value", DoubleType(), True)
                    ])

count = sc.parallelize(range(0, 1000),1) \
             .filter(inside).count()
data = [("Pi",4.0 * count/1000)]

df = sparkSession.createDataFrame(data=data, schema=columns)


df.write.csv(sys.argv[1])
sc.stop()
