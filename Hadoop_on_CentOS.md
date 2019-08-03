# Hadoop-on-CentOS
文档中所有安装包均已提前下载，一切CentOS系统内操作都在root用户下进行

## 准备工作
### 安装JAVA并配置环境  
提前准备好 JDK1.8 的安装包并进行安装  

- 在根目录下新建soft文件夹用来存放安装包  
```
# mkdir -p /soft
```
- 把安装包从所在路径`~/Desktop`移到上一步新建的文件夹中  
```
# cd ~/Desktop
# mv jdk-8u60-linux-x64.tar.gz /soft
```
- 安装  
   - 将安装包解压至`/usr/local`路径下
   ```
   # tar -xzf jdk-8u60-linux-x64.tar.gz -C /usr/local
   ```
   - 将安装文件夹改名为`jdk8`
   ```
   # cd /usr/local
   # mv jdk1.8.0_60/ jdk8
   ```
- 配置JAVA环境变量
   - 打开`/etc/profile`文件进行编辑
   ```
   # vim /etc/profile
   ```
   - 通过键盘按键`i`进入编辑模式，在文件末尾添加
   ```
   export JAVA_HOME=/usr/local/jdk8
   export CLASSPATH=$JAVA_HOME/lib:.
   export PATH=$JAVA_HOME/bin:.:$PATH
   ```
   - 编辑结束后，通过键盘按键`esc`退出编辑模式，输入`:wq`保存并退出  
   - 使环境变量立即生效（或通过重启虚拟机使之生效）
   ```
   # . /etc/profile
   ```
   - 检查环境变量是否配置完成
   ```
   # which java
   /usr/local/jdk8/bin/java
   ```
   - 查看java进程，要求不报错
   ```
   # jps
   ```
### 安装hadoop并配置环境
提前准备好 hadoop2.7.3 的安装包并进行安装  

- 把安装包从所在路径`~/Desktop`移到上一步新建的文件夹中  
```
# cd ~/Desktop
# mv hadoop-2.7.3.tar.gz /soft
```
- 安装  
   - 将安装包解压至`/usr/local`路径下
   ```
   # tar -xzf hadoop-2.7.3.tar.gz -C /usr/local
   ```
   - 将安装文件夹改名为`hadoop`
   ```
   # cd /usr/local
   # mv hadoop-2.7.3/ hadoop
   ```
- 配置hadoop环境变量
   - 打开`/etc/profile`文件进行编辑
   ```
   # vim /etc/profile
   ```
   - 通过键盘按键`i`进入编辑模式，将文件末尾修改为
   ```
   export JAVA_HOME=/usr/local/jdk8
   export CLASSPATH=$JAVA_HOME/lib:.
   export HADOOP_HOME=/usr/local/hadoop
   export PATH=$JAVA_HOME/bin:.:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH
   ```
   - 编辑结束后，通过键盘按键`esc`退出编辑模式，输入`:wq`保存并退出  
   - 使环境变量立即生效（或通过重启虚拟机使之生效）
   ```
   # . /etc/profile
   ```
   - 检查环境变量是否配置完成
   ```
   # which hadoop
   /usr/local/hadoop/bin/hadoop
   ```
- 检查hadoop配置文件中的java路径是否存在
```
# vim /usr/local/hadoop/etc/hadoop/hadoop-env.sh
```
如显示有`export JAVA_HOME=/usr/local/jdk8`则没有问题，否则需要添加

### Hadoop单机配置
Hadoop 默认模式为非分布式模式，无需进行其他配置即可运行，此处运行一个实例

- 创建测试目录
```
# mkdir -p /bigdata/test1
```
- 在该目录下创建三个测试文件
```
# cd /bigdata/test1
# echo "java python java linux" >> data1.txt
# echo "java linux oracle" >> data2.txt
# echo "linux mysql python" >> data3.txt
```
- 统计文件中单词个数，并存入文件夹`test2`中
```
# hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar wordcount /bigdata/test1/ /bigdata/test2
```
- 检查结果
```
# cd /bigdata/test2
# cat part-r-00000
java	1
linux	2
mysql	1
pwd	1
python	1
unix	1
windows	1
```

