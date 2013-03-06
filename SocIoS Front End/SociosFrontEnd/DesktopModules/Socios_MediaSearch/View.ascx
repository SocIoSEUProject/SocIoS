<%@ Control Language="C#" Inherits="DotNetNuke.Modules.Socios_MediaSearch.View" AutoEventWireup="false"
    CodeBehind="View.ascx.cs" %>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {

        $(".media-details-trigger").click(
            function () {

                //                $("#details-container").html($(this).parent().prev().html());
                //                $('html').animate({
                //                    scrollTop: $("#media-item-details-wrapper").offset().top
                //                }, 500);
            }
            );
    });
</script>
<table>
    <tr>
        <td valign="top" width="60%">
            <h4>
                Media Search</h4>
            <div id="media-item-details-wrapper">
                <div id="details-container-renamedtoavoidjquery">
                    <asp:ListView ID="lstvw_MediaItemDetails" runat="server" OnItemCommand="lstvw_MediaItems_ItemCommand">
                        <ItemTemplate>
                            <div class="media-item-wrapper">
                                <div class="media-item">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <div class="media-item-<%# Eval("sns_id")%>">
                                                </div>
                                                <div class="media-item-title">
                                                    <b><a href="<%# Eval("url")%>">
                                                        <%# Eval("title")%></a></b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <div class="media-item-details-left">
                                                    <a href="<%# Eval("url")%>">
                                                        <img src="<%# Eval("thumbnail_url")%>" width="180" alt="Thumbnail" />
                                                    </a>
                                                    <br />
                                                    <br />
                                                    Translate from:<br />
                                                    <asp:DropDownList ID="ddl_translateFrom" runat="server">
                                                        <asp:ListItem Text="Auto detect" Value="detect"></asp:ListItem>
                                                        <asp:ListItem Text="English" Value="en"></asp:ListItem>
                                                        <asp:ListItem Text="Italian" Value="it"></asp:ListItem>
                                                        <asp:ListItem Text="French" Value="fr"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    to
                                                    <asp:DropDownList ID="ddl_translateTo" runat="server">
                                                        <asp:ListItem Text="English" Value="en"></asp:ListItem>
                                                        <asp:ListItem Text="Italian" Value="it"></asp:ListItem>
                                                        <asp:ListItem Text="French" Value="fr"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="btn_translateMediaItem" CommandName="TranslateMediaItem" runat="server"
                                                        Text="Translate" />
                                                    <asp:Panel ID="pnl_Info" Visible="false" CssClass="success" runat="server">
                                                        <asp:Label ID="lbl_Info" runat="server" Text=""></asp:Label>
                                                    </asp:Panel>
                                                    <br />
                                                    <br />
                                                    <span style="font-size:10px;">Translation powered by the<br /><a style="font-size:10px;" href="http://epart.atc.gr:8080/SociosTranslateObject/TranslateService">Socios Translation Service</a></span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="media-details-wrapper">
                                                    <b>Owner name:</b>
                                                    <%# Eval("owner_name")%><br />
                                                    <b>Date uploaded:</b>
                                                    <%# Eval("date_uploaded")%><br />
                                                    <b>Date created:</b>
                                                    <%# Eval("date_created")%><br />
                                                    <b>Location:</b> <br />&nbsp;&nbsp;<b>Lat:</b>
                                                    <%# Eval("lat")%><br />
                                                    &nbsp;&nbsp;<b>Lon:</b>
                                                    <%# Eval("lon")%><br />
                                                    <b>VideoID:</b>
                                                    <%# Eval("videoID")%><br />
                                                    <b>Description:</b>
                                                    <asp:Label ID="lbl_description" runat="server" Text='<%# Eval("description")%>'></asp:Label><br />
                                                    <b>License:</b>
                                                    <%# Eval("license")%><br />
                                                    <b>Category:</b>
                                                    <%# Eval("category")%><br />
                                                    <b>Url:</b> <a href="<%# Eval("url")%> ">Go to media item</a><br />
                                                    <b>Number of votes:</b><br /><b>Number of comments:</b><br /><b>Type:</b>
                                                    <%# Eval("type")%><br />
                                                    <b>Owner id:</b>
                                                    <%# Eval("owner_id")%><br />
                                                    <b>Tags:</b>
                                                    <%# Eval("tags")%><br />
                                                    <b>Views:</b>
                                                    <%# Eval("views")%><br />
                                                   
                                                   
                                                    <b>Start time:</b><br /><b>Tagged people:</b><br /><b>Rating:</b><br />
                                                    <%# Eval("rating")%><br />
                                                    <b>Thumbnail URL:</b>
                                                    <%# Eval("thumbnail_url")%><br />
                                                    <b>Duration:</b><br />
                                                    <b>Language:</b><br />
                                                    <b>AlbumID:</b><br />
                                                    <b>File size:</b><br />
                                                    <b>Mime type:</b>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <%-- <iframe title="YouTube video player" width="480" height="390" src="<%# Eval("url")%>" frameborder="0"></iframe>--%>
                                </div>
                                <%--  <div class="media-item-summary">
                       <div class="media-item-<%# Eval("sns_id")%>"></div><div class="media-item-title"><b><%# Eval("title")%></b></div>
                          <img  class="media-details-trigger" src="<%# Eval("thumbnail_url")%>" width="180" alt="Thumbnail" />
                   <br />
                       <b>ID:</b> <%# Eval("id")%><br />
                            <b>Owner name:</b> <%# Eval("owner_name")%><br />
                            <b>Date Uploaded:</b> <%# Eval("date_uploaded")%>
                         </div>--%>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div id="media-results-pane">
                <p>
                    <b>
                        <asp:Literal ID="Ltrl_SearchResultsPageInfo" runat="server"></asp:Literal></b>
                </p>
                <asp:ListView ID="lstvw_MediaItems" runat="server" GroupItemCount="3" OnItemCommand="lstvw_MediaItems_ItemCommand">
                    <GroupTemplate>
                        <div id="">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="media-item-wrapper">
                            <div class="media-item-hidden">
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <div class="media-item-<%# Eval("sns_id")%>">
                                            </div>
                                            <div class="media-item-title">
                                                <b>
                                                    <%# Eval("title")%></b></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <img src="<%# Eval("thumbnail_url")%>" width="180" alt="Thumbnail" />
                                            <br />
                                            <asp:Button ID="btn_translateMediaItem" CommandName="TranslateMediaItem" runat="server"
                                                Text="Button" />
                                        </td>
                                        <td>
                                            <div class="media-details-wrapper">
                                                <b>Owner name:</b>
                                                <%# Eval("owner_name")%><br />
                                                <b>Date uploaded:</b>
                                                <%# Eval("date_uploaded")%><br />
                                                <b>Date created:</b>
                                                <%# Eval("date_created")%><br />
                                                <b>Lat:</b>
                                                <%# Eval("lat")%><br />
                                                <b>Lon:</b>
                                                <%# Eval("lon")%><br />
                                                <b>VideoID:</b>
                                                <%# Eval("videoID")%><br />
                                                <b>Description:</b>
                                                <asp:Label ID="lbl_description" runat="server" Text='<%# Eval("description")%>'></asp:Label><br />
                                                <b>License:</b>
                                                <%# Eval("license")%><br />
                                                <b>Category:</b>
                                                <%# Eval("category")%><br />
                                                <b>Url:</b> <a href="<%# Eval("url")%> ">Url</a><br />
                                                <b>Type:</b>
                                                <%# Eval("type")%><br />
                                                <b>Owner id:</b>
                                                <%# Eval("owner_id")%><br />
                                                <b>Tags:</b>
                                                <%# Eval("tags")%><br />
                                                <b>Views:</b>
                                                <%# Eval("views")%><br />
                                                <b>Height:</b>
                                                <%# Eval("height")%><br />
                                                <b>Width:</b>
                                                <%# Eval("width")%><br />
                                                <b>Rating:</b>
                                                <%# Eval("rating")%><br />
                                                <b>Thumbnail URL:</b>
                                                <%# Eval("thumbnail_url")%>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <%-- <iframe title="YouTube video player" width="480" height="390" src="<%# Eval("url")%>" frameborder="0"></iframe>--%>
                            </div>
                            <div class="media-item-summary">
                                <div class="media-item-<%# Eval("sns_id")%>">
                                </div>
                                <div class="media-item-title">
                                    <b>
                                        <%# Eval("title")%></b></div>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ViewMediaItemDetails"
                                    CommandArgument='<%# Eval("id")%>'><img  class="media-details-trigger" src="<%# Eval("thumbnail_url")%>" width="180" alt="Thumbnail" />
                                </asp:LinkButton><br />
                                <b>Owner name:</b>
                                <%# Eval("owner_name")%><br />
                                <b>Date Uploaded:</b>
                                <%# Eval("date_uploaded")%>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <div id="groupPlaceholder" runat="server">
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <div style="">
                            <%--   <asp:DataPager ID="DataPager1" runat="server" PageSize="7">
                                                <Fields>

        <asp:NumericPagerField ButtonType="Button" NextPageText="more.." />

        </Fields>
                                                </asp:DataPager>--%>
                        </div>
                    </LayoutTemplate>
                    <GroupSeparatorTemplate>
                        <div class="media-item-group-separator" style="clear: both">
                        </div>
                    </GroupSeparatorTemplate>
                </asp:ListView>
                <asp:Button ID="Btn_PreviousPage" runat="server" Text="Previous" OnCommand="Btn_PreviousPage_Command" />
                <asp:Button ID="Btn_NextPage" runat="server" Text="Next" OnCommand="Btn_NextPage_Command" />
            </div>
        </td>
        <td valign="top" width="30%">
            <div id="search-form">
                <h4>
                    Generic</h4>
                Keywords:<br />
                <asp:TextBox ID="Txt_SearchQuery" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RqFldVld_Query" runat="server" ErrorMessage="Please enter at least one word<br/>"
                    Display="Dynamic" ControlToValidate="Txt_SearchQuery"></asp:RequiredFieldValidator>
                Owner:<br />
                <asp:TextBox ID="Txt_SearchOwner" runat="server"></asp:TextBox><br />
                License:<br />
                <asp:TextBox ID="Txt_SearchLicense" runat="server"></asp:TextBox><br />
                Latitude:<br />
                <asp:TextBox ID="Txt_SearchLatitude" runat="server"></asp:TextBox><br />
                Longitude:<br />
                <asp:TextBox ID="Txt_SearchLongitude" runat="server"></asp:TextBox><br />
                <b>
                    <asp:Literal ID="Ltrl_SearchResultsInfo1" runat="server"></asp:Literal></b>
                <asp:CheckBox ID="Chkbx_Deserialize" runat="server" Checked="True" Text="Deserialize results" /><br />
                <asp:CheckBox ID="Chkbx_UseProxy" runat="server" Text="Use Proxy" /><br />
                <asp:CheckBox ID="Chkbx_UseLocal" runat="server" Text="Use locally stored response" />
                <p id="search-button-wrapper">
                    <asp:Button ID="Btn_SearchMedia" runat="server" Text="Search" CommandArgument="2"
                        OnClick="Btn_SearchMedia_Click" /></p>
                <p>
                    <asp:Literal ID="Ltrl_ServiceURL" runat="server"></asp:Literal>
                </p>
                <h4>
                    Filter Results</h4>
                <asp:RadioButtonList ID="RdbtnLst_FilterSNS" runat="server">
                    <asp:ListItem Selected="True" Value="all">All</asp:ListItem>
                    <asp:ListItem Value="youtube">YouTube</asp:ListItem>
                    <asp:ListItem Value="flickr">FlickR</asp:ListItem>
                    <asp:ListItem Value="dailymotion">DailyMotion</asp:ListItem>
                </asp:RadioButtonList>
                Query ID:<br />
                <asp:TextBox ID="Txt_Query_ID" runat="server" Enabled="false"></asp:TextBox><br />
                Title:<br />
                <asp:TextBox ID="Txt_Title" runat="server"></asp:TextBox><br />
                Owner name:<br />
                <asp:TextBox ID="Txt_Owner_name" runat="server"></asp:TextBox><br />
                Date uploaded:<br />
                <asp:TextBox ID="Txt_Date_uploaded" runat="server"></asp:TextBox><br />
                Date created:<br />
                <asp:TextBox ID="Txt_Date_created" runat="server"></asp:TextBox><br />
                Latitude:<br />
                <asp:TextBox ID="Txt_Lat" runat="server"></asp:TextBox><br />
                Longitude:<br />
                <asp:TextBox ID="Txt_Lon" runat="server"></asp:TextBox><br />
                Item id:<br />
                <asp:TextBox ID="Txt_Item_id" runat="server"></asp:TextBox><br />
                Description:<br />
                <asp:TextBox ID="Txt_Description" runat="server"></asp:TextBox><br />
                License:<br />
                <asp:TextBox ID="Txt_License" runat="server"></asp:TextBox><br />
                Category:<br />
                <asp:TextBox ID="Txt_Category" runat="server"></asp:TextBox><br />
                Url:<br />
                <asp:TextBox ID="Txt_Url" runat="server"></asp:TextBox><br />
                Type:<br />
                <asp:TextBox ID="Txt_Type" runat="server"></asp:TextBox><br />
                Owner:<br />
                <asp:TextBox ID="Txt_Owner_id" runat="server"></asp:TextBox><br />
                Tags<br />
                <asp:TextBox ID="Txt_Tags" runat="server"></asp:TextBox><br />
                Views<br />
                <asp:TextBox ID="Txt_Views" runat="server"></asp:TextBox><br />
                Height<br />
                <asp:TextBox ID="Txt_Height" runat="server"></asp:TextBox><br />
                Width<br />
                <asp:TextBox ID="Txt_Width" runat="server"></asp:TextBox><br />
                Rating<br />
                <asp:TextBox ID="Txt_Rating" runat="server"></asp:TextBox><br />
                Thumbnail Url<br />
                <asp:TextBox ID="Txt_Thumbnail_url" runat="server"></asp:TextBox><br />
                <asp:Button ID="Btn_FilterMedia" runat="server" Text="Filter" OnClick="Btn_FilterMedia_Click" />
                <%-- <asp:CheckBox ItagsD="CheckBox1" Text="Keywords" runat="server" />
            <br />             views
            <asp:CheckBox ID="CheightheckBox2" Text="Owner" runat="server" />
            <br />             width
            <asp:CheckBox ID="CratingheckBox6" Text="FlickR" runat="server" />
            <br />             thumbnail_url
            <asp:CheckBox ID="CheckBox7" Text="Dailymotion" runat="server" />
            <br />
            <asp:CheckBox ID="CheckBox8" Text="YouTube" runat="server" />
            <br />
            <asp:CheckBox ID="CheckBox9" Text="Twitter" runat="server" />
            <br />
            <asp:CheckBox ID="CheckBox10" Text="Facebook" runat="server" />
            <br />
            <asp:CheckBox ID="CheckBox11" Text="MySpace" runat="server" />
            <br />--%>
            </div>
        </td>
    </tr>
</table>
