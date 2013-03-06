<%@ Control language="C#" Inherits="DotNetNuke.Modules.Socios_Redirector.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>
<asp:Panel ID="pnlLog" runat="server" Visible="false">

<h2>Test Urls</h2>
For <b>FlexiAuction:</b> <b><a href="http://frontend.sociosproject.eu/Redirector.aspx?type=1&auc=2">http://frontend.sociosproject.eu/Redirector.aspx?type=1&auc=2</a></b>
<br />
<br />

For <b>G4C:</b>    <b><a href="http://frontend.sociosproject.eu/Redirector.aspx?type=2">http://frontend.sociosproject.eu/Redirector.aspx?type=2</a></b>
<br />
<br />
<h2>User service test</h2>
<asp:LinkButton ID="lnkbtnGetUserinfo" runat="server" 
    onclick="lnkbtnGetUserinfo_Click">Get user info (no parameters)</asp:LinkButton>
<br />

<h2>Result</h2>
<asp:Label ID="lblRedirectTo" runat="server" Text="You would have been redirected to:"></asp:Label> <b><asp:HyperLink ID="hprlnk_redirectTo" runat="server">Nowhere</asp:HyperLink></b>
<br />




<br /><!--However for testing purposes automatic redirection has been disabled. Click on the link to continue.-->
<p>
<b>Log</b><br />
<asp:Label ID="lblLog" runat="server" Text="..."></asp:Label></p>
</asp:Panel>
<asp:Panel ID="pnlPlayer" runat="server">
<h2 style="text-align: center;">Welcome  
    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>!</h2>
<p style="text-align: center;">Click on the button below to start playing right away!</p> 
<div class="g4cLink">
<p style="text-align: center;"><asp:HyperLink ID="hprlnk_goToGamesForCrowds" runat="server" Target="_blank">
    <asp:Image ID="Image2" ImageUrl="../Socios_Scenario1/Images/playCastingGamesClr.png" runat="server" />
    </asp:HyperLink></p>
</div>
</asp:Panel>