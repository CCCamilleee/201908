# MySQL on CentOS
目前 CentOS 下默认支持的数据库是 MariaDB，MariaDB 是 MySQL 的增强版本，由于 MySQL 被 Oracle 收购，Mysql 的开发者担心 MySQL 会变成闭源软件，因此开发了这个数据库版本。MariaDB 支持 MySQL 的所有功能，还增加了一些 MySQL 没有的功能。
## 准备工作
### 打开网络连接
- 查看网络连接是否打开
  虚拟机的默认网络连接是关闭的，在命令窗口中输入以下命令，网卡`ens33`只会显示 MAC 地址而没有 ip 地址
  ```
  # ifconfig
  ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 00:0c:29:d3:8d:c7  txqueuelen 1000  (Ethernet)
        RX packets 601  bytes 731599 (714.4 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 296  bytes 28708 (28.0 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
  ```
- 开启网络连接
  - 打开网络配置文件
  ```
  # cd /etc/sysconfig/network-scripts/
  # vim ifcfg-ens33
  ```
  - 修改网络配置
  确认`BOOTPROTO=dhcp`并把`ONBOOT=no`改为`ONBOOT=yes`
  
  - 通过以下命令重启网络
  ```
  # service network restart
  ```
  - 重新查看网络连接是否打开
    发现网卡`ens33`显示 ip 地址
    ```
    # ifconfig
    ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.16.215.128  netmask 255.255.255.0  broadcast 172.16.215.255
        inet6 fe80::bd1d:f4b1:ba7e:63ff  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:d3:8d:c7  txqueuelen 1000  (Ethernet)
        RX packets 89  bytes 18919 (18.4 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 116  bytes 13311 (12.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
    ```
