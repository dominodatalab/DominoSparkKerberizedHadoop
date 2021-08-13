#Domino Spark Integration Notebooks

##Workspace which connects to and EMR cluster

1. Run notebook test-local-spark-kerb-hdfs.ipynb (To test connectivity from local spark to kerberized hdfs)
2. Run notebook test-emr-spark-client-mode.ipynb (To test connectivity from spark in client mode and kerberized yarn)
3. Run notebook test-emr-spark-client-mode-calc-pi.ipynb (To test connectivity from spark in client mode and kerberized yarn)
4. Open a terminal and run the following commands to test running spark code on kerberized yarn in cluster mode

%cd /mnt/code/scripts
%hdfs dfs -rmr /user/dominospark/mypi
% ./run-pyspark-on-emr-server-mode.sh ../python/calcpi.py hdfs://10.0.123.114:8020 /user/dominospark/mypi



##Workspace which connects to and On Demand cluster
Run notebooks:
1. test_on_demand_spark.ipynb (Calculate Pi)
2. test-local-spark-kerb-hdfs-data-creation.ipynb (First create data on the hdfs cluster using local mode)
3. test_on_demand_spark_kerb_hdfs.ipynb (Write to HDFS using EMR cluster mode and copy into dataset and process)

##Scripts from on demand spark to run on yarn in cluster mode
cd /mnt/code/scripts
./generate-data-emr.sh 10 hdfs://10.0.1.76:8020 /user/dominospark/ld-10/ 
./filter-data-emr.sh 5 hdfs://10.0.1.76:8020 /user/dominospark/ld-10/ /user/dominospark/sd-5/