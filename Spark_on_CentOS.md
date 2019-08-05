# Spark on CentOS

## 安装Spark

- 把安装包从当前目录`～/Desktop`放到`/soft`目录下
  ```
  # mv ~/Desktop/spark-2.2.0-bin-hadoop2.7.tgz /soft
  ```
  
- 解压并修改名称
  ```
  # tar -xzf spark-2.2.0-bin-hadoop2.7.tgz -C /usr/local/
  # cd /usr/local
  # mv spark-2.2.0-bin-hadoop2.7/ spark
  ```

- 把配置模板拷贝为真实文件
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
```


    