### Hadoop伪分布式配置

- 设置ssh免密登录
   - 生成秘钥，过程中需要输入的地方都按回车键
   ```
   # ssh-keygen -t rsa
   ```
   - 生成授权文件，加载生成的秘钥
   ```
   # ssh-copy-id root@localhost
   ```
   - 测试授权是否成功，如不需要输入密码即证明成功
   ```
   # ssh localhost date
   Fri Aug  2 19:58:20 CST 2019
   ```
- 修改核心站点配置文件
   - 用`vim`打开核心站点配置文件
   ```
   # vim /usr/local/hadoop/etc/hadoop/core-site.xml
   ```
   - 把
   ```
    <configuration>
    </configuration>
   ```
   修改为
   ```
   <configuration>
      <property>
         <name>fs.defaultFS</name>
         <value>hdfs://localhost:9000</value>
      </property>
   </configuration>
   ```
- 修改分布式站点配置文件
   - 用`vim`打开分布式站点配置文件
   ```
   # vim /usr/local/hadoop/etc/hadoop/hdfs-site.xml
   ```
   - 把
   ```
    <configuration>
    </configuration>
   ```
   修改为
   ```
   <configuration>
      <property>
         <name>dfs.replication</name>
         <value>1</value>
      </property>
   </configuration>
   ```
- 配置完成后，执行NameNode的格式化
```
# hdfs namenode -format
```
如配置成功，会在命令窗口中看到`successfully formatted`和`Exitting with status 0`的提示

- 开启NameNode和DataNode进程
```
# start-dfs.sh
```
若出现如下 SSH 的提示 “Are you sure you want to continue connecting”，输入 yes 即可。

- 启动后命令`jps`查看进程，查看是否启动成功，如成功会显示：
```
# jps
20304 Jps
20019 DataNode
20180 SecondaryNameNode
19898 NameNode
```
成功启动后，可以访问 Web 界面 http://localhost:50070 查看 NameNode 和 Datanode 信息，还可以在线查看 HDFS 中的文件。
或通过以下命令查看端口情况
```
# lsof -i:9000
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
java    19898 root  201u  IPv4  83229      0t0  TCP localhost:cslistener (LISTEN)
java    19898 root  211u  IPv4  84337      0t0  TCP localhost:cslistener->localhost:42352 (ESTABLISHED)
java    20019 root  224u  IPv4  84335      0t0  TCP localhost:42352->localhost:cslistener (ESTABLISHED)

# lsof -i:50070
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
java    19898 root  183u  IPv4  83213      0t0  TCP *:50070 (LISTEN)
```
- 停止进程
```
# stop-dfs.sh
```

### 启动YARN
- 修改配置文件 mapred-site.xml，需要先复制文件再进行修改
```
# cd /usr/local/hadoop/etc/hadoop/
# cp mapred-site.xml.template mapred-site.xml
# vim mapred-site.xml
```
把
```
<configuration>
</configuration>
```
修改为
```
<configuration>
   <property>
      <name>mapreduce.framework.name</name>
      <value>yarn</value>
   </property>
</configuration>
```

- 修改配置文件 yarn-site.xml，在同一路径下进行操作
```
# vim yarn-site.xml
```
把
```
<configuration>
</configuration>
```
修改为
```
<configuration>
   <property>
      <name>yarn.nodemanager.aux-services</name>
      <value>mapreduce_shuffle</value>
   </property>
</configuration>
```
- 启动YARN
```
# start-dfs.sh
# start-yarn.sh
```
同样可以通过`jps`命令查看进程：
```
# jps
21154 DataNode
21650 NodeManager
21029 NameNode
21320 SecondaryNameNode
21786 Jps
21471 ResourceManager
```
可以看到比未开启YARN的时候多出了`NodeManager`和`ResourceManager`进程，这是因为YARN的作用正是负责资源管理与任务调度。
也可以通过 Web 界面查看任务的运行情况：http://localhost:8088/

- 停止进程
```
# stop-yarn.sh
# stop-dfs.sh
```
