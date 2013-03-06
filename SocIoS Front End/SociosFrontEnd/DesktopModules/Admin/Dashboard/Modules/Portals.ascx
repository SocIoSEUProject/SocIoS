﻿<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.Dashboard.Controls.Portals" CodeFile="Portals.ascx.cs" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<div class="dnnForm dnnPortals dnnClear">
    <asp:DataGrid ID="grdPortals" runat="server" GridLines="None" AutoGenerateColumns="false" EnableViewState="False" CssClass="dnnGrid">
        <headerstyle cssclass="dnnGridHeader" verticalalign="Top" />
        <ItemStyle cssclass="dnnGridItem" horizontalalign="Left" />
        <AlternatingItemStyle cssclass="dnnGridAltItem" />
        <footerstyle cssclass="dnnGridFooter" />
        <pagerstyle cssclass="dnnGridPager" />
        <Columns>
            <asp:BoundColumn DataField="PortalName" HeaderText="PortalName" ItemStyle-Width="200px"/>
            <asp:BoundColumn DataField="GUID" HeaderText="GUID" ItemStyle-Width="300px"/>
            <asp:BoundColumn DataField="Pages" HeaderText="Pages" ItemStyle-Width="100px"/>
            <asp:BoundColumn DataField="Roles" HeaderText="Roles" ItemStyle-Width="100px"/>
            <asp:BoundColumn DataField="Users" HeaderText="Users" ItemStyle-Width="100px" />
        </Columns>
    </asp:DataGrid>
</div>