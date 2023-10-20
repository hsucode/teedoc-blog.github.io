
---
title: dsls
date: 2014-4-16 09:44:30
tags: BUILDING
type: "categories"
categories: "BUILDING"
keywords: 'BIM'
cover: A5-3_PIC_8.PNG
---


## dsls

---

A license server helps the administrator to guarantee the license control is implemented in compliance with purchased licensed products embedding the license client.
A typical license server and client setup looks like this:

许可证服务器帮助管理员保证许可证控制的实施符合购买嵌入许可客户端的许可产品。
典型的许可证服务器和客户端设置如下所示：

---

Only one DS License Server can be installed and configured on a given computer, either as a standalone or as a failover member.
License servers and license clients must be time-synchronized.

在给定的计算机上只能安装和配置一个 DS 许可证服务器，无论是作为独立的还是作为故障转移成员。
许可证服务器和许可证客户端必须是时间同步的。

---

Upgrading Your License Server
Keep in mind the following when you install a new version of the DS License Server:
• each version of (or hot fix for) the DS License Server is complete, in other words, it is installed in place of
the existing version, so the existing version must be uninstalled beforehand
• uninstalling the DS License Server does NOT remove license keys, settings or log files
• failover members can communicate with each other only if they are at the same license server code level.
Be aware that upgrading failover cluster members from a given license server code level to a higher code
level will prevent the failover cluster from functioning while you are upgrading the second member. Once
the second cluster member has been upgraded, normal failover operation resumes.
To upgrade your license servers in a failover cluster, refer to Upgrading Your License Servers in a Failover
Cluster.


升级您的许可证服务器
安装新版本的 DS 许可证服务器时，请记住以下几点：
• DS 许可证服务器的每个版本（或修补程序）都是完整的，换句话说，它是安装在
现有版本，因此必须事先卸载现有版本
• 卸载 DS 许可证服务器不会删除许可证密钥、设置或日志文件
• 只有当故障转移成员处于相同的许可证服务器代码级别时，它们才能相互通信。
请注意，将故障转移群集成员从给定的许可证服务器代码级别升级到更高的代码
级别将在您升级第二个成员时阻止故障转移群集运行。 一次
第二个集群成员已升级，正常的故障转移操作恢复。
要升级故障转移集群中的许可证服务器，请参阅升级故障转移中的许可证服务器
簇。

---

Installing the DS License Server on Windows

This task explains how to unload the DS License Server on a single computer running a supported Windows
operating system.
Installation and de-installation rely on Windows-compliant tools enabling anyone familiar with Windows
procedures and concepts to install the software without assistance.
You must belong to the Administrators group, or have the privileges assigned to the Administrators group.
Otherwise, you will not be able to start the installation.
1. Log on as an administrator.
2. Insert the media into the drive.
If the DS License Server is distributed on an assembly media, go to the directory containing the DS License
Server software, locate the SetupDSLSmsi.exe file and double-click it to start the installation.
In either case, a dialog box appears informing you that the installation is about to start, followed by the DS
License Server setup wizard:

在 Windows 上安装 DS 许可证服务器

此任务说明如何在运行受支持的 Windows 的单台计算机上卸载 DS 许可证服务器
操作系统。
安装和卸载依赖于 Windows 兼容的工具，使任何熟悉 Windows 的人都能
在没有帮助的情况下安装软件的过程和概念。
您必须属于管理员组，或具有分配给管理员组的权限。
否则，您将无法开始安装。
1. 以管理员身份登录。
2. 将媒体插入驱动器。
如果 DS 许可证服务器在汇编媒体上分发，请转到包含 DS 许可证的目录
服务器软件，找到 SetupDSLSmsi.exe 文件并双击它开始安装。
无论哪种情况，都会出现一个对话框，通知您安装即将开始，然后是 DS
许可证服务器设置向导：

---

[...](./DSLS/set-ds-license.bat)