# Web server on Centos

## 安装Apache
  ```
  # yum -y install httpd
  ```
## 开启web服务
  ```
  # systemctl start httpd
  ```
## 实现echarts实例   
  - 从 https://echarts.baidu.com/tutorial.html#5%20%E5%88%86%E9%92%9F%E4%B8%8A%E6%89%8B%20ECharts 复制第一个实例代码保存到本地文件中
    ```
    # cd /var/www/html/
    # vim echarts1.html
    ```
  - 从 https://cdnjs.com/libraries/echarts 下载echarts.min.js文件到`/soft`，并复制到`/var/www/html`路径下
    ```
    # cp -rfp /soft/echarts.min.js /var/www/html/
    ```
    也可以下载本项目`soft`文件夹中的`echarts-all.html`文件，但需要修改实例代码。
    ```
    # vim echarts1.html
    ```
    把`<head>`标签中`<script>`标签下的`src="echarts.min.js"`改为`src="echarts-all.js"`
    
  - 查看实例运行结果
    打开网页 http://localhost/echarts1.html ，可以看到如下运行结果图
    ![echarts实例]()

```
# chmod 644 echarts-all.js
```

```
# systemctl stop NetworkManager
# systemctl disable NetworkManager
Removed symlink /etc/systemd/system/multi-user.target.wants/NetworkManager.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service.
Removed symlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service.
Removed symlink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service.
```
