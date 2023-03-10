ARG TRINO_VERSION
FROM trinodb/trino:$TRINO_VERSION

ARG VERSION

RUN rm -rf /usr/lib/trino/plugin/{accumulo,atop,bigquery,blackhole,cassandra,clickhouse,delta-lake,druid,elasticsearch,example-http,geospatial,google-sheets,hive,http-event-listener,iceberg,kafka,kinesis,kudu,local-file,memsql,ml,mongodb,mysql,oracle,password-authenticators,phoenix,phoenix5,pinot,postgresql,prometheus,raptor-legacy,redis,redshift,resource-group-managers,session-property-managers,sqlserver,teradata-functions,thrift,tpcds,tpch} \
    rm -rf /etc/trino/catalog/{tpcds,tpch}.properties \
    && ls -la /usr/lib/trino/plugin

ADD target/trino-venice-$VERSION/ /usr/lib/trino/plugin/venice/
ADD catalog/venice.properties /etc/trino/catalog/venice.properties
