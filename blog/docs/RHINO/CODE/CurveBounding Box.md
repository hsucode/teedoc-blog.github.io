
# Curve Bounding Box

=== "C#"

    ```csharp
    partial class Examples
    {
      public static Rhino.Commands.Result CurveBoundingBox(Rhino.RhinoDoc doc)
      {
        // Select a curve object
        Rhino.DocObjects.ObjRef rhObject;
        var rc = Rhino.Input.RhinoGet.GetOneObject("Select curve", false, Rhino.DocObjects.ObjectType.Curve, out rhObject);
        if (rc != Rhino.Commands.Result.Success)
          return rc;

        // Validate selection
        var curve = rhObject.Curve();
        if (curve == null)
          return Rhino.Commands.Result.Failure;

        // Get the active view's construction plane
        var view = doc.Views.ActiveView;
        if (view == null)
          return Rhino.Commands.Result.Failure;
        var plane = view.ActiveViewport.ConstructionPlane();

        // Compute the tight bounding box of the curve in world coordinates
        var bbox = curve.GetBoundingBox(true);
        if (!bbox.IsValid)
          return Rhino.Commands.Result.Failure;

        // Print the min and max box coordinates in world coordinates
        Rhino.RhinoApp.WriteLine("World min: {0}", bbox.Min);
        Rhino.RhinoApp.WriteLine("World max: {0}", bbox.Max);

        // Compute the tight bounding box of the curve based on the
        // active view's construction plane
        bbox = curve.GetBoundingBox(plane);

        // Print the min and max box coordinates in cplane coordinates
        Rhino.RhinoApp.WriteLine("CPlane min: {0}", bbox.Min);
        Rhino.RhinoApp.WriteLine("CPlane max: {0}", bbox.Max);
        return Rhino.Commands.Result.Success;
      }
    }
    ```

=== "Python"

    ```python

    import Rhino
    import scriptcontext

    def CurveBoundingBox():
        # Select a curve object
        rc, rhobject = Rhino.Input.RhinoGet.GetOneObject("Select curve", False, Rhino.DocObjects.ObjectType.Curve)
        if rc!=Rhino.Commands.Result.Success: return

        # Validate selection
        curve = rhobject.Curve()
        if not curve: return

        ## Get the active view's construction plane
        view = scriptcontext.doc.Views.ActiveView
        if not view: return
        plane = view.ActiveViewport.ConstructionPlane()

        # Compute the tight bounding box of the curve in world coordinates
        bbox = curve.GetBoundingBox(True)
        if not bbox.IsValid: return

        # Print the min and max box coordinates in world coordinates
        print "World min:", bbox.Min
        print "World max:", bbox.Max

        # Compute the tight bounding box of the curve based on the
        # active view's construction plane
        bbox = curve.GetBoundingBox(plane)

        # Print the min and max box coordinates in cplane coordinates
        print "CPlane min:", bbox.Min
        print "CPlane max:", bbox.Max

    if __name__=="__main__":
        CurveBoundingBox()

    ```

=== "VB.NET"

    ```vbnet

    Partial Friend Class Examples
      Public Shared Function CurveBoundingBox(ByVal doc As Rhino.RhinoDoc) As Rhino.Commands.Result
    ' Select a curve object
    Dim rhObject As Rhino.DocObjects.ObjRef = Nothing
    Dim rc = Rhino.Input.RhinoGet.GetOneObject("Select curve", False, Rhino.DocObjects.ObjectType.Curve, rhObject)
    If rc IsNot Rhino.Commands.Result.Success Then
      Return rc
    End If

    ' Validate selection
    Dim curve = rhObject.Curve()
    If curve Is Nothing Then
      Return Rhino.Commands.Result.Failure
    End If

    ' Get the active view's construction plane
    Dim view = doc.Views.ActiveView
    If view Is Nothing Then
      Return Rhino.Commands.Result.Failure
    End If
    Dim plane = view.ActiveViewport.ConstructionPlane()

    ' Compute the tight bounding box of the curve in world coordinates
    Dim bbox = curve.GetBoundingBox(True)
    If Not bbox.IsValid Then
      Return Rhino.Commands.Result.Failure
    End If

    ' Print the min and max box coordinates in world coordinates
    Rhino.RhinoApp.WriteLine("World min: {0}", bbox.Min)
    Rhino.RhinoApp.WriteLine("World max: {0}", bbox.Max)

    ' Compute the tight bounding box of the curve based on the
    ' active view's construction plane
    bbox = curve.GetBoundingBox(plane)

    ' Print the min and max box coordinates in cplane coordinates
    Rhino.RhinoApp.WriteLine("CPlane min: {0}", bbox.Min)
    Rhino.RhinoApp.WriteLine("CPlane max: {0}", bbox.Max)
    Return Rhino.Commands.Result.Success
      End Function
    End Class

    ```