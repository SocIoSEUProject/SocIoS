<%@ Control Language="C#" Inherits="DotNetNuke.Modules.Socios_RoleChecker.View" AutoEventWireup="false"
    CodeBehind="View.ascx.cs" %>
    <asp:Panel ID="pnlAll" runat="server">

<h1>
    What type of Socios user are you? </h1>

<div class="clear">
</div>
<div class="roleBlock">
    <h2>
        <asp:LinkButton ID="hprlnk_Jounalist" runat="server" 
            onclick="hprlnk_Jounalist_Click">Socios Journalist</asp:LinkButton></h2>
    <ul>
        <li>Search media items from various social networks </li>
        <li>Retrieve your contacts from various social networks </li>
        <li>Group your contacts </li>
        <li>Get most recent activities of contact groups </li>
    </ul>
</div>
<div class="roleBlock">
    <h2>
        <asp:LinkButton ID="hprlnk_Candidate" runat="server" onclick="hprlnk_Candidate_Click">Socios Candidate/ Producer</asp:LinkButton></h2>
    <ul>
        <li>Select your media items from various social networks to publish them to Games for
            Crowds </li>
    </ul>
</div>
<div class="roleBlock">
    <h2>
        <asp:LinkButton ID="hprlnk_Player" runat="server"  onclick="hprlnk_Player_Click">Socios Player</asp:LinkButton></h2>
    <ul>
        <li>Play on Games for Crowds</li>
    </ul>
</div>
<div class="clear">
</div>
</asp:Panel>
