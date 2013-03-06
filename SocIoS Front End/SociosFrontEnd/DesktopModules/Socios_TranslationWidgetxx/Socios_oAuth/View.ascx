<%@ Control Language="C#" Inherits="DotNetNuke.Modules.Socios_oAuth.View" AutoEventWireup="false"
    CodeBehind="View.ascx.cs" %>
<div>
    Socios accesses information from Social Networks on your behalf. Use the links below
    to grant Socios your permission for each Social Network. 
    <b><asp:LinkButton ID="lnkbtn_RefreshTokens" runat="server" 
        onclick="lnkbtn_RefreshTokens_Click">Refresh Tokens</asp:LinkButton></b>
    <%-- 
     <asp:ListView ID="ListView1" runat="server" DataKeyNames="tokenID" 
         DataSourceID="sqldtsrc_YouTubeAccessToken" EnableModelValidation="True" 
         Visible="False">
         <AlternatingItemTemplate>
             <tr style="">
                 <td>
                     <asp:Label ID="tokenIDLabel" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="ProviderIDLabel" runat="server" 
                         Text='<%# Eval("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="AccessTokenLabel" runat="server" 
                         Text='<%# Eval("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                 </td>
             </tr>
         </AlternatingItemTemplate>
         <EditItemTemplate>
             <tr style="">
                 <td>
                     <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                         Text="Update" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Cancel" />
                 </td>
                 <td>
                     <asp:Label ID="tokenIDLabel1" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="ProviderIDTextBox" runat="server" 
                         Text='<%# Bind("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="AccessTokenTextBox" runat="server" 
                         Text='<%# Bind("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                 </td>
             </tr>
         </EditItemTemplate>
         <EmptyDataTemplate>
             <table runat="server" style="">
                 <tr>
                     <td>
                         No data was returned.</td>
                 </tr>
             </table>
         </EmptyDataTemplate>
         <InsertItemTemplate>
             <tr style="">
                 <td>
                     <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                         Text="Insert" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Clear" />
                 </td>
                 <td>
                     <asp:TextBox ID="tokenIDTextBox" runat="server" Text='<%# Bind("tokenID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="ProviderIDTextBox" runat="server" 
                         Text='<%# Bind("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="AccessTokenTextBox" runat="server" 
                         Text='<%# Bind("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                 </td>
             </tr>
         </InsertItemTemplate>
         <ItemTemplate>
             <tr style="">
                 <td>
                     <asp:Label ID="tokenIDLabel" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="ProviderIDLabel" runat="server" 
                         Text='<%# Eval("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="AccessTokenLabel" runat="server" 
                         Text='<%# Eval("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                 </td>
             </tr>
         </ItemTemplate>
         <LayoutTemplate>

         <b>YouTube Access Token</b>
             <table runat="server">
                 <tr runat="server">
                     <td runat="server">
                         <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                             <tr runat="server" style="">
                                 <th runat="server">
                                     tokenID</th>
                                 <th runat="server">
                                     ProviderID</th>
                                 <th runat="server">
                                     AccessToken</th>
                                 <th runat="server">
                                     UserID</th>
                                 <th runat="server">
                                     Date</th>
                             </tr>
                             <tr ID="itemPlaceholder" runat="server">
                             </tr>
                         </table>
                     </td>
                 </tr>
                 <tr runat="server">
                     <td runat="server" style="">
                     </td>
                 </tr>
             </table>
         </LayoutTemplate>
         <SelectedItemTemplate>
             <tr style="">
                 <td>
                     <asp:Label ID="tokenIDLabel" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="ProviderIDLabel" runat="server" 
                         Text='<%# Eval("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="AccessTokenLabel" runat="server" 
                         Text='<%# Eval("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                 </td>
             </tr>
         </SelectedItemTemplate>
     </asp:ListView>--%>
    <div class="sns_verify_wrapper" runat="server" id="div_youtube_wrapper">
        &nbsp;</div>
    <table>
        <tr>
            <td>
                <div runat="server" id="div_youtube_status" class="youtube_inactive">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="lnkbtn_YouTube" runat="server" OnClick="lnkbtn_YouTube_Click">Authorize YouTube</asp:LinkButton>
            </td>
            <td>
            <asp:Panel ID="pnl_YouTubeSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess" runat="server">YouTube Authentication successful, your access token: <b><asp:Label ID="lbl_YouTubeAccessToken" runat="server"></asp:Label></b></asp:Panel>
                
            </td>
            
        </tr>
        <tr>
            <td>
                <div runat="server" id="div_twitter_status" class="twitter_inactive">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="lnkbtn_Twitter" runat="server" OnClick="lnkbtn_Twitter_Click">Authorize Twitter</asp:LinkButton>
            </td>
            <td>
            
                <asp:Panel ID="pnl_TwitterSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess" runat="server">Twitter authentication successful, welcome <b><asp:Label ID="lblTwitterUsername" runat="server" Text="lblTwitterUsername"></asp:Label></b>!</asp:Panel>

            </td>
           
        </tr>
        <tr>
            <td>
                <div runat="server" id="div_facebook_status" class="facebook_inactive">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="lnkbtn_Facebook" runat="server" OnClick="lnkbtn_Facebook_Click">Authorize Facebook</asp:LinkButton>
            </td>
            <td>
            <asp:Panel ID="pnl_FacebookSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess" runat="server">Facebook authentication successful, welcome <b><asp:Label ID="lbl_FacebookAccessToken" runat="server"></asp:Label>
           </b>!</asp:Panel> </td>
          
        </tr>
        <tr>
            <td>
                <div runat="server" id="div_dailymotion_status" class="dailymotion_inactive">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkbtn_Dailymotion_Click">Authorize Dailymotion</asp:LinkButton>
            </td>
            <td>


             <asp:Panel ID="pnl_DailymotionSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess" runat="server">Dailymotion authentication successful, welcome <b><asp:Label ID="lbl_DailymotionAccessToken" runat="server"></asp:Label>
            </b>!</asp:Panel></td>
           
        </tr>
        <tr>
            <td>
                <div runat="server" id="div_flickr_status" class="flickr_inactive">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="lnkbtn_Flickr" runat="server" OnClick="lnkbtn_Flickr_Click">Authorize FlickR</asp:LinkButton>
            </td>
            <td>
                 <asp:Panel ID="pnl_FlickrSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess" runat="server">FlickR authentication successful, welcome <b><asp:Label ID="lbl_FlickrAccessToken" runat="server"></asp:Label></b>!
           </asp:Panel> </td>
         
        </tr>
        <tr>
            <td>
                <div runat="server" id="div_myspace_status" class="myspace_inactive">
                </div>
            </td>
            <td>
                <asp:LinkButton ID="lnkbtn_Myspace" runat="server" OnClick="lnkbtn_Myspace_Click">Authorize MySpace</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_MySpaceSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess" runat="server">MySpace authentication successful, welcome <b><asp:Label ID="lbl_MyspaceAccessToken" runat="server"></asp:Label></b>!
                </asp:Panel>
               
            </td>
          
        </tr>
    </table>
    <div class="cleared">
    </div>
    <%--     <asp:ListView ID="ListView2" runat="server" DataKeyNames="tokenID" 
         DataSourceID="sqldtsrc_TwitterAccessToken" EnableModelValidation="True" 
         Visible="False">
         <AlternatingItemTemplate>
             <tr style="">
                 <td>
                     <asp:Label ID="tokenIDLabel" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="ProviderIDLabel" runat="server" 
                         Text='<%# Eval("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="AccessTokenLabel" runat="server" 
                         Text='<%# Eval("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                 </td>
             </tr>
         </AlternatingItemTemplate>
         <EditItemTemplate>
             <tr style="">
                 <td>
                     <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                         Text="Update" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Cancel" />
                 </td>
                 <td>
                     <asp:Label ID="tokenIDLabel1" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="ProviderIDTextBox" runat="server" 
                         Text='<%# Bind("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="AccessTokenTextBox" runat="server" 
                         Text='<%# Bind("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                 </td>
             </tr>
         </EditItemTemplate>
         <EmptyDataTemplate>
             <table runat="server" style="">
                 <tr>
                     <td>
                         No data was returned.</td>
                 </tr>
             </table>
         </EmptyDataTemplate>
         <InsertItemTemplate>
             <tr style="">
                 <td>
                     <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                         Text="Insert" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Clear" />
                 </td>
                 <td>
                     <asp:TextBox ID="tokenIDTextBox" runat="server" Text='<%# Bind("tokenID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="ProviderIDTextBox" runat="server" 
                         Text='<%# Bind("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="AccessTokenTextBox" runat="server" 
                         Text='<%# Bind("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                 </td>
             </tr>
         </InsertItemTemplate>
         <ItemTemplate>
             <tr style="">
                 <td>
                     <asp:Label ID="tokenIDLabel" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="ProviderIDLabel" runat="server" 
                         Text='<%# Eval("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="AccessTokenLabel" runat="server" 
                         Text='<%# Eval("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                 </td>
             </tr>
         </ItemTemplate>
         <LayoutTemplate>
         <b>Twitter Access Token</b>
             <table runat="server">
                 <tr runat="server">
                     <td runat="server">
                         <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                             <tr runat="server" style="">
                                 <th runat="server">
                                     tokenID</th>
                                 <th runat="server">
                                     ProviderID</th>
                                 <th runat="server">
                                     AccessToken</th>
                                 <th runat="server">
                                     UserID</th>
                                 <th runat="server">
                                     Date</th>
                             </tr>
                             <tr ID="itemPlaceholder" runat="server">
                             </tr>
                         </table>
                     </td>
                 </tr>
                 <tr runat="server">
                     <td runat="server" style="">
                     </td>
                 </tr>
             </table>
         </LayoutTemplate>
         <SelectedItemTemplate>
             <tr style="">
                 <td>
                     <asp:Label ID="tokenIDLabel" runat="server" Text='<%# Eval("tokenID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="ProviderIDLabel" runat="server" 
                         Text='<%# Eval("ProviderID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="AccessTokenLabel" runat="server" 
                         Text='<%# Eval("AccessToken") %>' />
                 </td>
                 <td>
                     <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                 </td>
             </tr>
         </SelectedItemTemplate>
     </asp:ListView>--%>
    <div class="cleared">
    </div>
    <%--<div id="fb-root">
    </div>
    <script>
          window.fbAsyncInit = function () {
              FB.init({
                  appId: '184169651646301',
                  status: true,
                  cookie: true,
                  xfbml: true,

              });
          };
          (function (d) {
              var js, id = 'facebook-jssdk'; if (d.getElementById(id)) { return; }
              js = d.createElement('script'); js.id = id; js.async = true;
              js.src = "//connect.facebook.net/en_US/all.js";
              d.getElementsByTagName('head')[0].appendChild(js);
          } (document));
    </script>
    <div class="fb-login-button">
        Login with Facebook</div>
    <div class="sns_verify_wrapper" runat="server" id="div_facebook_wrapper">
        &nbsp;</div>--%>
</div>
<%--<asp:SqlDataSource ID="sqldtsrc_YouTubeAccessToken" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" 
    SelectCommand="SELECT [tokenID], [ProviderID], [AccessToken], [UserID], [Date] FROM [Socios_AccessTokens] WHERE ([ProviderID] = @ProviderID)">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="ProviderID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_TwitterAccessToken" runat="server" 
    ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>" 
    SelectCommand="SELECT * FROM [Socios_AccessTokens] WHERE ([ProviderID] = @ProviderID)">
    <SelectParameters>
        <asp:Parameter DefaultValue="2" Name="ProviderID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>--%>
