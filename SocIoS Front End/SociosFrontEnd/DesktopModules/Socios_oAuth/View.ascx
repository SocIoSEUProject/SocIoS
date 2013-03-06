<%@ Control Language="C#" Inherits="DotNetNuke.Modules.Socios_oAuth.View" AutoEventWireup="false"
    CodeBehind="View.ascx.cs" %>
<h2>
    Linking Your Social Network Accounts</h2>
 
<div class="dnnFormMessage  dnnFormInfo">
   

    <asp:Label ID="lblOAuthInfoJournalists" runat="server" Text="">
    Socios accesses information from Social Networks on your behalf. Use the links below
    to grant Socios your permission for each Social Network.<br />
    <br />
    This process will enable you to connect your favourite Social Media Platform account
    with your SocIoS account. This means that you will be able to directly retrieve
    the list of connected users' display names and apply upon them the typical SocIoS
    functionality. Alternatively, you can directly search for them one-by-one using
    the search functionality.
    </asp:Label>

    <asp:Label ID="lblOAuthInfoCandidates" runat="server" Text="">
   Authenticate to the Social Networks that contain personal videos/photos of yours that you want to include in your role application.
   <br /><br />

<i>You need to authenticate to <b>at least one</b> in order to complete your application.</i>

   </asp:Label>



</div>
<div>

   
    
    <div class="sns_verify_wrapper" style="display: none;" runat="server" id="div_youtube_wrapper">
        &nbsp;</div>
    <div class="refreshWrapper">
        <b>
            <asp:LinkButton ID="lnkbtn_RefreshTokens" runat="server" CssClass="refreshBtn" OnClick="lnkbtn_RefreshTokens_Click">Refresh Tokens</asp:LinkButton></b></div>
    <div class="cleared"></div>
    <table class="authorizeSnsWrapper" cellspacing="0" cellpadding="0">
        <tr runat="server" id="rowYoutube">
            <td width="50">
                <div runat="server" id="div_youtube_status" class="youtube_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    YouTube</h2>
                <asp:LinkButton ID="lnkbtn_YouTube" runat="server" OnClick="lnkbtn_YouTube_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_YouTubeDeauthorize" Visible="false" runat="server" OnCommand="Deauthorize_Command"
                    CommandArgument="4">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_YouTubeSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    YouTube Authentication successful, your access token: <b>
                        <asp:Label ID="lbl_YouTubeAccessToken" runat="server"></asp:Label></b></asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowTwitter">
            <td>
                <div runat="server" id="div_twitter_status" class="twitter_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    Twitter</h2>
                <asp:LinkButton ID="lnkbtn_Twitter" runat="server" OnClick="lnkbtn_Twitter_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_TwitterDeauthorize" runat="server" Visible="false" OnCommand="Deauthorize_Command"
                    CommandArgument="3">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_TwitterSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    Twitter authentication successful, welcome <b>
                        <asp:Label ID="lblTwitterUsername" runat="server" Text="lblTwitterUsername"></asp:Label></b>!</asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowFacebook">
             <td width="50">
                <div runat="server" id="div_facebook_status" class="facebook_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    Facebook</h2>
                <asp:LinkButton ID="lnkbtn_Facebook" runat="server" OnClick="lnkbtn_Facebook_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_FacebookDeauthorize" runat="server" Visible="false" OnCommand="Deauthorize_Command"
                    CommandArgument="2">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_FacebookSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    Facebook authentication successful, welcome <b>
                        <asp:Label ID="lbl_FacebookAccessToken" runat="server"></asp:Label></b>!</asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowDailymotion">
            <td>
                <div runat="server" id="div_dailymotion_status" class="dailymotion_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    Dailymotion</h2>
                <asp:LinkButton ID="lnkbtn_Dailymotion" runat="server" OnClick="lnkbtn_Dailymotion_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_DailymotionDeauthorize" runat="server" Visible="false"
                    OnCommand="Deauthorize_Command" CommandArgument="6">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_DailymotionSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    Dailymotion authentication successful, welcome <b>
                        <asp:Label ID="lbl_DailymotionAccessToken" runat="server"></asp:Label>
                    </b>!</asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowFlickr">
            <td>
                <div runat="server" id="div_flickr_status" class="flickr_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    FlickR</h2>
                <asp:LinkButton ID="lnkbtn_Flickr" runat="server" OnClick="lnkbtn_Flickr_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_FlickrDeauthorize" runat="server" Visible="false" OnCommand="Deauthorize_Command"
                    CommandArgument="1">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_FlickrSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    FlickR authentication successful, welcome <b>
                        <asp:Label ID="lbl_FlickrAccessToken" runat="server"></asp:Label></b>!
                </asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowMySpace">
            <td>
                <div runat="server" id="div_myspace_status" class="myspace_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    MySpace</h2>
                <asp:LinkButton ID="lnkbtn_Myspace" runat="server" OnClick="lnkbtn_Myspace_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_MyspaceDeauthorize" runat="server" Visible="false" OnCommand="Deauthorize_Command"
                    CommandArgument="7">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_MySpaceSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    MySpace authentication successful, welcome <b>
                        <asp:Label ID="lbl_MyspaceAccessToken" runat="server"></asp:Label></b>!
                </asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowInstagram">
            <td>
                <div runat="server" id="div_instagram_status" class="instagram_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    Instagram</h2>
                <asp:LinkButton ID="lnkbtn_Instagram" runat="server" OnClick="lnkbtn_Instagram_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="lnkbtn_InstagramDeauthorize" runat="server" Visible="false" OnCommand="Deauthorize_Command"
                    CommandArgument="8">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_InstagramSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    Instagram authentication successful, welcome <b>
                        <asp:Label ID="lbl_InstagramUsername" runat="server"></asp:Label></b>!
                </asp:Panel>
            </td>
        </tr>
        <tr runat="server" id="rowGoogleP">
            <td>
                <div runat="server" id="div_googlep_status" class="googlep_inactive">
                </div>
            </td>
            <td class="authBtnWrap">
                <h2>
                    Google+</h2>
                <asp:LinkButton ID="lnkbtn_GooglePlusContacts" runat="server" OnClick="lnkbtn_GooglePlusContacts_Click">Authorize</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" Visible="false" runat="server" OnCommand="Deauthorize_Command"
                    CommandArgument="4">Deauthorize</asp:LinkButton>
            </td>
            <td>
                <asp:Panel ID="pnl_GooglePlusContactsSuccess" Visible="false" CssClass="dnnFormMessage dnnFormSuccess"
                    runat="server">
                    GooglePlus authentication successful, welcome <b>
                        <asp:Label ID="lbl_GooglePlusContactsAccessToken" runat="server"></asp:Label></b>!
                </asp:Panel>
            </td>
        </tr>
    </table>
    <div class="cleared">
    </div>
    <asp:Panel ID="pnlCandidateGoToMediaSearch" class="sociosPanel" runat="server"> <h2>Great! You are ready to select your videos/photos.</h2>

 Go back to the <b><a href="http://frontend.sociosproject.eu/SociosTools.aspx?v=1">Media Selection</a></b> page or authenticate to more social networks above.

    </asp:Panel>
 

</div>
