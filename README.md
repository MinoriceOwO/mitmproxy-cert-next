<div align="center"><img src="https://next.file.asagi.cc/static/upload/2024/04/05/15dfe9_mitmproxy_cert_next_logo.png" alt="Module Logo" width="400" /></div>
<p align="center">Trusted through magic. Trust with Magisk.</p>
<hr />

⚠️ 提示: 如果您是 Android 14 以下的 Android 用户, 您可以直接安装 MITMProxy 官方提供的 Magisk 模块。

## 💭 起因

​    在 Android 14 + 中, Google 更新了新的 CA 证书信任政策。相关更新信息可以参见[此处](https://httptoolkit.com/blog/android-14-breaks-system-certificate-installation/#the-mechanics)。这一更新使得系统 CA 证书列表不能再像以前那样直接通过修改 `/system/etc/security/cacerts` 来变更。

​    系统 CA 证书列表的来源更换至了 **/apex/com.android.conscrypt/cacerts**。也就是说, CA 证书是从系统 APEX 组件内动态加载的。而 APEX 组件具备了[数字签名验证机制](https://blog.desdelinux.net/zh-CN/%E5%9C%A8-android-14-%E4%B8%AD%EF%BC%8C%E5%8D%B3%E4%BD%BF%E6%98%AF-root-%E4%B9%9F%E4%B8%8D%E5%86%8D%E5%85%81%E8%AE%B8%E4%BF%AE%E6%94%B9%E7%B3%BB%E7%BB%9F%E8%AF%81%E4%B9%A6/), 想要直接修改的可能性甚微。

​    但好消息是, 我们依然具有 Root 权限。

## ⚙️ 原理

​    MITMProxy Cert Next 所做的就是: 在系统加载时, 先将证书添加至 System 分区下的 CA 目录, 接着直接将 `/system/etc/security/cacerts` 动态覆盖挂载至 `/apex/com.android.conscrypt/cacerts`。这样, 不需要对 APEX 组件作出任何修改, `/apex/com.android.conscrypt/cacerts` 下的内容也能和 System CA 目录的内容一致。

## ⏬ 安装

#### 1. 下载此模块

你可以直接从 [GitHub Releases](https://github.com/MinoriceOwO/mitmproxy-cert-next/releases) 中下载 ZIP 包, 或者你也可以 clone 源代码后, 重新将源代码下的 `/src` 文件夹压缩为 ZIP 格式。

最终获得的 ZIP 包的结构应该类似这样:

```File Tree
module.zip
  |- common
    |- file_contexts_image
    |- service.sh
    |- system.prop
  |- META-INF
  	|- com
  	  |- google
  		|- android
  		  |- update-binary
  		  |- updater-script
  |- system
    |- etc
      |- security
        |- cacerts
          |- c8750f0d.0
  |- customize.sh
  |- module.prop
  |- post-fs-data.sh
```

#### 2. 安装此模块

前往 Magisk Manager --> 模块, 选择 "从本地安装", 然后选中模块 ZIP 包。在弹出的对话框中点击 "确定", 随后等待模块刷入完成。

#### 3. 重启设备

刷入完成后, 点击右下角的 "重启", 等待设备重启完成。

#### 4. 开始使用

重启完成后, 解锁设备, 现在应该看到 MITMProxy 的 CA 文件在系统 CA 信任区。

## ✂️ 效果截图

<img src="https://next.file.asagi.cc/static/upload/2024/04/05/Screenshot_2024-04-05-14-38-01-14_a252b927494330cdc2c8ba3b3f952e5e.png" alt="Accessing Websites" style="zoom:20%;" /><img src="https://next.file.asagi.cc/static/upload/2024/04/05/Screenshot_2024-04-05-16-39-39-62_fc704e6b13c4fb26bf5e411f75da84f2.png" alt="Settings Page" style="zoom:19%;" />

## 🛠️ 扩展

如果想要将本模块作为模板, 用以在 Android 14+ 上信任任意自定义 CA 证书, 只需要在刷入前修改本模块 `~/system/etc/security/cacerts` 下的内容即可。

## ⚖️ 许可证

本项目基于 [MIT License](https://opensource.org/license/MIT) 开源。