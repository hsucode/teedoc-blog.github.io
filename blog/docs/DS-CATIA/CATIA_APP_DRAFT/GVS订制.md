

# GVS订制


下面用一个案例介绍如何用二维符号自动替代Drafting中某一类模型的真实投影

a. 创建一个单插连接器（Single Insert Connector）

![](GVS订制\2022-10-01-23-40-20.png)

将其命名为aa456

![](GVS订制\2022-10-01-23-40-31.png)

在该单插连接器上定义一个Segment Connection Point

![](GVS订制\2022-10-01-23-40-39.png)

![](GVS订制\2022-10-01-23-40-48.png)

b. 创建详图，定义2D部件

然后创建详图，在详图中创建一个2D部件，将其名字改为和之前的单插连接器名字相同：

![](GVS订制\2022-10-01-23-41-10.png)

![](GVS订制\2022-10-01-23-41-27.png)


c. 创建Catalog，将2D部件插入
创建一个Catalog，将该2D部件插入到目录中：

![](GVS订制\2022-10-01-23-41-36.png)

d. 在Data Setup中定义资源
切换到Owner所有者角色，进入Data Setup应用中，在Electrical Manufacturing preparation resource节点下添加新的资源集：

![](GVS订制\2022-10-01-23-41-49.png)



在Drawing Catalos和Drawing chapters两项中挂接刚才创建的Catalog和chapter：

![](GVS订制\2022-10-01-23-42-00.png)

![](GVS订制\2022-10-01-23-42-09.png)

创建完毕之后，将该资源集挂接到左边一列对应合作区中，ctrl + s保存



e. 修改标准standard
打开standard界面，找到Electrical – Device – SingleInsertConnector – Representation
Type类型选择2DSymbol，2DDetailOrientation选择Yes，CatalogName选择之前创建好的Catalog51，2DDetailName填写aa456


![](GVS订制\2022-10-01-23-42-44.png)

点击OK保存（保存之后再打开standard一次，确认是否保存成功）
f. 生成图纸
创建一个物理产品，将之前创建的单插连接器插入到该物理产品中，同时也插入一张图纸：

![](GVS订制\2022-10-01-23-42-57.png)


打开图纸，基于该物理产品创建Front View，选择之前修改好的名叫123的GVS：

![](GVS订制\2022-10-01-23-43-07.png)

选择该单插连接器的正面：

![](GVS订制\2022-10-01-23-43-14.png)

![](GVS订制\2022-10-01-23-43-23.png)

点击生成Front View:

![](GVS订制\2022-10-01-23-43-30.png)

如图，该单插连接器矩形的真实投影自动变为了之前定义好的圆形2D Component

![](GVS订制\2022-10-01-23-43-37.png)

如果想让其再变回到真实投影，只需切换到没有修改过的GVS标准，将该视图再生成一次即可：

![](GVS订制\2022-10-01-23-43-52.png)

选择好GVS之后，点击应用，之前的2D部件自动变回到真实投影形状：

![](GVS订制\2022-10-01-23-43-59.png)

注：
（1） 对暖通HVAC或者Raceway等类型模型进行GVS订制的方法和上述方法相同
（2） Electrical类型模型中，目前经过验证，Connector类型的电气模型可进行上述方法的特定设备二维符号化替代的GVS订制，其他诸如Shell等类型方法应当一致；但是对于Equipment类型，此方法不可行
（3） 如果用户用上述方法进行GVS订制不起效，可将3DE的缓存文件进行清理（缓存中可能带着之前旧GVS的信息）。
（4） 另外用户需要检查是否有EMP这个许可，如果没有这个许可，也不会生效
