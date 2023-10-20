
# Kaleidoscope

## description

This study is based on the principle of kaleidoscopic mirroring patterns. The evolution of the patterns is developed by the use of multiple mirrors along different mirror planes.
With a very simplistic input set, that is, an object curve, a mirror line and a point, this algorithm generates enumourous patterns by using parameters. These parameters include the input angle and scale factor. Also, one of the intentions is to create fractal geometry with the help of mirrorring.
This 3-dimensional object projected below is a very intricate, volumetric form of pattern which has been developed from a very simplistic 2-dimensional pattern.

design team : Shengkan Zhang, Batul Tinwala, Ram Annamalai Thennaapan, Sameeha Rajendra Joshi, Ryan Kane
FORM AND ALGORITHM, PennDesign 2014
Instructor: Cecil Balmond, Ezio Blasetti

boards


code for mirrored mirrors

"""

design team : Shengkan Zhang, Batul Tinwala, Ram Annamalai Thennaapan, Sameeha Rajendra Joshi, Ryan Kane

FORM AND ALGORITHM, PennDesign 2014

Instructor: Cecil Balmond, Ezio Blasetti

code developed in python for rhinoceros beta 5.0

"""

```python
import rhinoscriptsyntax as rs

def Main():

    curve = rs.GetObject("please select a curve",rs.filter.curve)
    line  = rs.GetObject("Select a mirror line")
    pt    = rs.GetObject("please select a point", rs.filter.point)
    limitscale = rs.GetReal("please input a limit scale factor", 0.3)
    angle      = rs.GetReal("please input a rotate angle", 10)
    len        = rs.CurveLength(curve)
    list       = []
    lenlimit=limitscale*len
    while (len>lenlimit):
        if len<=lenlimit: break
        curve = rs.ScaleObject(curve,pt,[0.9,0.9,0.9], True)
        curve = rs.RotateObject(curve,pt,angle)
        len   = rs.CurveLength(curve)
        list.append(curve)
        view = rs.CurrentView()
        rs.ViewCPlane( view, rs.WorldZXPlane() )
        Mirror1(line, list)

def Mirror1(line, list):
    objs = list
    for i in range(12):
        line1   = rs.RotateObject(line, rs.CurveEndPoint(line), 15, None, copy=False)
        Mirror1 = rs.MirrorObjects( objs, rs.CurveStartPoint(line), rs.CurveEndPoint(line), True )
        list1 = []
        #rs.ScaleObjects(line1, rs.CurveEndPoint(line), [scale, scale, scale], True)
        list1.append(Mirror1)
        line = line1
        #rs.RotateObject( line1, rs.CurveStartPoint(line1), 30, None, True)
        view = rs.CurrentView()
        rs.ViewCPlane( view, rs.WorldYZPlane() )
        rs.HideObjects(line)
        Mirror2(line1, list1)

def Mirror2(line1, list1):
    objs = list1
    for i in range(12):
        line2 = rs.RotateObject(line1, rs.CurveEndPoint(line1), 15, None, copy=False)

        Mirror2 = rs.MirrorObjects( line1, rs.CurveStartPoint(line1), rs.CurveEndPoint(line1), True )
        list2 = []
        list2.append(Mirror2)
        line1 = line2
        Mirror3(line2, list2, line1)
def Mirror3(line2, list2, line1):
    objs = list2
    for i in range(15):
        line3 = rs.RotateObject(line2, rs.CurveEndPoint(line2), 15, None, copy=False)

        Mirror3 = rs.MirrorObjects( line2, rs.CurveStartPoint(line2), rs.CurveEndPoint(line2), True )

        list3 = []
        list3.append(Mirror3)
        line2 = line3
        view = rs.CurrentView()
        rs.ViewCPlane( view, rs.WorldZXPlane() )
        RotateMirrors(line1, line2, line3)

def RotateMirrors(line1, line2, line3):
    rs.RotateObjects( [line1, line2, line3], rs.CurveStartPoint(line3), 30, None, True)
    view = rs.CurrentView()
    rs.ViewCPlane( view, rs.WorldYZPlane() )

Main()

code for mirrored fractals

"""

design team : Shengkan Zhang, Batul Tinwala, Ram Annamalai Thennaapan, Sameeha Rajendra Joshi, Ryan Kane

FORM AND ALGORITHM, PennDesign 2014

Instructor: Cecil Balmond, Ezio Blasetti

code developed in python for rhinoceros beta 5.0

"""



import rhinoscriptsyntax as rs
import scriptcontext as sc

def aaa(objs,pt0,pt1,pt2):
    rs.EnableRedraw(False)
    plane=rs.PlaneFromPoints(pt0,pt1,pt2)
    xform=rs.XformMirror(plane.Origin,plane.Normal)
    newobjs=rs.TransformObjects(objs,xform,True)
    return newobjs

def craked(pls,gens2):
    deleteobj=[]
    for i in range (gens2):
        newpl=[]
        for pl in pls:
            ptset=rs.CurvePoints(pl)
            pta=ptset[0]
            ptb=ptset[1]
            ptc=ptset[2]
            ptd=ptset[3]
            ptx =((pta[0]+ptb[0]+ptc[0]+ptd[0])/4)
            pty =((pta[1]+ptb[1]+ptc[1]+ptd[1])/4)
            ptz =((pta[2]+ptb[2]+ptc[2]+ptd[2])/4)

            ptcenter=[]
            ptcenter.append(ptx)
            ptcenter.append(pty)
            ptcenter.append(ptz)
            ptcenter=rs.AddPoint(ptcenter)

            rs.AddLine(ptcenter,pta)
            rs.AddLine(ptcenter,ptb)
            rs.AddLine(ptcenter,ptc)
            rs.AddLine(ptcenter,ptd)
          
            ptset1=[]
            ptset1.append(pta)
            ptset1.append(ptb)
            ptset1.append(ptc)
            ptset1.append(ptcenter)
            pline2=rs.AddPolyline(ptset1)

            ptset2=[]
            ptset2.append(ptb)
            ptset2.append(ptc)
            ptset2.append(ptd)
            ptset2.append(ptcenter)
            pline3=rs.AddPolyline(ptset2)


            ptset3=[]
            ptset3.append(pta)
            ptset3.append(ptc)
            ptset3.append(ptd)
            ptset3.append(ptcenter)
            pline4=rs.AddPolyline(ptset3)

            

            ptset4=[]
            ptset4.append(pta)
            ptset4.append(ptb)
            ptset4.append(ptd)
            ptset4.append(ptcenter)
            pline5=rs.AddPolyline(ptset4)

            newpl.append(pline2)
            newpl.append(pline3)
            newpl.append(pline4)
            newpl.append(pline5)

        
            deleteobj.append(ptcenter)
            deleteobj.extend(newpl)

        pls=newpl
    rs.DeleteObjects(deleteobj)

def main():

    curve=rs.GetObject("open curve",rs.filter.curve)

    line=rs.GetObject("3-d curve", rs.filter.curve)

    pt = rs.GetPoint("point")

    angle = rs.GetReal("please input a rotate angle", 30)

    gens = rs.GetInteger("please type how many generations",4)

    curmirs=[]

    curmirs.append(line)

    curves=[]

    curves.append(curve)





    for i in range (gens):

        #nextgens=[]

        nextmirs=[]

        curve=rs.ScaleObject(curve,pt,[0.9,0.9,0.9])

        curve=rs.RotateObject(curve,pt,angle)

        newmirs=rs.RotateObjects(curmirs,pt,angle)

        nextmirs.extend(newmirs)



        for j in range (len(curmirs)):

            mirline=curmirs[j]

            pt0=rs.CurveStartPoint(mirline)

            pt1=rs.CurveMidPoint(mirline)

            pt2=rs.CurveEndPoint(mirline)

            curve=aaa(curve,pt0,pt1,pt2)

            othermirs=curmirs[:]

            othermirs.pop(j)

            miredmirs=aaa(othermirs,pt0,pt1,pt2)

            curves.append(curve)

            nextmirs.extend(miredmirs)

        curmirs=[]

        curmirs.extend(nextmirs)

    rs.DeleteObjects(curmirs)

    

    for i in range (len(curves)-1):
        lin1=curves[i]
        lin2=curves[i+1]
        pta=rs.CurveStartPoint(lin1)
        ptb=rs.CurveEndPoint(lin1)
        ptc=rs.CurveStartPoint(lin2)
        ptd=rs.CurveEndPoint(lin2)
        pts=[]
        pts.append(pta)
        pts.append(ptb)

        pts.append(ptc)

        pts.append(ptd)

        pline1=rs.AddPolyline(pts)

        pls=[]

        pls.append(pline1)

        craked(pls,3)









main()

Kaleidoscope 

 
```

![](kaleidoscope_1.jpg)
![](kaleidoscope_2.jpg)
![](kaleidoscope_3.jpg)
![](kaleidoscope_4.jpg)
![](kaleidoscope_5.jpg)
![](kaleidoscope_6.jpg)
![](kaleidoscope_7.jpg)
![](kaleidoscope_8.jpg)
![](kaleidoscope_9.jpg)
![](kaleidoscope_10.jpg)