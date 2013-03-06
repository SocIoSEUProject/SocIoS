<%@ Control language="C#" Inherits="DotNetNuke.Modules.Socios_Integration.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>
Integration Module
<h1>Flexiprice
</h1>

<div>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Test Flexiprice" />

        <asp:Label ID="lbl_Response" runat="server" Text=""></asp:Label>

</div>
<asp:HyperLink ID="hprlnk_flexipriceGetTransactions" runat="server">HyperLink</asp:HyperLink>