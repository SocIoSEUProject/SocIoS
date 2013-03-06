<%@ Control Language="C#" Inherits="DotNetNuke.Modules.Socios_MediaSearch.View" AutoEventWireup="false"
    CodeBehind="View.ascx.cs" %>
<table>
    <tr>
        <td valign="top">
            <div>
                <h1>
                    Media results</h1>
                    <div id="media-results-pane">
                        <asp:Literal ID="Ltrl_HttpGet" runat="server"></asp:Literal>
                    </div>
            </div>
        </td>
        <td>
            <div>
               <h2>Generic</h2>
                   
                            <asp:CheckBox ID="CheckBox1" Text="Keywords" runat="server" />
                      <br />
                            <asp:CheckBox ID="CheckBox2" Text="Owner" runat="server" />
                      <br />
                            <asp:CheckBox ID="CheckBox3" Text="Licenses" runat="server" />
                       <br />
                            <asp:CheckBox ID="CheckBox4" Text="Geolocation"  runat="server" />
                        <br />
                            <asp:CheckBox ID="CheckBox5" Text="Date" runat="server" />
                    
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:TextBox ID="TextBox2"
                                runat="server"></asp:TextBox>
                       
            </div>
            <div>
            <h2>Source</h2>
                    <asp:CheckBox ID="CheckBox6" Text="FlickR" runat="server" />
                      <br />
                            <asp:CheckBox ID="CheckBox7" Text="Dailymotion" runat="server" />
                      <br />
                            <asp:CheckBox ID="CheckBox8" Text="YouTube" runat="server" />
                       <br />
                            <asp:CheckBox ID="CheckBox9" Text="Twitter" runat="server" />
                        <br />
                            <asp:CheckBox ID="CheckBox10" Text="Facebook" runat="server" />
                            <br />
                            <asp:CheckBox ID="CheckBox11" Text="MySpace" runat="server" />
            </div>
        </td>
    </tr>
</table>
