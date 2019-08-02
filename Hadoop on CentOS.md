# hadoop-on-CentOS
文档中所有安装包均已提前下载，一切CentOS系统内操作都在root用户下进行

## 下载并安装VMware

## 使用镜像文件在VMware上开启虚拟机（CentOS7）

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
