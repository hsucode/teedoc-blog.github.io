
# CATIA出图自动标注


[b站地址](https://www.bilibili.com/video/BV1BM411E7po/)


<iframe src="//player.bilibili.com/player.html?bvid=BV1BM411E7po&page=1"  width="500" height="240" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>

<!-- <video width="500" height="240" controls>
    <source src="//player.bilibili.com/player.html?bvid=BV1BM411E7po&page=1" >
</video> -->


=== "CATIA标注案例"

    ```vb

    Sub batchAngleA(MyView, p1x, p1y, p2x, p2y, p3x, p3y)
     Dim Fact2D  As Factory2D
     Set Fact2D = MyView.Factory2D
     Dim Line1 As Line2D
     Dim Line2 As Line2D
     Set Line1 = Fact2D.CreateLine(p1x, p1y, p2x, p2y)
     Set Line2 = Fact2D.CreateLine(p2x, p2y, p3x, p3y)
     
     Dim iType As CatDimType
     iType = catDimAngle
     Dim myElements1(1)
     myElements1(1) = Array(Line1, Line2)
     Dim selpoints(3)
     selpoints(3) = Array(150, 10, 120, 100)
     Dim MyDimension1 As DrawingDimension
     Set MyDimension1 = MyView.Dimensions.Add(iType, myElements1(1), selpoints(3), catDimAuto)
    End Sub

    ```

=== "Rhino标注案例"

    ```python
    import Rhino
    import scriptcontext
    import System.Guid
    
    def AddAnnotationText():
        pt = Rhino.Geometry.Point3d(10, 0, 0)
        text = "Hello RhinoCommon"
        height = 2.0
        font = "Arial"
        plane = scriptcontext.doc.Views.ActiveView.ActiveViewport.ConstructionPlane()
        plane.Origin = pt
        id = scriptcontext.doc.Objects.AddText(text, plane, height, font, False, False)
        if id!=System.Guid.Empty:
            scriptcontext.doc.Views.Redraw()
            return Rhino.Commands.Result.Success
        return Rhino.Commands.Result.Failure
    
    
    if __name__=="__main__":
        AddAnnotationText()

    ```

CATIA 要实现标注，需要获得3D模型坐标，到2D图纸里面重建一次，需要生成点或者参考线，如果删除标注会报错，对于项目后期来说会使图面多出很多不必要的线。
Rhino 要实现标注，同样要获得坐标，但是不需要将物体生产出来，图纸空间中会自动显示，输出的DWG比CATIA更加完美。



