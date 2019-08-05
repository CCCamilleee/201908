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
