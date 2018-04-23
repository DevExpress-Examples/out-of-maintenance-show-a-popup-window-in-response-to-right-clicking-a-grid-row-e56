Imports Microsoft.VisualBasic
Imports System

Partial Public Class Grid_ClientSideEvents_ShowPopupOnContextMenu_ShowPopupOnContextMenu
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		DevExpress.Web.ASPxClasses.ASPxWebControl.RegisterUtilsScript(Page) ' Necessary to refer to the client-side ASPxClientUtils class
	End Sub
End Class
