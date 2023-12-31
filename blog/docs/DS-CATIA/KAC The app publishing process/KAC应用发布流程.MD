---
title: 应用发布流程
keywords: kac, 应用发布流程, 应用发布流程
desc: teedoc 静态博客页面生成
show_source: false
date: false

---


<!-- <video id="video" controls="" preload="none" poster="封面">
      <source id="mp4" src="应用发布流程.m4v" type="video/m4v">
</videos>

<video src="https://****.com/***.mp4" controls="controls" preload="auto">your brower not support play video</video> -->

[video](./应用发布流程.m4v)


数据完备性检查


应用发布流程需要考虑如下要点：

- 数据完整性：在应用发布前需要检查所有数据引用状态是否完整
    - 调用的用户对话框是否已完全定义
        - 用户对话框需要的资源是否完全定义—图片、翻译文件是否已经完成定义并存放在知识组件相伴的资源文件的指定位置
        - 对话框输入，输出的用户自定义变量是否已关联到正确的控件，关联的方向是否正确？
        - 对话框需要的事件触发脚本是否已经定义完备？
    - 组件是否已完全定义
        - 组件中引用的模板，库，专业库，数表等是否已经在资源表中完全定义？
        - 组件中引用的对话框是否已经完全定义？
        - 组件技术对象中数据流是否完整？
            - 单元控件之间数据流完成链接？方向是否正确
            - 单元控件有无悬空未定义的输入输出？
        - 组件中定义的应用资源是否完全定义
            - 程序工具栏的命令图标是否完全定义？并存放到知识组件相伴的资源文件的指定位置
            - 程序工具栏命令提示文件是否完全定义？并存放到知识组件相伴的资源文件的指定位置
    - 应用程序是否已经完全定义
        - 应用程序所需的组件是否已经定义完成？
        - 依赖的组件是否已经关联到主组件上？
        - 应用程序在罗盘上的图标与翻译是否定义完整
- 数据生命周期：
    - 资源表中声明的资源模板，库等3DE中标准类型的元素是否完成生命周期定义
        - 是否采用了正确的版本？
        - 该版本是否处于发布状态？
        - 该版本是否已经转移至合适的所有者与正确的协作空间？
    - 组件/依赖的资源；自定义函数库；应用；应用包是否完成生命周期定义
        - 是否采用到了正确版本？
        - 该版本是否处于发布状态？
        - 发布的版本是否已经转移至合适的所有者与正确的协作空间？
- 数据保密性：
    - 组件是否已经加密？
    
    > 对象的规范要求
    > 
    - 对话框：
        - 对话框定义在知识工程组件（kcp）中。
            - 对话框资源文件，对话框同名的CATNls CATRes。翻译文件在CATNls中定义，图标定义在CATRes中进行
            - 图标定义：对话框所用的媒体图片存放在`OS-Independant-RunTimeView/resources/graphic/icons`
    - 组件：
        - 组件相关资源
            - 工具栏资源，与应用同名的CATNls CATRes。翻译文件在CATNls中定义，图标定义在CATRes中进行
            - 图标定义：大小为32*32 64*64 png/bmp格式存放`OS-Independant-RunTimeView/resources/graphic/icons`  大小为24*24 png/bmp格式存放在`OS-Independant-RunTimeView/resources/graphic/icons/normal`  大小为18*18 png/bmp格式存放在`OS-Independant-RunTimeView/resources/graphic/icons/small`
    - 其它资源
        - 技术对象等的索引文件`OS-Independant-RunTimeView/resources/knowledge`  中的  CATKweIdx
        - 工作台文件`OS-Independant-RunTimeView/resources/knowledge/workbench`  中的xml
        - web应用文件`OS-Independant-RunTimeView/webapps`
        - 其他需要放入的资源
    
    > 生命周期
    > 
    - 基础操作：
        - 查找对象
            - 组件关键字kcp，配套资源关键字appdata，应用关键字kapp，知识包关键子kconf，用户自定义库关键字klib
        - 版本变更
            - 在搜索结果框中选中对象
            - 切换到生命周期管理应用
            - 点选新修订版
          
This content is only supported in a Docs.

        - 成熟度变更
     



        - 转换所有权与协同空间
            - 在搜索结果框中选中对象
            - 切换到生命周期管理应用
            - 点选转移所有权
         


        - 数据保护
            - 数据保护发生在冻结状态

> 数据发布
> 

以owner权限绑定标准空间的包到该协同空间

> 数据删除
> 
- 发布数据不宜删除
- 在搜索结果框中选中对象
- 切换到生命周期管理应用
- 点选删除

