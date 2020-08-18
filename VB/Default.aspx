<%-- BeginRegion Tags and page properties --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_ClientSideEvents_ShowPopupOnContextMenu_ShowPopupOnContextMenu" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>    

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show a popup window in response to right-clicking a grid row</title>
<script type="text/javascript">
    function OnContextMenu(e) {
        //if the object is not a row return
        if(e.objectType != 'row') return;
        popup_notesEditor.SetValue("Loading...");
        //get the notes value for the current row from the server
        grid.GetRowValues(e.index, "Notes", SetNotes);
        //Show the popup control
        var x = ASPxClientUtils.GetEventX(e.htmlEvent);
        var y = ASPxClientUtils.GetEventY(e.htmlEvent);
        popup.ShowAtPos(x, y);
    }
    function SetNotes(value) {
        popup_notesEditor.SetValue(value);
    }
</script>
</head>
<body>
    <form id="form1" runat="server">

    <br/>
    Right-click a row to see the corresponding employee notes.
    <br/>
    <dxpc:ASPxPopupControl HeaderText="Notes" EncodeHtml="False" id="popup" runat="server" EnableViewState="False" AllowDragging="true" 
        PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10" EnableClientSideAPI="true">
        <ContentCollection><dxpc:PopupControlContentControl runat="server">
            <dxe:ASPxMemo runat="server" ID="notesEditor" EnableClientSideAPI="true" Width="200px" Height="150px"></dxe:ASPxMemo>
        </dxpc:PopupControlContentControl></ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" AutoGenerateColumns="False" Width="50%">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="0">
                <EditFormSettings VisibleIndex="0" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="1">
                <EditFormSettings VisibleIndex="1" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="3">
                <EditFormSettings VisibleIndex="2" ColumnSpan="2" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataMemoColumn FieldName="Notes" Visible="False">
            </dxwgv:GridViewDataMemoColumn>
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="2">
                <EditFormSettings VisibleIndex="3" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="4">
                <EditFormSettings VisibleIndex="4" />
            </dxwgv:GridViewDataColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords"/>
        <ClientSideEvents ContextMenu="function(s, e) {  OnContextMenu(e); }" />
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]"> 
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>