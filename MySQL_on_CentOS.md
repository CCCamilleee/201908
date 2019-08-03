# MySQL on CentOS
目前 CentOS 下默认支持的数据库是 MariaDB，MariaDB 是 MySQL 的增强版本，由于 MySQL 被 Oracle 收购，Mysql 的开发者担心 MySQL 会变成闭源软件，因此开发了这个数据库版本。MariaDB 支持 MySQL 的所有功能，还增加了一些 MySQL 没有的功能。   
这个文档列出了在CentOS上安装数据库并进行配置的步骤。
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
  
  - 通过以下命令重启网络并启用网卡
  ```
  # service network restart
  # ifup ens33
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
  - `ping`百度检查网络连接
    ```
    # ping -c 4 www.baidu.com
    PING www.a.shifen.com (61.135.169.125) 56(84) bytes of data.
    64 bytes from 61.135.169.125 (61.135.169.125): icmp_seq=1 ttl=128 time=49.3 ms
    64 bytes from 61.135.169.125 (61.135.169.125): icmp_seq=2 ttl=128 time=120 ms
    64 bytes from 61.135.169.125 (61.135.169.125): icmp_seq=3 ttl=128 time=36.8 ms
    64 bytes from 61.135.169.125 (61.135.169.125): icmp_seq=4 ttl=128 time=118 ms

    --- www.a.shifen.com ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3005ms
    rtt min/avg/max/mdev = 36.803/81.235/120.280/38.441 ms
    ```
- 关闭防火墙
  - 防火墙1
    ```
    # systemctl stop firewalld //临时关闭防火墙
    # systemctl disable firewalld //永久关闭防火墙
    Removed symlink /etc/systemd/system/multi-user.target.wants/firewalld.service.
    Removed symlink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service.
    ```
  - 防火墙2
    ```
    # iptables -t filter -F
    # iptables -t nat -F
    # iptables -t mangle -F
    ```
  - 防火墙3
    ```
    # setenforce 0
    # vim /etc/sysconfig/selinux
    ```
    把`SELINUX=enforcing`改为`SELINUX=disable`
