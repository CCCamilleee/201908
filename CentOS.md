# 在windows上安装VMware并建立CentOS虚拟机

## 安装VMware

## 使用镜像文件在VMware上开启虚拟机（CentOS7）

- 创建新的虚拟机
  ![创建新的虚拟机](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E6%96%B0%E5%BB%BA%E8%99%9A%E6%8B%9F%E6%9C%BA.png)

- 选择虚拟机硬件兼容性--Workstation 15.x
  ![选择虚拟机硬件兼容性](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E9%80%89%E6%8B%A9%E8%99%9A%E6%8B%9F%E6%9C%BA%E7%A1%AC%E4%BB%B6%E5%85%BC%E5%AE%B9%E6%80%A7.png)

- 选择稍后安装操作系统
  ![选择稍后安装操作系统](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E7%A8%8D%E5%90%8E%E5%AE%89%E8%A3%85%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F.png)

- 选择客户机操作系统--客户机操作系统: Linux(L), 版本: CentOS 7 64 位
  ![选择客户机操作系统](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E9%80%89%E6%8B%A9%E5%AE%A2%E6%88%B7%E6%9C%BA%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F.png)

- 命名虚拟机--虚拟机名称: centos,选择位置
  ![命名虚拟机](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%91%BD%E5%90%8D%E8%99%9A%E6%8B%9F%E6%9C%BA.png)

- 处理器配置--处理器数量:1, 每个处理器内核数:1
  ![处理器配置](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%A4%84%E7%90%86%E5%99%A8%E9%85%8D%E7%BD%AE.png)

- 虚拟机的内存--2GB
  ![内存设置](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E8%99%9A%E6%8B%9F%E6%9C%BA%E5%86%85%E5%AD%98.png)

- 网络类型选择--使用网络地址转换(NAT)
  ![网络类型选择](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E7%BD%91%E7%BB%9C%E7%B1%BB%E5%9E%8B.png)
  
- 选择I/O 控制器类型--SCSI控制机: LSI Logic(L)
  ![选择I/O 控制器类型](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/IO%E6%8E%A7%E5%88%B6%E5%99%A8%E7%B1%BB%E5%9E%8B.png)

- 选择磁盘类型--虚拟磁盘类型: SCSI(S)
  ![选择磁盘类型](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E7%A3%81%E7%9B%98%E7%B1%BB%E5%9E%8B.png)

- 选择磁盘--创建新虚拟磁盘(V)
  ![选择磁盘](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E9%80%89%E6%8B%A9%E7%A3%81%E7%9B%98.png)

- 指定磁盘容量--最大磁盘:200 GB; 将虚拟磁盘拆分成多个文件(M)
  ![指定磁盘容量](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E6%8C%87%E5%AE%9A%E7%A3%81%E7%9B%98%E5%AE%B9%E9%87%8F.png)

- 指定磁盘文件--centos.vmdk
  ![指定磁盘文件](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E6%8C%87%E5%AE%9A%E7%A3%81%E7%9B%98%E6%96%87%E4%BB%B6.png)

- 准备好创建虚拟机--完成
  ![准备好创建虚拟机](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%87%86%E5%A4%87%E5%B7%A5%E4%BD%9C%E5%AE%8C%E6%88%90.png)

- 将CD/DVD(IDE) 设置为自动检测
  ![将CD/DVD(IDE) 设置为自动检测](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/CD%E8%AE%BE%E7%BD%AE.png)

- 选择使用ISO映像文件进行CentOS的安装
  ![选择使用镜像文件进行安装](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E9%80%89%E5%9C%A8ISO%E6%98%A0%E5%83%8F.png)

- 开启虚拟机
  ![开启虚拟机](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%BC%80%E5%90%AF%E8%99%9A%E6%8B%9F%E6%9C%BA.png)

- CentOS 7 语言设置--选择中文-简体中文
  ![语言设置](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E8%AE%BE%E7%BD%AE%E8%AF%AD%E8%A8%80.png)

- 选择安装目标位置--VMware,VMware Virtual S
  ![选择安装目标位置](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/centos%E5%AE%89%E8%A3%85%E4%BD%8D%E7%BD%AE.png)

- 软件选择--基本环境: GNOME桌面
  ![软件选择](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E8%BD%AF%E4%BB%B6%E9%80%89%E6%8B%A9.png)

- 检查安装信息摘要--确认无误，开始安装
  ![检查安装信息摘要](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%AE%89%E8%A3%85%E4%BF%A1%E6%81%AF%E6%91%98%E8%A6%81.png)

- 安装过程中进行用户设置--创建用户,ROOT密码设置
  ![进行用户设置](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%88%9B%E5%BB%BA%E7%94%A8%E6%88%B7%E5%92%8Croot.png)

- CentOS 7 安装完成
  ![安装完成](https://github.com/CCCamilleee/201908/blob/master/img/create_vm/%E5%AE%8C%E6%88%90%E5%AE%89%E8%A3%85%E9%87%8D%E5%90%AF.png)
