<!--
 * @Name: 
 * @Data: YYYY-MM-DD HH:mm:ss
 * @Input: 
-->

#### 出图

1、整体模型的视图如何和局部零件的视图组织在一张图纸中？
以下图为例：

![](DRW-Drafting\2022-04-11-13-23-14.png)
![](DRW-Drafting\2022-04-11-13-24-39.png)

选择出图按钮；

![](DRW-Drafting\2022-04-11-13-25-44.png)

选择你想要的独立构件；

![](DRW-Drafting\2022-04-11-13-27-37.png)

如果直接选择参考平面，将生成所有的构件组合的图纸；
如果先选择构件，再选择参考平面，如果出图在一个part 内，先选几何图形集，再选择参考平面；

![](DRW-Drafting\2022-04-11-13-29-37.png)

![](DRW-Drafting\2022-04-11-13-32-12.png)

![](DRW-Drafting\2022-04-11-13-34-21.png)

最终结果如下，具体位置如果想单独展示，也可以不叠合；

![](DRW-Drafting\2022-04-11-13-35-15.png)

2、标注能实现某种意义上的自动化吗？如果能，用什么技术？

参考以上步骤，在建模环境中，释放出标注的关键点位，
![](DRW-Drafting\2022-04-11-13-46-29.png)
![](DRW-Drafting\2022-04-11-13-54-09.png)
![](DRW-Drafting\2022-04-11-13-54-53.png)
![](DRW-Drafting\2022-04-11-13-57-30.png)

- 如果想通过开发去自动标注，需要代码先回到第一个产品的第一个零件，获得标注点所在的3D坐标值，然后回到2D图纸中，获得坐标值的两个维度的值，它们都是一一对应的，再根据API接口进行根据坐标值，重新绘制两个点，对这两个点进行标注；
- 所有角度标注，文字标注都需要进行以上的操作；
- 对于本例来说没有必要，它们的变化都是尺寸范围内的，把标注做在模板文件里面，实例化后即可自动生成标注，也能自动更新；
- 只有在动态的情况下，才适用与代码进行标注，例如你想生成连续梁的立面展开图，在并不确定有多少跨梁的情况下，可以使用自动开发标注；



3、像桁架节段这样的结构是不断重复的结构，其二维图能做成模板吗？

参考 1 的步骤，然后对构件进行标注，把这些整体做成工程模板，实例化之后即可自动生成图纸。