#Name WORKSPACE PYSPARK PY3_7 EMR 6.3.0 EMR AND LOCAL
#Base Env - Domino Analytics Distribution Py3.8 R4.0 2021Q2
USER root
RUN apt-get update && apt-get install -y libkrb5-dev  && apt-get install -y wget
RUN /opt/conda/bin/python -m pip install --upgrade pip
RUN pip install sparkmagic==0.19.0
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter labextension install "@jupyter-widgets/jupyterlab-manager"

ENV EMR_MASTER_PRIVATE_IP 10.0.123.114
RUN mkdir /tmp/domino-hadoop-downloads
RUN wget -q http://$EMR_MASTER_PRIVATE_IP:8000/krb5.conf  -P /tmp/domino-hadoop-downloads/
RUN wget -q http://$EMR_MASTER_PRIVATE_IP:8000/config.json  -P /tmp/domino-hadoop-downloads/

RUN cp /tmp/domino-hadoop-downloads/krb5.conf /etc/

RUN mkdir p /home/ubuntu/.sparkmagic
RUN chmod -R 777 p /home/ubuntu/.sparkmagic
RUN cp /tmp/domino-hadoop-downloads/config.json /home/ubuntu/.sparkmagic

RUN cd /opt/conda/lib/python3.8/site-packages && /opt/conda/bin/jupyter-kernelspec install sparkmagic/kernels/sparkkernel
RUN cd /opt/conda/lib/python3.8/site-packages/ && /opt/conda/bin/jupyter-kernelspec install  sparkmagic/kernels/pysparkkernel
RUN cd /opt/conda/lib/python3.8/site-packages/ && /opt/conda/bin/jupyter-kernelspec install  sparkmagic/kernels/sparkrkernel
RUN /opt/conda/bin/jupyter serverextension enable --py sparkmagic

##Install HDFS Libraries
RUN echo "ubuntu ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV HADOOP_HOME=/usr/lib/hadoop
ENV HADOOP_YARN_HOME=/usr/lib/hadoop
ENV HADOOP_MAPRED_HOME=/usr/lib/hadoop
ENV HADOOP_CONF_DIR=/etc/hadoop/conf
ENV HDFS_HOME=/usr/lib/hadoop-hdfs
ENV HDFS_CONF_DIR=/etc/hadoop



RUN wget -q http://$EMR_MASTER_PRIVATE_IP:8000/hadoop-binaries-configs.tar.gz -O /tmp/domino-hadoop-downloads/hadoop-binaries-configs.tar.gz && \
    tar xzf /tmp/domino-hadoop-downloads/hadoop-binaries-configs.tar.gz -C /tmp/domino-hadoop-downloads/

RUN cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/hadoop /etc/hadoop && \
    cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/hive /etc/hive && \
    cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/configs/spark /etc/spark

RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/aws /usr/share/aws
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/hadoop /usr/lib/hadoop
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/hadoop-hdfs /usr/lib/hadoop-hdfs
RUN mv /tmp/domino-hadoop-downloads/hadoop-binaries-configs/hadoop-lzo /usr/lib/hadoop-lzo
RUN cp -r /tmp/domino-hadoop-downloads/hadoop-binaries-configs/java/* /usr/share/java/
RUN \
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_HOME=/usr/lib/hadoop' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_YARN=/usr/lib/hadoop' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_HDFS_HOME=/usr/lib/hadoop-hdfs' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_MAPRED_HOME=/usr/lib/hadoop' >> /home/ubuntu/.domino-defaults && \
echo 'export PATH=${PATH:-}:${HDFS_HOME:-}/bin' >> /home/ubuntu/.domino-defaults && \
echo 'export PATH=${PATH:-}:${HADOOP_HOME:-}/bin' >> /home/ubuntu/.domino-defaults && \
echo 'export PATH=${PATH:-}:${SPARK_HOME:-}/bin' >> /home/ubuntu/.domino-defaults && \
echo 'export HADOOP_CONF_DIR=/etc/hadoop/conf' >> /home/ubuntu/.domino-defaults