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

- 修改配置——把模板拷贝为真实文件
  ```
  # cd /usr/local/spark/conf/
  # cp spark-env.sh.template spark-env.sh
  # cp slaves.template slaves
  # cp spark-defaults.conf.template spark-defaults.conf
  # cp log4j.properties.template log4j.properties
  ```
