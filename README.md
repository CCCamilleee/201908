# hadoop-on-CentOS
文档中所有安装包均已提前下载，一切操作在root用户下进行

## 下载并安装VMware

## 使用镜像文件在VMware上开启虚拟机（CentOS7）

## 准备工作
### 安装JAVA并配置环境  
提前准备好JDK1.8的安装包并进行安装  

- 在根目录下新建soft文件夹用来存放安装包  
`mkdir -p /soft`
- 把安装包从所在路径`~/Desktop`移到上一步新建的文件夹中  
```
cd ~/Desktop
mv jdk-8u60-linux-x64.tar.gz /soft
```
