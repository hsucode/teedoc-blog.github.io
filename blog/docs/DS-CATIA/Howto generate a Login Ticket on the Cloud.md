
# How to generate a Login Ticket on the Cloud

In order to generate a Login Ticket on a Cloud environment you may follow these steps:

1. Login to the 3DEXPERIENCE.
2. Launch "Collaboration & Approvals" (North Quadrant of the Compass).
   The App will be launched in a Web browser.
3. Copy the "Collaboration & Approval" URL.
   (E.g:  <https://r00012345-eu1-space.3dexperience.3ds.com/enovia/common/emxNavigator.jsp?appName=ENOBUPS_AP> &tenant=DS088 &collabSpace=Common%20Space )
4. Keep the URL of the server.
   (E.g: <https://r00012345-eu1-space.3dexperience.3ds.com/enovia/>)
5. Add the ticket generator service to this URL:  common/emxLoginTicketAdmin.jsp
    (E.g: <https://r00012345-eu1-space.3dexperience.3ds.com/enovia/common/emxLoginTicketAdmin.jsp>)
6. Open a new tab in your browser and paste the login ticket URL in the address bar.
7. Now you will see the Manage Login Ticket dialog box.
8. Select your Login Ticket options and click on Create.

    Related Documentation Reference
    Creating a Login Ticket using CAA API
    QA00000051002
    Create Login Ticket On Premise Environment:
    Developper Assistance | Native Apps C++ | Common Services | Abstractions | PLM Connection | Connecting to V6 Server
    Create Login Ticket on the Cloud:
    Developper Assitance | Web Apps Java | Social and Collaborative Apps | Strategic Customer Relationship Management | 3D Merchandising | Transmiting Reference Data to 3D Merchandising from an External System | Reference Data Transmission Overview
