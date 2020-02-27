FROM gitpod/workspace-mysql



USER root
# Install custom tools, runtime, etc.


RUN apt-get update && apt-get install -y \
        git-flow \
	graphviz \
	&& apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
	
RUN sudo apt-get install cloudera-manager-agent cloudera-manager-daemons
RUN sudo systemctl start cloudera-scm-agent
RUN sleep 90
RUN sudo apt-get install avro-tools bigtop-jsvc bigtop-utils flume-ng hadoop-hdfs-fuse hadoop-hdfs-nfs3 hadoop-httpfs hadoop-kms hbase hbase-solr hive-hbase hive-webhcat hue impala impala-shell kafka kite keytrustee-keyprovider kudu oozie parquet parquet-format pig search sentry sentry-hdfs-plugin solr solr-crunch solr-mapreduce spark-core spark-python sqoop zookeeper
	
	
#RUN wget -qO - https://packages.confluent.io/deb/4.0/archive.key | sudo apt-key add -
#RUN sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/4.0 stable main"
#RUN sudo apt-get update && sudo apt-get install -y confluent-platform-oss-2.11
	

USER gitpod
# Apply user-specific settings
	RUN bash -c "npm install -g generator-jhipster \
	&& npm install -g @angular/cli" 
	
 	

# Give back control
USER root
