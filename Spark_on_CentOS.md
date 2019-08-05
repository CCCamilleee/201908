# Spark on CentOS

## 安装Spark

- 把安装包从当前目录`～/Desktop`放到`/soft`目录下
  ```
  # mv ~/Desktop/spark-2.2.0-bin-hadoop2.7.tgz /soft
  ```
  
- 解压并修改名称
  ```
  # cd /soft
  # tar -xzf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local/
  # cd /usr/local
  # mv spark-2.2.0-bin-hadoop2.7/ spark
  ```

- 把配置模板拷贝为正式文件
    ```
    # cd /usr/local/spark/conf/
    # cp spark-env.sh.template spark-env.sh
    # cp slaves.template slaves
    # cp spark-defaults.conf.template spark-defaults.conf
    # cp log4j.properties.template log4j.properties
    ```
- 修改配置文件
  - 修改`spark-env.sh`
    ```
    # vim spark-env.sh
    ```
    在文件中添加java路径：`JAVA_HOME=/usr/local/jdk8`
    
  - 查看`spark-defaults.conf`
  
  - 查看`slaves`
    当集群为本机自身时不需要修改。如果有多台机器组成集群则需要把所有的机器都添加到该文件中。
    
## 启动Spark
只在本机运行，本机既是`master`节点，又是工作节点
```
# /usr/local/spark/sbin/start-all.sh
starting org.apache.spark.deploy.master.Master, logging to /usr/local/spark/logs/spark-root-org.apache.spark.deploy.master.Master-1-localhost.out
localhost: starting org.apache.spark.deploy.worker.Worker, logging to /usr/local/spark/logs/spark-root-org.apache.spark.deploy.worker.Worker-1-localhost.out
# jps
21185 Jps
18850 SecondaryNameNode
19126 NodeManager
19032 ResourceManager
18556 NameNode
21117 Worker
18655 DataNode
21039 Master
```

## 修改环境变量

- 打开环境变量文件
  ```
  # vim /etc/profile
  ```
- 添加环境变量：`export SPARK_HOME=/usr/local/spark`   
  在`export PATH=$JAVA_HOME/bin:.:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH`中添加两条路径，变为：   
  `export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$JAVA_HOME/bin:.:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH`

- 使修改的环境变量立刻生效
  ```
  # . /etc/profile
  ```

## 运行检验修改的环境变量

```
# spark-shell
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
19/08/05 08:58:28 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
19/08/05 08:58:28 WARN Utils: Your hostname, localhost resolves to a loopback address: 127.0.0.1; using 172.16.215.128 instead (on interface ens33)
19/08/05 08:58:28 WARN Utils: Set SPARK_LOCAL_IP if you need to bind to another address
19/08/05 08:58:38 WARN ObjectStore: Version information not found in metastore. hive.metastore.schema.verification is not enabled so recording the schema version 1.2.0
19/08/05 08:58:39 WARN ObjectStore: Failed to get database default, returning NoSuchObjectException
19/08/05 08:58:39 WARN ObjectStore: Failed to get database global_temp, returning NoSuchObjectException
Spark context Web UI available at http://172.16.215.128:4040
Spark context available as 'sc' (master = local[*], app id = local-1564966709515).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.2.0
      /_/
         
Using Scala version 2.11.8 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_60)
Type in expressions to have them evaluated.
Type :help for more information.

scala> 
```
在新的命令窗口中查看进程
```
# jps
18850 SecondaryNameNode
19126 NodeManager
19032 ResourceManager
21771 SparkSubmit
18556 NameNode
21117 Worker
18655 DataNode
21039 Master
21919 Jps
```

## 安装工具 sqoop

- 把安装包从当前目录`～/Desktop`放到`/soft`目录下
  ```
  mv sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz /soft
  ```
- 解压并修改名称
  ```
  # cd /soft
  # tar -xzf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz -C /usr/local/
  # cd /usr/local
  # mv sqoop-1.4.7.bin__hadoop-2.6.0/ sqoop
  ```
- 把配置模板拷贝为真实文件
  ```
  # cd sqoop/conf
  # cp sqoop-env-template.sh sqoop-env.sh
  ```
- 修改配置文件
  ```
  # vim sqoop-env.sh
  ```
  添加`JAVA_HOME=/usr/local/jdk8`   
  修改23行的`#export HADOOP_COMMON_HOME`为`export HADOOP_COMMON_HOME=/usr/local/hadoop`   
  修改26行的`#export HADOOP_MAPRED_HOME`为`export HADOOP_MAPRED_HOME=/usr/local/hadoop/share/hadoop/mapreduce`
  
#### 修改环境变量
- 打开环境变量文件
  ```
  vim /etc/profile
  ```
- 添加：`export SQOOP_HOME=/usr/local/sqoop`   
  在最后一行的路径中添加：`$SQOOP_HOME/bin:`，改为：`export PATH=$SQOOP_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$JAVA_HOME/bin:.:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH`

- 使修改的环境变量立刻生效
  ```
  # . /etc/profile
  ```
- 查看修改的变量是否生效
  ```
  # sqoop help
  // warning 太长就不贴了
  Available commands:
  codegen            Generate code to interact with database records
  create-hive-table  Import a table definition into Hive
  eval               Evaluate a SQL statement and display the results
  export             Export an HDFS directory to a database table
  help               List available commands
  import             Import a table from a database to HDFS
  import-all-tables  Import tables from a database to HDFS
  import-mainframe   Import datasets from a mainframe server to HDFS
  job                Work with saved jobs
  list-databases     List available databases on a server
  list-tables        List available tables in a database
  merge              Merge results of incremental imports
  metastore          Run a standalone Sqoop metastore
  version            Display version information

  See 'sqoop help COMMAND' for information on a specific command.
  ```

## 安装sqoop与数据库的连接工具

- 把安装包从当前目录`～/Desktop`放到`/soft`目录下
  ```
  # mv ~/Desktop/mysql-connector-java-5.1.7-bin.jar /soft
  ```
- 安装工具到 sqoop 库目录下
  ```
  # cd /soft
  # cp /soft/mysql-connector-java-5.1.7-bin.jar /usr/local/sqoop/lib/
  ```
- 检查安装
  ```
  # sqoop list-databases --connect jdbc:mysql://localhost:3306 --username root --password root123
  // warning 太长就不贴了
  19/08/05 10:09:51 INFO sqoop.Sqoop: Running Sqoop version: 1.4.7
  19/08/05 10:09:51 WARN tool.BaseSqoopTool: Setting your password on the command-line is insecure. Consider using -P instead.
  19/08/05 10:09:51 INFO manager.MySQLManager: Preparing to use a MySQL streaming resultset.
  information_schema
  mysql
  openstack
  performance_schema
  pythondb

  ```


