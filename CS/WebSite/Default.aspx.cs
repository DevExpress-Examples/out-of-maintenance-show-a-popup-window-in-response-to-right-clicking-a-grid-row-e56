using System;

public partial class Grid_ClientSideEvents_ShowPopupOnContextMenu_ShowPopupOnContextMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DevExpress.Web.ASPxClasses.ASPxWebControl.RegisterUtilsScript(Page); // Necessary to refer to the client-side ASPxClientUtils class
    }
}
