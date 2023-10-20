# CATIA开发问题答疑

## 判断catia是否打开的语句是否有变化，打开catia语句是什么

CATIA V5 和 3DEXPERIENCE 开启方式一致，如下代码所示：

VB

```vb
Dim CATIA As Object
On Error Resume Next       ' Disable automatic error handling
    Set CATIA=GetObject(,"CATIA.Application")
    iErr = Err.Number      ' For BasicScript parser (Unix)
    If (iErr <> 0) Then    ' Manually handle all errors
        On Error Goto 0    ' Invalidates the Resume Next and clears the error
        Set CATIA=CreateObject("CATIA.Application")
    End If
On Error Goto 0            ' Invalidates the Resume Next and clears the error
```

C#

```csharp
static Application catia = System.Runtime.InteropServices.Marshal.GetActiveObject("Catia.Application") as Application;
```

Python

```python
import win32com.client
CATIA = win32com.client.Dispatch('CATIA.Application')
CATIA.Visible=True
```

## 是否有二次开发api中文文档，能否提供

无，也不需要，推荐使用软件自带的VBA，遇到问题按住F1 自动跳转到当前帮助。

## 与V5版的catia区别在哪里，哪些开发相关内容有所更改

V6 采用数据库模式，比V5更加注重企业人员协作和文件管理，这点非常重要，在V5时代，版本管理和维护是一件很麻烦的事情，V6 很好的解决了此类问题，使得提交的模型一致保持最新状态，所有的版本都可以被追踪到。

与开发相关的就是原来读取文件是采用本地的方式，现在采用读取文件在数据库中的唯一编号形式。在产品的逻辑架构层面也有新的变化。

## 支持vb哪些版本，是否支持其他语言开发，二次开发接口

支持所有版本，可以使用VS2022,支持64bit，效率更高，速度更快。对于COM组件来说，支持 VB、C#、Python、C++。

如果开发服务端，需要 Java。

## 开发过程有无其他注意事项

根据自己的需求，首先一定要使用CATIA 自带的功能模拟一遍，如果手动都无法操作，开发大概率也无法实现，目前开放的API有限，无法满足所有需求，对于实践中需要反复操作的可以采用开发的方式，对于V6 而言，建议使用自带的 EKL语言，大多数工作都可以胜任，无需开发，现在的开发方式已经是旧时期的产物，API 上没有EKL语言更新的快，EKL对于应用来说是未来。

## 能否链接数据库及链接使用方法

平台安装需要  MS MQL 或者 Oracle 的数据库，但是不支持自主开发。

## 平台是如何进行协同设计工作

每个用户有自己的账号密码，登录服务器，所有的建模操作都会留下历史记录，也可以在平台内部进行资料分享，信息沟通。

## 如何进行产品骨架设计

这是根据自身的项目而来的，没有统一 的硬性规范，但是根据自己的工作习惯，一般都会约束一些企业规范，类似CAD 的图层标准。

## 人员设计及权限管理

每个设计人员拥有自己的角色，有的角色只能建模，无法处理数据的导入导出，模型权限分配也需要相应的权限，具体细节在深入讨论

## 旧产品V5及其他格式的模型文件的导入方法有哪些

直接导入，数据完好无损。

## 如何查找删除文件

![](CATIA开发问题答疑\2022-03-14-16-19-21-image.png)

![](CATIA开发问题答疑\2022-03-14-16-21-19-image.png)

点击 ''删除'',搜素到你需要的文件即可删除。

## 出图应用

目前出图拥有了一个新的模块SDW，此模块很多功能正在研发中，等日后有好的案例再分享。目前可以做线路出图，桥梁展开面的出图。

其他的出图功能和V5 功能是一致的。

## 网页端的使用

![](CATIA开发问题答疑\2022-03-14-16-24-43-image.png)

所有app 右上角带小箭头的都是网页端的应用，可以浏览模型，查看模型的状态和人员信息等等。

## 超长线路设计的应用

支持正负100KM的超大模型设计，地形支持100GB的超大laz格式的数据导入。

## 多级校审应用

X

## STR模块的使用，有没有其他类似的好用的专业模块

还有建筑结构模块的功能，可以做一些建筑钢结构设计，但是是比较常规的设计方法，与桥梁交通工程的钢结构还有些许差异。

![](CATIA开发问题答疑\2022-03-15-13-03-02-image.png)

![](CATIA开发问题答疑\2022-03-15-13-03-47-image.png)

![](CATIA开发问题答疑\2022-03-15-13-03-55-image.png)

![](CATIA开发问题答疑\2022-03-15-13-04-14-image.png)

![](CATIA开发问题答疑\2022-03-15-13-05-04-image.png)

## 

## 如何用数据库的备份恢复数据

X

## 账户的修改

个人账户信息都在 3dpassport 内进行修改

https://v6r2020x.3de.com/3dpassport

根据企业的域名修改，之后可以进行一些密码修改变更等。

还可以进入3dswym 进行一些平台内的沟通，信息分享，类似微信朋友圈和QQ空间等功能。可以发起话题，参与设计讨论，分享网页资料，图片等等信息。

## 模型上传的问题

软件右上角有导入功能，过滤自己需要的类型，直接选择文件导入模型即可，需要注意的是不是所有格式都支持上传，有些有许可限制。
