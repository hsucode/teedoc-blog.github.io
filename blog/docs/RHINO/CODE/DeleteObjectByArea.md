


# Delete Object by area

if area of the object is too small then delete object


```python

import rhinoscriptsyntax as rs

def GetObjArea():
    "Calculate the length of one or more curves"
    # Get the curve objects
    arrObjects = rs.GetObjects("Select Objects", rs.filter.surface, True, True)
    if( arrObjects==None ): return
    rs.UnselectObjects(arrObjects)

    objArea = 0.0
    count  = 0
    for object in arrObjects:
        if rs.IsSurface(object):
            #Get the curve objArea
            #objArea += rs.Area(object)
            #count += 1
            objArea = rs.Area(object)
            print objArea
            if objArea<19000.000:
                rs.DeleteObject(object)
            else:
                print 'ke'
    
    if (count>0):
        print "Surface selected:", count, " Total Area:", objArea
    
# Check to see if this file is being executed as the "main" python
# script instead of being used as a module by some other python script
# This allows us to use the module which ever way we want.
if( __name__ == "__main__" ):
    GetObjArea()

```