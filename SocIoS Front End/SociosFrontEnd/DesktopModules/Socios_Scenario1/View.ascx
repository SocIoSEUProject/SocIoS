<%@ Control Language="C#" Inherits="DotNetNuke.Modules.Socios_Scenario1.View" AutoEventWireup="false"
    CodeBehind="View.ascx.cs" %>
<%@ Register Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls"
    TagPrefix="dnnweb" %>


<%--<asp:UpdatePanel ID="updtpnlWrap" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
<ContentTemplate>--%>


<asp:Panel ID="main_container" runat="server">
    <asp:UpdatePanel ID="updpnl_notification" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Label ID="lbl_Notification" runat="server" Visible="false" CssClass="green-info-box"
                Text="Message!"></asp:Label></ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinkButton ID="lnkbtn_MenuShowSearchMedia" runat="server" OnClick="lnkbtn_MenuShowSearchMedia_Click">
        <asp:Image ID="imgMediaSearch" ImageUrl="Images/searchMedia.png" runat="server" />
    </asp:LinkButton>&nbsp;&nbsp;
    <asp:LinkButton ID="lnkbtn_MenuShowManageGroups" runat="server" OnClick="lnkbtn_MenuShowManageGroups_Click">
        <asp:Image ID="imgManageGroups" ImageUrl="Images/manageGroups.png" runat="server" /></asp:LinkButton>
    &nbsp;&nbsp;<asp:LinkButton ID="lnkbtn_MenuShow" runat="server" OnClick="lnkbtn_MenuShowPoolOfContacts_Click">
        <asp:Image ID="imgPoolOfContacts" ImageUrl="Images/poolOfContacts.png" runat="server" />
    </asp:LinkButton>
     &nbsp;&nbsp;
    <asp:HyperLink ID="hprlnk_goToGamesForCrowds" runat="server" CssClass="hidden" Target="_blank"></asp:HyperLink>
    <asp:Image ID="Image2" ImageUrl="Images/playCastingGamesClr.png" runat="server" />
    
    <asp:HyperLink ID="hprlnk_goToFlexiauction" Target="_blank" style="float:right;" runat="server"> <asp:Image ID="Image1" ImageUrl="Images/gotoFlexiAuction.png" runat="server" /></asp:HyperLink>
    
    
    
   
    <asp:Panel ID="pnlFlexipriceInfo" CssClass="flexiprice-info-box" runat="server">
        <%--<b>Access tokens</b>
                <div>
                </div>
                <asp:Label ID="lbl_AccessInfo" runat="server" Text=""></asp:Label><br />
                <asp:LinkButton ID="lnkbtn_RefreshAccess" runat="server" OnClick="lnkbtn_RefreshAccess_Click">See My Access Tokens</asp:LinkButton>
                <hr />--%>
        
        <asp:Label ID="lblDigitalPurseWrap" runat="server" Text="">
        <div id="digitalPurseBalance">
            <h2  >
                <asp:Label ID="lblDigitalPurseBalance" runat="server" Text=""></asp:Label></h2>
        </div>
</asp:Label>

        <p id="digitalPurseDesc">
            <asp:Label ID="lbl_NoPendingTransactions" runat="server" Visible="false" Text="<b>No</b> pending transactions"></asp:Label>
            <asp:Label ID="lbl_PendingTransactions" runat="server" Visible="false" Text="<b>Pending</b> transactions"></asp:Label>
       <span class="flexiLink"><asp:HyperLink ID="hprlnk_goToFlexiprice" runat="server" Target="_blank">Go to Flexiprice</asp:HyperLink>
       </span>
       <span class="flexiLink"><%--<asp:HyperLink ID="hprlnk_goToFlexiauction" runat="server" Target="_blank"><b>Go to FlexiAuction</b></asp:HyperLink>--%>
        </span></p>
        
    </asp:Panel>
    <h2 id="currentTitle">
        <asp:Label ID="lblCurrentMediaSearchTitle" Visible="false" runat="server" Text=""></asp:Label><asp:Label
            ID="lblCurrentTitle" Visible="false" runat="server" Text=""></asp:Label></h2>
    <asp:Panel ID="pnl_ManageGroups" Visible="false" CssClass="pnl-manage-groups" runat="server">
        <div class="groups">
            <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
            <asp:Panel ID="pnl_IndividualGroupFunctions" runat="server" Visible="false">
                <b>
                    <asp:LinkButton ID="lnkbtn_BackToAllGroups" OnClick="lnkbtn_BackToAllGroups_Click"
                        runat="server">&lt;- Back to all groups</asp:LinkButton>
                </b>
            </asp:Panel>
            <asp:Panel ID="pnl_AllGroupFunctions" runat="server">
                <b>
                    <asp:LinkButton ID="lnkbtn_NewGroup" runat="server" OnClick="lnkbtn_NewGroup_Click">+ Add new Group</asp:LinkButton></b>
                -
                <asp:LinkButton ID="lnkbtn_LoadGroups" runat="server" OnClick="lnkbtn_MyGroups_Click">Refresh Groups</asp:LinkButton>
            </asp:Panel>
            <div class="cleared">
            </div>
            <div class="groups-wrap">
                <asp:Panel ID="pnl_NewGroup" Visible="false" runat="server">
                    <div class="generic-container new-group-wrap">
                        <h2>
                            New group</h2>
                        <table>
                            <tr>
                                <td>
                                    Title:
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_NewGroupTitle" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Description:
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_NewGroupDescription" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div style="text-align: right;">
                            <asp:LinkButton ID="lnkbtn_AddNewGroup" runat="server" OnClick="lnkbtn_AddNewGroup_Click">Add new Group</asp:LinkButton>
                        </div>
                    </div>
                </asp:Panel>
                <asp:ListView ID="lstvw_AllGroups" runat="server" OnItemCommand="lstvw_AllGroups_ItemCommand">
                    <EmptyDataTemplate>
                        <table id="Table5" runat="server" style="">
                            <tr>
                                <td>
                                    <div class="dnnFormMessage dnnFormInfo">
                                        No Groups found</div>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" border="0" class="groups-listview">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                            <div class="cleared">
                            </div>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="generic-container group-item">
                            <asp:LinkButton ID="lnkbtn_DeleteGroup" OnClientClick="if (confirm('Are you sure you want to delete this group?')) { return true; } else { return false;  }"
                                CssClass="delete-group-btn" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                CommandName="DeleteGroup"><img src="/DesktopModules/Socios_Scenario1/Images/delete.png" /></asp:LinkButton>
                            <h3>
                                <asp:Label ID="lbl_GroupTitle" runat="server" Text='<%#Eval("title")%>'></asp:Label>
                            </h3>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("description")%>'></asp:Label>
                            <div class="cleared">
                            </div>
                            <asp:Label ID="lbl_GroupId" Visible="false" runat="server" Text='<%#Eval("id.id")%>'></asp:Label>
                            <asp:Label ID="Label5" CssClass="hidden" runat="server" Text='<%#Eval("id.id")%>'></asp:Label>
                            <br />
                            <b>
                                <asp:LinkButton ID="lnkbtn_ShowGroupPeople" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                    CommandName="ShowPeopleInGroup">Manage Group</asp:LinkButton></b>
                            <div class="cleared">
                            </div>
                            <asp:Panel ID="pnl_IndividualGroupFunctions" Visible="false" runat="server">
                                <asp:LinkButton ID="lnkbtn_GetGroupActivities" runat="server" CommandName="GetGroupActivities"
                                    CommandArgument='<%#Eval("id.id")%>'>Get Group Latest Content</asp:LinkButton>
                                |
                                <asp:LinkButton ID="lnkbtn_GetLatestEvents" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                    CommandName="GetGroupLatestEvents">Get Group Latest Events</asp:LinkButton>
                            </asp:Panel>
                            <div class="cleared">
                            </div>
                            <asp:Panel ID="pnl_ManagePeople" runat="server" Visible="false">
                                <div class="people-wrap generic-container">
                                    <h3>
                                        Contacts in this Group</h3>
                                    <asp:ListView ID="lstvw_AllPeopleInGroup" runat="server" OnItemCommand="lstvw_AllPeople_ItemCommand">
                                        <EmptyDataTemplate>
                                            <table id="Table5" runat="server" style="">
                                                <tr>
                                                    <td>
                                                        There are no People on this group.
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <LayoutTemplate>
                                            <div id="itemPlaceholderContainer" runat="server" border="0" style="width: 100%">
                                                <div id="itemPlaceholder" runat="server">
                                                </div>
                                            </div>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <div class="person-item">
                                                <img src="DesktopModules/Socios_Scenario1/Images/<%# GetGroupMemberSource(Eval("id.source.Item"))%>.png" />
                                                <b>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("preferredUsername")%>'></asp:Label></b>
                                                (<span class="remove-from-group-link"><asp:LinkButton ID="lnkbtn_RemovePersonFromGroup"
                                                    runat="server" CommandArgument='<%# Eval("id.source.Item").ToString() + ":"  + Eval("id.id")%>'
                                                    CommandName="RemovePersonFromGroup">Remove</asp:LinkButton></span>)
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <div class="generic-container add-person-to-group-wrap">
                                        <h3>
                                            Add Contact to group</h3>
                                        <table>
                                            <tr>
                                                <td>
                                                    Username:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_NewPersonName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Network:
                                                </td>
                                                <td>
                                                    <dnnweb:DnnComboBox runat="server" ID="ddlAddGroupMemberSn">
                                                        <Items>
                                                           <%-- <dnnweb:DnnComboBoxItem Text="Twitter" Value="twitter" />--%>
                                                            <dnnweb:DnnComboBoxItem Text="FlickR" Value="flickr" />
                                                            <dnnweb:DnnComboBoxItem Text="Dailymotion" Value="dailymotion" />
                                                            <dnnweb:DnnComboBoxItem Text="YouTube" Value="youtube" />
                                                            <%-- <dnnweb:DnnComboBoxItem Text="Facebook" Value="facebook" />
                                                                    <dnnweb:DnnComboBoxItem Text="MySpace" Value="myspace" />--%>
                                                        </Items>
                                                    </dnnweb:DnnComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Panel ID="pnl_UserNotFound" CssClass="dnnFormMessage dnnFormInfo" runat="server"
                                                        Visible="false">
                                                        <asp:Label ID="lbl_UserNotFound" runat="server" Text="No such user could be found on"></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnl_UserFound" CssClass="dnnFormMessage dnnFormSuccess" runat="server"
                                                        Visible="false">
                                                        <asp:Label ID="lbl_UserFound" runat="server" Text="User added to group"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:LinkButton ID="lnkbtn_AddNewPerson" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                            CommandName="AddPersonToGroup">+ Add Contact to Group</asp:LinkButton>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="generic-container group-item group-item-alt">
                            <asp:LinkButton ID="lnkbtn_DeleteGroup" OnClientClick="if (confirm('Are you sure you want to delete this group?')) { return true; } else { return false;  }"
                                CssClass="delete-group-btn" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                CommandName="DeleteGroup"><img src="/DesktopModules/Socios_Scenario1/Images/delete.png" /></asp:LinkButton>
                            <h3>
                                <asp:Label ID="lbl_GroupTitle" runat="server" Text='<%#Eval("title")%>'></asp:Label>
                            </h3>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("description")%>'></asp:Label>
                            <div class="cleared">
                            </div>
                            <asp:Label ID="lbl_GroupId" Visible="false" runat="server" Text='<%#Eval("id.id")%>'></asp:Label>
                            <br />
                            <b>
                                <asp:LinkButton ID="lnkbtn_ShowGroupPeople" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                    CommandName="ShowPeopleInGroup">Manage Group</asp:LinkButton></b>
                            <div class="cleared">
                            </div>
                            <asp:Panel ID="pnl_IndividualGroupFunctions" Visible="false" runat="server">
                                <asp:LinkButton ID="lnkbtn_GetGroupActivities" runat="server" CommandName="GetGroupActivities"
                                    CommandArgument='<%#Eval("id.id")%>'>Show Latest Group Content</asp:LinkButton>
                                |
                                <asp:LinkButton ID="lnkbtn_GetLatestEvents" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                    CommandName="GetGroupLatestEvents">Show Group Content Highlights</asp:LinkButton>
                            </asp:Panel>
                            <div class="cleared">
                            </div>
                            <asp:Panel ID="pnl_ManagePeople" runat="server" Visible="false">
                                <div class="people-wrap generic-container">
                                    <h3>
                                        People in this Group</h3>
                                    <asp:ListView ID="lstvw_AllPeopleInGroup" runat="server" OnItemCommand="lstvw_AllPeople_ItemCommand">
                                        <EmptyDataTemplate>
                                            <table id="Table5" runat="server" style="">
                                                <tr>
                                                    <td>
                                                        There are no People on this group.
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <LayoutTemplate>
                                            <div id="itemPlaceholderContainer" runat="server" border="0" style="width: 100%">
                                                <div id="itemPlaceholder" runat="server">
                                                </div>
                                            </div>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <div class="person-item">
                                                <img src="DesktopModules/Socios_Scenario1/Images/<%# GetGroupMemberSource(Eval("id.source.Item").ToString())%>.png" />
                                                <b>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("preferredUsername")%>'></asp:Label></b>
                                                (<span class="remove-from-group-link"><asp:LinkButton ID="lnkbtn_RemovePersonFromGroup"
                                                    runat="server" CommandArgument='<%# Eval("id.source.Item").ToString() + ":"  + Eval("id.id")%>'
                                                    CommandName="RemovePersonFromGroup">Remove</asp:LinkButton></span>)
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <div class="generic-container add-person-to-group-wrap">
                                        <h3>
                                            Add Contact to group</h3>
                                        <table>
                                            <tr>
                                                <td>
                                                    Username:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_NewPersonName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Network:
                                                </td>
                                                <td>
                                                    <dnnweb:DnnComboBox runat="server" ID="ddlAddGroupMemberSn">
                                                        <Items>
                                                            <%--<dnnweb:DnnComboBoxItem Text="Twitter" Value="twitter" />--%>
                                                            <dnnweb:DnnComboBoxItem Text="FlickR" Value="flickr" />
                                                            <dnnweb:DnnComboBoxItem Text="Dailymotion" Value="dailymotion" />
                                                            <dnnweb:DnnComboBoxItem Text="YouTube" Value="youtube" />
                                                            <%-- <dnnweb:DnnComboBoxItem Text="Facebook" Value="facebook" />
                                                                    <dnnweb:DnnComboBoxItem Text="MySpace" Value="myspace" />--%>
                                                        </Items>
                                                    </dnnweb:DnnComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Panel ID="pnl_UserNotFound" CssClass="dnnFormMessage dnnFormInfo" runat="server"
                                                        Visible="false">
                                                        <asp:Label ID="lbl_UserNotFound" runat="server" Text="No such user could be found on"></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnl_UserFound" CssClass="dnnFormMessage dnnFormSuccess" runat="server"
                                                        Visible="false">
                                                        <asp:Label ID="lbl_UserFound" runat="server" Text="User added to group"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:LinkButton ID="lnkbtn_AddNewPerson" runat="server" CommandArgument='<%#Eval("id.id")%>'
                                            CommandName="AddPersonToGroup">+ Add Contact to Group</asp:LinkButton>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </AlternatingItemTemplate>
                </asp:ListView>
                <div class="cleared">
                </div>
            </div>
        </div>
        <div class="cleared">
        </div>
    </asp:Panel>
    <asp:Panel ID="pnl_MediaSearch" Visible="false" runat="server">
        <div id="search-wrap">
           
            <asp:Panel ID="pnl_SearchPanel" runat="server">
                <%--<asp:UpdatePanel ID="updpnl_SearchPanel" runat="server">
                <ContentTemplate>--%>
                    <div class="search-panel-space">
                    </div>
                    <div id="advancedSearchOptions">
                        <div id="SearchOptionsSocialNetworks">
                            <h4>
                                Social Networks</h4>
                            <ul class="searchFilterSn">
                                <li id="li_chkbxFacebookSearch" runat="server">
                                    <asp:CheckBox ID="chkbxFacebookSearch" Checked="true" runat="server"></asp:CheckBox><img
                                        title="Facebook" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/facebook.png">Facebook
                                </li>
                                 <li id="li_chkbxFlickRSearch" runat="server">
                                    <asp:CheckBox ID="chkbxFlickRSearch" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="FlickR" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/flickr.png">FlickR
                                </li>
                                 <li id="li_chkbxTwitterSearch" runat="server">
                                    <asp:CheckBox ID="chkbxTwitterSearch" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="Twitter" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/twitter.png">Twitter
                                </li>
                                <li id="li_chkbxYouTubeSearch" runat="server">
                                    <asp:CheckBox ID="chkbxYouTubeSearch" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="YouTube" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/youtube.png">YouTube
                                </li>
                            </ul>
                            <ul class="searchFilterSn">
                               <li id="li_chkbxDailymotionSearch" runat="server">
                                    <asp:CheckBox ID="chkbxDailymotionSearch" Checked="true" runat="server" Text="">
                                    </asp:CheckBox><img title="Dailymotion" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/dailymotion.png">Dailymotion
                                </li>
                                 <li id="li_chkbxMySpaceSearch" runat="server">
                                    <asp:CheckBox ID="chkbxMySpaceSearch" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="MySpace" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/myspace.png">MySpace
                                </li>
                                <li id="li_chkbxGooglePlusSearch" runat="server">
                                    <asp:CheckBox ID="chkbxGooglePlusSearch" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="Google+" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/googleplus.png">Google+
                                </li>
                                  <li id="li_chkbxInstagramSearch" runat="server">
                                    <asp:CheckBox ID="chkbxInstagramSearch" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="Instagram" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/instagram16x16.png">Instagram
                                </li>
                            </ul>
                        </div>

                        <asp:Panel ID="pnl_SearchOptionsLicense" CssClass="SearchOptionsLicense" runat="server">
                       

                        
                            <h4>
                                License</h4>
                            <ul class="searchFilterSn">
                                <li>
                                    <asp:RadioButton GroupName="searchLicense" Checked="true" ID="rdbtnAllLicenses" runat="server" />
                                    All Licenses </li>
                                <li>
                                    <asp:RadioButton ID="rdbtnCcLicense" GroupName="searchLicense" runat="server" />
                                    <img title="Creative Commons" width="16px" alt="" src="/DesktopModules/Socios_Scenario1/Images/cc.png">Creative
                                    Commons </li>
                            </ul>
 </asp:Panel>

                        <div id="SearchOptionsKeywords">
                            <h4>
                                Search</h4>
                                 <asp:Label ID="lblAuctionModeInfo" CssClass="auctionModeInfo" runat="server" Visible="false" Text=""></asp:Label>
                            <asp:Panel ID="pnlItemSelectionModeTop" runat="server" Visible="false" CssClass="pnlItemSelectionModeTop">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                               <ContentTemplate>
                                <asp:Button ID="btnGetUsersItems" runat="server" Text="Get my Videos & Photos" OnClick="btnGetUsersItems_Click" />
                            </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <div id="txtSearchTermsWrap">
                              <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                
                                <asp:TextBox ID="txtSearch" runat="server" Text=""></asp:TextBox>&nbsp;
                                <asp:UpdatePanel ID="updpnl_searchButton" runat="server"  RenderMode="Inline">
                                <ContentTemplate>
                                 <asp:Button
                                    ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                </ContentTemplate>
                                </asp:UpdatePanel>
                               

                          <%--  </ContentTemplate>
                            </asp:UpdatePanel>--%>
                            <asp:Panel ID="pnlOnlyRecommended" CssClass="SearchOptionsCheckboxes"  runat="server" Style="margin-top:10px;">
                              
                              
                              <asp:CheckBox ID="chkbx_OnlyRecommended" runat="server" Text="Recommended results"
                            ToolTip="Recommended search retrieves MediaItems from the MIRS ranking system. These MediaItems generally have higher rankings, however the total number of results may be reduced." /></span>
                          <asp:CheckBox ID="chkbx_UseSentiment" runat="server" Text="Use sentiment analysis"
                            ToolTip="Apply sentiment analysis to mediaItems." />
                         
                           <%-- <asp:CheckBox ID="chkbx_ExtraLicense" runat="server" Text="Extra License Info"
                            ToolTip="Retrieves extra License details when allowed by the Social Network. Loading time may increase. Applies to FlickR" />--%>
                          
                            </asp:Panel></div>
                        </div>
                    </div>
                    
                      
                    
                    <asp:TextBox ID="txtUserId" runat="server" Visible="false" Text="99"></asp:TextBox>
                    <div class="search-panel-space">
                    </div>
        <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
            </asp:Panel>
        </div>
        <asp:UpdatePanel ID="updpnl_FindMediaItemsErrors" runat="server">
        <ContentTemplate>
        <asp:Panel ID="pnl_FindMediaItemsError" runat="server" Visible="false"
            CssClass="dnnFormMessage dnnFormWarning">
            <asp:Label ID="lbl_FindMediaItemsError" runat="server" Text="There was a problem retrieving MediaItems from the Core Services."></asp:Label>
        </asp:Panel>
</ContentTemplate>
        </asp:UpdatePanel>
        <div class="cleared">
        </div>
        <%--<div style="position: relative;">--%>
        <div id="leftBar" style="position: relative;">
            <div class="narrowResultsPane">
                <asp:Panel ID="pnl_GroupDetails" Visible="false" runat="server">
                    Group name: <b>
                        <asp:Label ID="lbl_GroupTitle" Visible="false" runat="server" Text=""></asp:Label>
                    </b>
                </asp:Panel>
                <h3>
                    Narrow Results</h3>
                <asp:Panel ID="pnlFilterByUser" Visible="false" CssClass="narrowResultsSection" runat="server">
                    <h4>
                        By user</h4>
                    <asp:ListView ID="lstvw_AllPeopleInGroup" runat="server" OnItemCommand="lstvw_ActivitiesAllPeople_ItemCommand">
                        <EmptyDataTemplate>
                            <table id="Table5" runat="server" style="">
                                <tr>
                                    <td>
                                        There are no People on this group.
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" border="0" style="width: 100%">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <span class="activitiesFilterPerson">
                                <asp:LinkButton ID="lnkbtn_FilterByUser" runat="server" CommandArgument='<%# Eval("id.id")%>'
                                    CommandName="FilterActivitiesByUser">
                                    <img width="16px" src="DesktopModules/Socios_Scenario1/Images/<%# GetGroupMemberSource(Eval("id.source.Item").ToString())%>.png" />
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("preferredUsername")%>'></asp:Label></asp:LinkButton>
                            </span>
                        </ItemTemplate>
                        <ItemSeparatorTemplate>
                        </ItemSeparatorTemplate>
                    </asp:ListView>
                </asp:Panel>
                <asp:Panel ID="pnlFilterByEvent" CssClass="narrowResultsSection" Visible="false"
                    runat="server">
                    <h4>
                        By event</h4>
                    <asp:ListView ID="lstvw_AllGroupEvents" runat="server" OnItemDataBound="lstvw_AllGroupEvents_ItemDataBound"
                        OnItemCommand="lstvw_AllGroupEvents_ItemCommand">
                        <EmptyDataTemplate>
                            <table id="Table5" runat="server" style="">
                                <tr>
                                    <td>
                                        No events were detected in this group.
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" border="0" style="width: 100%">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <span class="activitiesFilterPerson">
                                <asp:LinkButton ID="lnkbtn_FilterByEvent" runat="server" CommandArgument='<%# Eval("Key")%>'
                                    CommandName="FilterActivitiesByEvent" ToolTip='<%# Eval("Value")%>'>
                                    <asp:Label ID="lblEventName" runat="server" Text='<%# Eval("Value")%>'></asp:Label></asp:LinkButton>
                            </span>
                        </ItemTemplate>
                        <ItemSeparatorTemplate>
                        </ItemSeparatorTemplate>
                    </asp:ListView>
                </asp:Panel>
                <asp:Panel ID="pnlFilterBySource" CssClass="narrowResultsSection" runat="server">
                    <h4>
                        By Social Network</h4>
                    <%--<dnnweb:DnnTreeView ID="treevw_AllSocialNetworks" DataSourceID="sqldtsrc_AllSocialNetworks"
                 ShowLineImages="true" DataValueField="Value"  OnNodeClick="treevw_AllSocialNetworks_NodeClick"
                DataTextField="Value" DataFieldID="Id" CssClass="domainsTree" CheckChildNodes="true"
               runat="server">--%>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <dnnweb:DnnTreeView ID="treevw_AllSocialNetworks" ShowLineImages="true" OnNodeClick="treevw_AllSocialNetworks_NodeClick"
                                CssClass="networksTree" CheckChildNodes="true" runat="server">
                            </dnnweb:DnnTreeView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            <asp:Panel ID="pnlSearchHistory" Visible="false" CssClass="pnlSearchHistory" runat="server">
                    <h3>Search History</h3>
                <asp:UpdatePanel ID="updtpnlSearchHistory" runat="server">
                <ContentTemplate>
               
                    <dnnweb:DnnListView ID="dnnlstvw_SearchHistory" OnItemCommand="dnnlstvw_SearchHistory_ItemCommand" PageSize="10" runat="server" DataSourceID="sqldtsrc_SearchMediaItemsHistory"
                        AllowPaging="true" EnableModelValidation="True">
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" class="historyContents" runat="server" border="0">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </LayoutTemplate>
                        <EmptyDataTemplate>
                            <div style="float: right; padding: 20px; clear: right; min-height: 300px;">
                                <div class="dnnFormMessage dnnFormInfo">
                                    No searches
                                </div>
                            </div>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <b><asp:LinkButton ID="lnkbtnGetHistoryMediaItems" CommandArgument='<%# Eval("SearchGuid")%>' CommandName="GetHistoryMediaItems" runat="server"><%# Eval("SearchTerms")%></asp:LinkButton></b> (<asp:Label ID="lblAllResults" runat="server" Text='<%# Eval("ResultsCount")%>'></asp:Label>)
                            
                            <asp:HiddenField Visible="false" ID="FacebookResults" Value='<%# Eval("FacebookResults")%>' runat="server" />
                            <asp:HiddenField  Visible="false" ID="TwitterResults" Value='<%# Eval("TwitterResults")%>' runat="server" />
                            <asp:HiddenField  Visible="false" ID="DailymotionResults" Value='<%# Eval("DailymotionResults")%>' runat="server" />
                            <asp:HiddenField Visible="false"  ID="GooglepResults" Value='<%# Eval("GooglepResults")%>' runat="server" />
                            <asp:HiddenField  Visible="false" ID="YoutubeResults" Value='<%# Eval("YoutubeResults")%>' runat="server" />
                            <asp:HiddenField  Visible="false" ID="MyspaceResults" Value='<%# Eval("MyspaceResults")%>' runat="server" />
                            <asp:HiddenField Visible="false"  ID="FlickrResults" Value='<%# Eval("FlickrResults")%>' runat="server" />
                        <div class="historyTimeAgo"><%# SociosServices.SociosUtil.ToRelativeDate( Eval("SearchDate").ToString())%></div>  
                        </ItemTemplate>
                        <ItemSeparatorTemplate>
                        <div style="height: 1px; margin-top: 6px; padding-top: 6px; border-top: 1px dotted #ccc;">
                                    </div>
                        </ItemSeparatorTemplate>
                        <EmptyDataTemplate>
                        </EmptyDataTemplate>
                    </dnnweb:DnnListView>
                     </ContentTemplate>
                </asp:UpdatePanel>
                </asp:Panel>
            <%-- <div style="position:relative;">--%>
            <div id="mediaItemCartWrap">
                
                <asp:Panel ID="pnlMediaItemCart" Visible="false" CssClass="mediaItemCart" runat="server">
                    <asp:UpdatePanel ID="updpnl_MediaItemsCart" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="MediaCartLoading">
                            </div>
                            <h3>
                                Selected MediaItems</h3>
                            <asp:ListView ID="lstvwMediaItemsCart" runat="server" OnItemCommand="lstvwMediaItemsCart_ItemCommand"
                                DataSourceID="sqldtsrc_SelectedMediaItems" EnableModelValidation="True">
                                <EmptyDataTemplate>
                                    <div id="Table3" runat="server" style="margin-bottom: 5px; text-align: center;">
                                        No MediaItems selected yet.
                                    </div>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <div style="">
                                        <div class='cart-media-item-<%# GetCachedMediaItemSource(Eval("Item").ToString())%>'>
                                            <%--             <asp:Label ID="ItemLabel" runat="server" Text='<%# Eval("Item") %>' />--%>
                                            <%--<asp:Label ID="UrlLabel" runat="server" Text='<%# Eval("Url") %>' />--%>
                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# CutString( Eval("Title").ToString(), 20) %>' />
                                            <%--  <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
           
                 <asp:Label ID="Id_IdLabel" runat="server" Text='<%# Eval("Id_Id") %>' />--%>
                                            <asp:LinkButton ID="lnkbtnDeselectMediaItem" CssClass="cartMediaItemRemove" CommandName="deselectMediaItem"
                                                CommandArgument='<%#  Eval("cacheId").ToString() %>' runat="server" ToolTip="Deselect"><img  src="/DesktopModules/Socios_Scenario1/Images/delete.png"></asp:LinkButton>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <ItemSeparatorTemplate>
                                    <div style="height: 1px; margin-top: 6px; padding-top: 6px; border-top: 1px dotted #ccc;">
                                    </div>
                                </ItemSeparatorTemplate>
                                <LayoutTemplate>
                                    <table id="Table4" runat="server">
                                        <tr id="Tr4" runat="server">
                                            <td id="Td3" runat="server">
                                                <div id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                    <div id="itemPlaceholder" runat="server">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="Tr6" runat="server">
                                            <td id="Td4" runat="server" style="">
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                            </asp:ListView>
                            <div style="text-align: left; width:40%; padding-top: 10px; float:left; border-top: 1px dotted #ccc;">
                              <asp:Button ID="btnClearMediaItemSelection" runat="server" OnClick="btnClearMediaItemSelection_Click"
                                    Text="Clear list" />
                            </div>

                            <div style="text-align: right; width:40%; padding-top: 10px; float:right; border-top: 1px dotted #ccc;">
                              
                                
                                <asp:Button ID="btnConfirmMediaItemSelection" runat="server" OnClick="btnConfirmMediaItemSelection_Click"
                                    Text="Confirm" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
        </div>
        <asp:UpdatePanel ID="updtpnlSearchMedia" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="controlResultsPane">
                    Sort By:
                    <dnnweb:DnnComboBox runat="server" ID="ddlSortResults" EmptyMessage="Select sorting type"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlSortResults_SelectedIndexChanged">
                        <Items>
                            <dnnweb:DnnComboBoxItem CssClass="sortingOption" Text="Title" Value="Title" />
                            <dnnweb:DnnComboBoxItem CssClass="sortingOption" Text="Most recent" Value="createdDate" />
                            <dnnweb:DnnComboBoxItem CssClass="sortingOption" Text="Ranking" Value="mirsRanking" />
                        </Items>
                    </dnnweb:DnnComboBox>
                </div>
                <asp:Panel ID="pnlBeforeFirstSearch" CssClass="pnlBeforeFirstSearch" runat="server">
                    <div class="dnnFormMessage dnnFormInfo">

                        <asp:Label ID="lblJournalistMediaSearchInfo" runat="server" Text="">
                        Enter keywords related to the media you are interested in finding in the search
                        box above.
                        <br />
                        <br />
                        Use the <b>Recommended search</b> option if you want recommended results. Please
                        note that recommended results are generally less and may be sorted by ranking.
                        </asp:Label>
                        
                        <asp:Label ID="lblCandidateMediaSearchInfo" runat="server" Text="Label">
                        This is where you <b>select</b> the <b>Videos & Photos</b> you want to use as part as your bid.<br /><br />
                        To do this you have to <b>authenticate</b> <b>at least one</b> of the supported social networks (Facebook, Flickr, Dailymotion).<br /><br />
                        The <b>Authentication Status</b> panel shows you which social networks you have already authenticated.<br /><br />
                        Click on the <a href=""http://frontend.sociosproject.eu/LinkingYourSocialNetworkAccounts.aspx"><b>'Authenticate'</b></a> link to get started.  
                        <br />
                        After authenticating click on the 'Get my Videos & Photos' button to bring in your Videos and Photos. You can then select the ones you can include in your bid.
                        <br /><br />
                        Selected Videos & Photos are added to the <b>Selected MediaItems</b> cart.
                        <br />
                        <br />
                        When you have finished selecting your items click on the <b>'Confirm'</b> button
                        
                        </asp:Label>



                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlLoadingMediaItems" runat="server">
                    <div id="loadingMediaItems" class="hidden">
                        <%--<h1>LOADING</h1>--%>
                    </div>
                </asp:Panel>
                <div id="mediaItemsList">
                    <dnnweb:DnnListView ID="radlstvwMediaItems" PageSize="10" Visible="false" runat="server"
                        OnItemDataBound="radLstvwMediaItems_ItemDataBound" DataSourceID="sqldtsrc_FindMediaItemsCache"
                        AllowPaging="true" EnableModelValidation="True" OnItemCommand="radLstvwMediaItems_ItemCommand">
                        <EmptyDataTemplate>
                            <div style="float: right; padding: 20px; clear: right; min-height: 300px;">
                                <div class="dnnFormMessage dnnFormInfo">
                                    No Media Items were found
                                </div>
                            </div>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" class="selectable" runat="server" border="0" style="width: 100%">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                            <dnnweb:DnnDataPager ID="RadDataPager1" runat="server" PageSize="10" PagedControlID="radlstvwMediaItems">
                                <Fields>
                                    <dnnweb:DnnDataPagerButtonField FieldType="FirstPrev" />
                                    <dnnweb:DnnDataPagerButtonField FieldType="Numeric" />
                                    <dnnweb:DnnDataPagerButtonField FieldType="NextLast" />
                                    <dnnweb:DnnDataPagerGoToPageField />
                                    <dnnweb:DnnDataPagerTemplatePageField>
                                        <PagerTemplate>
                                            <div style="float: right">
                                                <b>Items
                                                    <asp:Label runat="server" ID="CurrentPageLabel" Text="<%# Container.Owner.StartRowIndex+1%>" />
                                                    to
                                                    <asp:Label runat="server" ID="TotalPagesLabel" Text="<%# Container.Owner.TotalRowCount > (Container.Owner.StartRowIndex+Container.Owner.PageSize) ? Container.Owner.StartRowIndex+Container.Owner.PageSize : Container.Owner.TotalRowCount %>" />
                                                    of
                                                    <asp:Label runat="server" ID="TotalItemsLabel" Text="<%# Container.Owner.TotalRowCount%>" />
                                                    <br />
                                                </b>
                                            </div>
                                        </PagerTemplate>
                                    </dnnweb:DnnDataPagerTemplatePageField>
                                </Fields>
                            </dnnweb:DnnDataPager>
                            <div class="cleared">
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Panel ID="pnlContainerItem" runat="server" CssClass="container-item">
                                <asp:UpdatePanel ID="updtpnl_sentiment" runat="server">
                                    <ContentTemplate>
                                        <%-- <div class="sentiment-positive"></div>--%>
                                        <%--<asp:Label ID="lblSentiment" runat="server" Text="Label"></asp:Label>--%>
                                        <asp:Panel ID="pnlSentiment" ToolTip="Loading sentiment..." CssClass="sentiment-loading"
                                            runat="server">
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="author-wrapper">
                                    <div class="toTop">
                                    </div>
                                    <asp:Panel ID="pnlAuthorDifferentiator" runat="server" class="author-differentiator">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <asp:Panel ID="pnlAuthorLoading" class="authorLoading" runat="server">
                                                </asp:Panel>
                                                <div class="author-thumb">
                                                    <asp:Label ID="lbl_AddUserToGroup" Visible="false" CssClass="add-user media-item-add-user media-item-add-user-out"
                                                        runat="server" ToolTip="Add user to a group"></asp:Label>
                                                    <%--<img alt="author thumbnail" src="<%# GetUserPhotoUrl(Eval("userId_Id")+ ":" + Eval("Item")) %>" />--%>
                                                    <asp:Image ID="imgAuthorIcon" runat="server" ImageUrl="http://frontend.sociosproject.eu/images/no-profile.png" />
                                                </div>
                                                <div class="author-username">
                                                    <%-- <a href="http://www.youtube.com/user/<%#Eval("Author")%>"><%#Eval("Author")%></a></div>
                                                    --%>
                                                    <asp:Label ID="lblUserId" CssClass="hidden" runat="server" Visible="false" Text='<%# Eval("userId_Id")%>'></asp:Label>
                                                    <div class="clear">
                                                    </div>
                                                    <asp:Label ID="lblUsername" CssClass="hidden" runat="server" Text="Label" Visible="false"></asp:Label>
                                                    <div class="clear">
                                                    </div>
                                                    <asp:Label ID="lblDisplayName" runat="server" Text="Label" Visible="false"></asp:Label>
                                                    <div class="clear">
                                                    </div>
                                                    <div class="hidden source-wrap"><%# GetCachedMediaItemSource(Eval("Item").ToString())%></div>
                                                    <asp:Label ID="lblMediaItemSource" Visible="false" runat="server" Text='<%# GetCachedMediaItemSource(Eval("Item").ToString())%>'></asp:Label>
                                                    <asp:Label ID="lblUrl" runat="server" Text='<%# Eval("Url")%>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblItemId" style="display: none;" runat="server" Text='<%# Eval("Id_Id")%>'></asp:Label>
                                                    <asp:Label ID="lblMediaType" style="display: none;" runat="server" Text='<%# Eval("MediaType")%>'></asp:Label>
                                                    <div>
                                                    </div>
                                                    <asp:LinkButton ID="LinkButton10" Visible="false" CommandName="GetProfileUrl" CommandArgument='<%# Eval("userId_Id")+ ":" + Eval("Item") %>'
                                                        runat="server" Text='<%# Eval("userId_Id")%>'>
                         
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkbtn_getUserDetails" CssClass="GetUserDetails hidden" CommandName="getUserDetails"
                                                        CommandArgument='<%#  Eval("userId_Id") %>' runat="server">Get user details</asp:LinkButton>
                                                    <%--      <asp:LinkButton ID="lnkbtn_GetSentiment" CssClass="GetSentiment hidden" CommandName="getSentiment"
                                                CommandArgument='<%#Eval("Description")%>' runat="server">Get sentiment</asp:LinkButton>--%>
                                                    <asp:Panel ID="pnl_GetPersonError" runat="server" Visible="false" Style="float: right;"
                                                        CssClass="dnnFormMessage dnnFormWarning">
                                                        <asp:Label ID="lbl_GetPersonError" runat="server" Text="There was a problem retrieving the user's details"></asp:Label></asp:Panel>
                                                    <asp:HyperLink ID="hprlnkUserProfile" Visible="false" runat="server" Target="_blank"
                                                        NavigateUrl='<%# GetProfileUrl(Eval("userId_Id")+ ":" + Eval("Item") + ":" + Eval("Url")) %>'>Go to user profile</asp:HyperLink>
                                                    <asp:Label ID="lblTitle" Visible="false" runat="server" Text='<%#Eval("Title")%>'></asp:Label>
                                                    <asp:Label ID="lblDescription" Visible="false" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                                                </div>
                                                <%-- <div class="item-tools">
                                            <asp:Panel ID="pnlItemTools" runat="server" Visible="false">
                                                <span class="add-user media-item-add-user" title="Add user to a group"></span>
                                               
                                                <asp:HyperLink ID="hprlnkMessageUser" title="Send message to user" CssClass="message-user"
                                                    runat="server"></asp:HyperLink>
                                            </asp:Panel>
                                        </div>--%>
                                                <div class="cleared">
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                    <asp:UpdatePanel ID="updtpnlAssignPrice" runat="server">
                                        <ContentTemplate>
                                            <div class="negotiateUsageWrap">
                                                <asp:Button ID="btn_assignPrice" CommandArgument='<%# GetCachedMediaItemId(Eval("Item").ToString(), Eval("Id_Id").ToString()) + ":" + Eval("cacheDictionaryId").ToString()%>'
                                                    runat="server" CommandName="AssignPrice" Text="Negotiate usage" />
                                            </div>
                                            <div class="assignPriceLoading hidden">
                                                Loading Flexiprice link..
                                            </div>
                                            <asp:Literal ID="ltrlAssignPriceRedirector" runat="server"></asp:Literal>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="group-wrap">
                                        <%--  <asp:LinkButton ID="LinkButton4" runat="server">My group 1</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton5" runat="server">My group 2</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton6" runat="server">Syria conflict</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton7" runat="server">My group 3</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton8" runat="server">My group 4</asp:LinkButton>
                                        --%>
                                    </div>
                                    <asp:UpdatePanel ID="updtpnlRanking" runat="server">
                                        <ContentTemplate>
                                            <div class="cleared itemButtonsSeparator">
                                            </div>
                                            <div class="media-item-ranking-control">
                                                <asp:HiddenField ID="hdnfld_mirsRanking" Value='<%#  Eval("mirsRanking").ToString() %>'
                                                    runat="server" />
                                                <asp:Panel ID="pnl_rankingButton" runat="server">
                                                    <div class="getRatingBtnWrap">
                                                        <asp:Button ID="lnkbtn_GetItemRanking" CommandArgument='<%#  Eval("cacheDictionaryId").ToString() %>'
                                                            CommandName="GetItemRanking" CssClass="GetItemRanking hidden" runat="server"
                                                            Text="Get item ranking"></asp:Button>
                                                        <asp:HiddenField ID="hdnfld_CacheId" Value='<%#  Eval("cacheId").ToString() %>' runat="server" />
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="pnl_rankingStars" runat="server" Visible="false">
                                                    <%#  GetRankingStarsHtml( Eval("mirsRanking").ToString(),"") %>
                                                </asp:Panel>
                                                <%-- <div class="loading">
                                            Loading ranking..
                                        </div>--%>
                                                <asp:Panel ID="pnl_loadingRanking" CssClass="loading" runat="server">
                                                    Loading ranking..
                                                </asp:Panel>
                                                <%-- <div class="loading">
                                        
                                        </div>--%>
                                                <asp:Literal ID="ltrl_ItemRankingStars" runat="server"></asp:Literal>
                                            </div>
                                            <div class="cleared">
                                            </div>
                                            <%--  <asp:UpdatePanel ID="updpnl_selectItem" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                 <ContentTemplate>--%>
                                            <%--     </ContentTemplate>
                            </asp:UpdatePanel>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="updpnl_selectItem" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlSelectOptionsWrap" CssClass='<%# "selectOptionsWrap" +  Eval("selected") %>'
                                                runat="server">
                                                <asp:Label ID="lblStatus" Visible='<%# Eval("selected") %>' runat="server" Text="">Selected</asp:Label>
                                                <asp:LinkButton ID="lnkbtnSelectMediaItem" Visible='<%# !(bool)Eval("selected") %>'
                                                    CommandName="selectMediaItem" CommandArgument='<%#  Eval("cacheId").ToString() %>'
                                                    runat="server">Select MediaItem</asp:LinkButton>
                                                <asp:LinkButton ID="lnkbtnDeselectMediaItem" Visible='<%# Eval("selected") %>' CommandName="deselectMediaItem"
                                                    CommandArgument='<%#  Eval("cacheId").ToString() %>' runat="server" ToolTip="Deselect"><img  src="/DesktopModules/Socios_Scenario1/Images/delete.png"></asp:LinkButton>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="translator-ddl-wrap">
                                        <select id="translateLanguage" class="translateLanguage" name="translateLanguage">
                                            <option value="x" selected="selected">Translate to...</option>
                                            <option value="en">English</option>
                                            <option value="de">German</option>
                                            <option value="cs">Czech</option>
                                            <option value="el">Greek</option>
                                            <option value="-">Original</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="item-details-wrap">
                                    <div class="item-details">
                                        <div class='media-item-<%# GetCachedMediaItemSource(Eval("Item").ToString())%>'>
                                            <%-- <h2><a href="http://www.youtube.com/watch?v=<%#Eval("Url")%>"><%#Eval("Title")%></a></h2>
                                            --%>
                                            <h2>
                                                <a target="_blank" href="<%# Eval("url")%>">
                                                    <asp:Label ID="lbl_MediaItemTitle" runat="server" Text='<%#Eval("Title")%>'></asp:Label></a></h2>
                                            <span class="mediaItemDate">
                                                <%# GetMediaItemDate( Convert.ToDateTime(Eval("CreatedDate")),Eval("CreatedDateSpecified").ToString())%></span>
                                        </div>
                                        <div>
                                            <img class="media-item-thumb media-item-thumb-<%# GetCachedMediaItemSource(Eval("Item").ToString())%>"
                                                src='<%#Eval("ThumbnailUrl")%>' alt="thumb" />
                                            <div class="hidden">
                                                <div class="view-media-item">
                                                    <%-- <iframe width="560" height="315" src="http://www.youtube.com/embed/<%#Eval("Url")%>" frameborder="0"
                    allowfullscreen></iframe>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="expandable">
                                            <%#Eval("Description")%></p>
                                        <p class="translatable hidden">
                                            <%#Eval("Description")%></p>
                                        <p class="tags">
                                            <b>Tags:</b> <i>
                                                <%#Eval("Tags")%></i></p>
                                        <div class="cleared">
                                        </div>
                                    </div>
                                    <div class="cleared">
                                    </div>
                                    <div class="assign-price-control">
                                        <asp:HiddenField ID="hdnfld_source" runat="server" Value='<%#  Eval("Item").ToString() %>' />
                                        <asp:HiddenField ID="hdnfld_ownerId" runat="server" Value='<%# Eval("userId_Id") %>' />
                                        <asp:HiddenField ID="hdnfld_url" runat="server" Value='<%# Eval("url")%>' />
                                        <asp:Panel ID="pnlAssignPriceRedirector" runat="server" Visible="false">
                                            <asp:HyperLink ID="hprlnk_AssignPrice" Target="_blank" runat="server">Go to Flexiprice</asp:HyperLink>
                                        </asp:Panel>
                                    </div>
                                    <asp:Label ID="lblLicenseType" Visible="false" runat="server" Text='<%# Eval("licenseType")%>'></asp:Label>
                                    <asp:Label ID="lblLicenseUrl" Visible="false" runat="server" Text='<%# Eval("licenseUrl")%>'></asp:Label>
                                </div>
                                <asp:UpdatePanel ID="updtpnl_License" runat="server" UpdateMode="Always">
                              <ContentTemplate>
                                <asp:HyperLink ID="hprlnkLicense" ToolTip="" Visible="false" Target="_blank" runat="server">
                                    <asp:Image ID="imgLicense" CssClass="licenseIcon" runat="server" ImageUrl="Images/cc22.png" /></asp:HyperLink></ContentTemplate></asp:UpdatePanel>
                            </asp:Panel>
                        </ItemTemplate>
                    </dnnweb:DnnListView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        

       
        <div class="cleared">
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlWidgetWrapper" runat="server" Visible="false" CssClass="widgetWrapper">
     <ul class="searchFilterSnWidg">
                                <li id="li1" runat="server">
                                    <asp:CheckBox ID="chkbxFacebookSearchWidg" Checked="true" runat="server"></asp:CheckBox><img
                                        title="Facebook" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/facebook.png">
                                </li>
                                 <li id="li2" runat="server">
                                    <asp:CheckBox ID="chkbxFlickRSearchWidg" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="FlickR" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/flickr.png">
                                </li>
                                 <li id="li3" runat="server">
                                    <asp:CheckBox ID="chkbxTwitterSearchWidg" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="Twitter" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/twitter.png">
                                </li>
                                <li id="li4" runat="server">
                                    <asp:CheckBox ID="chkbxYouTubeSearchWidg" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="YouTube" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/youtube.png">
                                </li>
                        
                          
                               <li id="li5" runat="server">
                                    <asp:CheckBox ID="chkbxDailymotionSearchWidg" Checked="true" runat="server" Text="">
                                    </asp:CheckBox><img title="Dailymotion" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/dailymotion.png">
                                </li>
                                 <li id="li6" runat="server">
                                    <asp:CheckBox ID="chkbxMySpaceSearchWidg" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="MySpace" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/myspace.png">
                                </li>
                                <li id="li7" runat="server">
                                    <asp:CheckBox ID="chkbxGooglePlusSearchWidg" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="Google+" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/googleplus.png">
                                </li>
                                  <li id="li8" runat="server" class="noBorder">
                                    <asp:CheckBox ID="chkbxInstagramSearchWidg" Checked="true" runat="server" Text=""></asp:CheckBox><img
                                        title="Instagram" width="16px" alt="" src="DesktopModules/Socios_Scenario1/Images/instagram16x16.png">
                                </li>
                            </ul>
        <asp:TextBox ID="txtSearchWidg" CssClass="txtSearchWidg" runat="server" Text=""></asp:TextBox><asp:Button
                                    ID="Button3" runat="server" Text="Search"  OnClick="btnSearch_Click" />
         <asp:ListView ID="widg_lstvwMediaItems"  runat="server" EnableModelValidation="True"
            OnItemCommand="lstvwMediaItems_ItemCommand">
            <EmptyDataTemplate>
                <table id="Table5" runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" border="0" style="width: 100%">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="widg-container-item">
                    <div class="widg-author-wrapper">
                        <div class="widg-author-thumb">
                            <img alt="widg-author widg-thumbnail" src="http://frontend.sociosproject.eu/images/no-profile.png" /></div>
                        <div class="widg-author-username">
                            <%-- <a href="http://www.youtube.com/user/<%#Eval("Author")%>"><%#Eval("Author")%></a></div>
                            --%>
                            <a target="_blank" href="http://www.youtube.com/user/<%#Eval("userId.Id")%>">
                                <%#Eval("userId.Id")%></a></div>
                        <div class="widg-rating-wrap">
                            <span class="widg-full-star"></span><span class="widg-full-star"></span><span class="widg-full-star">
                            </span><span class="widg-full-star"></span><span class="widg-full-star"></span>
                        </div>
                        <div class="cleared">
                        </div>
                    </div>
                    <div class="cleared">
                    </div>
                    <div class="widg-item-details-wrap">
                        <div class="widg-item-details">
                            <div class='widg-media-item-<%# GetCachedMediaItemSource(Eval("userId.source.Item").ToString())%>'>
                                <%-- <h2><a href="http://www.youtube.com/watch?v=<%#Eval("Url")%>"><%#Eval("Title")%></a></h2>
                                --%>
                                <h2>
                                    <a target="_blank" href="<%#Eval("Url")%>">
                                        <%#Eval("Title")%></a></h2>
                            </div>
                            <p>
                                <img class="widg-media-item-thumb" src='<%#Eval("ThumbnailUrl")%>' alt="thumb" />
                                <%#Eval("Description")%></p>
                            <p class="tags">
                                <b>Tags:</b> <i>
                                    <%#Eval("Tags")%></i></p>
                            <div class="cleared">
                            </div>
                        </div>
                        <div class="cleared">
                        </div>
                    </div>
                </div>
                <div class="cleared">
                </div>
            </ItemTemplate>
        </asp:ListView>
        </asp:Panel>
    <asp:Panel ID="pnl_PoolOfContacts" runat="server" Visible="false">
        <asp:Label ID="lblSnsIdsAvailable" Visible="false" runat="server" Text="Select the Social Network you want to retrieve your contacts from:"></asp:Label>
        <asp:Panel ID="pnlNoSnIdsAvailable" CssClass="dnnFormMessage dnnFormInfo" Visible="false"
            runat="server">
            <asp:Label ID="lblNoSnIdsAvailable" runat="server" Text="Please use the oAuth page to authenticate yourself in the available social networks before retrieving contacts."></asp:Label></asp:Panel>
        <asp:LinkButton ID="lnbtn_GetDailymotionConnnectedPeople" Visible="false" OnClick="lnbtn_GetDailymotionConnnectedPeople_Click"
            runat="server"><img src="/DesktopModules/Socios_Scenario1/Images/dailymotion.png" alt="Dailymotion" /></asp:LinkButton>
        <asp:LinkButton ID="lnbtn_GetFlickrConnnectedPeople" Visible="false" OnClick="lnbtn_GetFlickrConnnectedPeople_Click"
            runat="server"><img src="/DesktopModules/Socios_Scenario1/Images/flickr.png" alt="FlickR" /></asp:LinkButton>
        <asp:LinkButton ID="lnbtn_GetYoutubeConnnectedPeople" Visible="false" OnClick="lnbtn_GetYoutubeConnnectedPeople_Click"
            runat="server"><img src="/DesktopModules/Socios_Scenario1/Images/youtube.png" alt="Youtube" /></asp:LinkButton>

            <asp:LinkButton ID="lnbtn_GetInstagramConnnectedPeople" Visible="false" OnClick="lnbtn_GetInstagramConnnectedPeople_Click"
            runat="server"><img src="/DesktopModules/Socios_Scenario1/Images/instagram.png" alt="Instagram" /></asp:LinkButton>


        <asp:LinkButton ID="lnbtn_GetTwitterConnnectedPeople" Visible="false" OnClick="lnbtn_GetTwitterConnnectedPeople_Click"
            runat="server"><img src="/DesktopModules/Socios_Scenario1/Images/twitter.png" alt="Twitter" /></asp:LinkButton>
     <%--   <asp:LinkButton ID="lnbtn_GetMyspaceConnnectedPeople" Visible="false" OnClick="lnbtn_GetMyspaceConnnectedPeople_Click"
            runat="server"><img src="DesktopModules/Socios_Scenario1/Images/myspace.png" alt="Myspace" /></asp:LinkButton>--%>
        <asp:LinkButton ID="lnbtn_GetFacebookConnnectedPeople" Visible="false" OnClick="lnbtn_GetFacebookConnnectedPeople_Click"
            runat="server"><img src="/DesktopModules/Socios_Scenario1/Images/facebook.png" alt="Facebook" /></asp:LinkButton>
        <%--<asp:LinkButton ID="lnkbtn_GetConnectedPeople" runat="server" OnClick="lnkbtn_GetConnectedPeople_Click">Get connected people</asp:LinkButton>
             
            <asp:LinkButton ID="lnkbtn_AddPersonToGroup" runat="server" OnClick="lnkbtn_AddPersonToGroup_Click">Add person to group</asp:LinkButton>--%>
        &nbsp;&nbsp;<dnnweb:DnnComboBox ID="cbbx_ConnectedPersons" runat="server" Width="230px"
            Height="140px" EmptyMessage="Looking for someone specific.." DataSourceID="sqldtsrc_ConnectedPersonsCache"
            OnSelectedIndexChanged="cbbx_ConnectedPersons_OnSelectedIndexChanged" Visible="false"
            Filter="Contains" DataTextField="username" DataValueField="username" AutoPostBack="true"
            MarkFirstMatch="false">
        </dnnweb:DnnComboBox>
        <%--   <dnnweb:DnnComboBox ID="DnnComboBox1" runat="server" Width="230px" Height="140px"
                                           EmptyMessage="Looking for someone specific.." DataSourceID="sqldtsrc_ConnectedPersonsCache"
                                            Filter="Contains" DataTextField="username" DataValueField="username" 
                                            AutoPostBack="true" MarkFirstMatch="false" OnItemDataBound="cbbx_UsedTools_OnItemDataBound">
                                        </dnnweb:DnnComboBox>--%>
        <dnnweb:DnnListView ID="radlstvwConnectedPersons" Visible="false" AllowPaging="true"
            runat="server" EnableModelValidation="True" DataSourceID="sqldtsrc_ConnectedPersonsCache">
            <EmptyDataTemplate>
                <table id="Table5" runat="server" style="">
                    <tr>
                        <td>
                            <div class="dnnFormMessage dnnFormInfo">
                                No connected people found</div>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" border="0" style="width: 100%">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                </div>
                <div class="cleared">
                </div>
                <dnnweb:DnnDataPager ID="RadDataPager1" PageSize="12" runat="server" PagedControlID="radlstvwConnectedPersons">
                    <Fields>
                        <dnnweb:DnnDataPagerButtonField FieldType="FirstPrev" />
                        <dnnweb:DnnDataPagerButtonField FieldType="Numeric" />
                        <dnnweb:DnnDataPagerButtonField FieldType="NextLast" />
                        <dnnweb:DnnDataPagerGoToPageField />
                        <dnnweb:DnnDataPagerTemplatePageField>
                            <PagerTemplate>
                                <div style="float: right">
                                    <b>Items
                                        <asp:Label runat="server" ID="CurrentPageLabel" Text="<%# Container.Owner.StartRowIndex+1%>" />
                                        to
                                        <asp:Label runat="server" ID="TotalPagesLabel" Text="<%# Container.Owner.TotalRowCount > (Container.Owner.StartRowIndex+Container.Owner.PageSize) ? Container.Owner.StartRowIndex+Container.Owner.PageSize : Container.Owner.TotalRowCount %>" />
                                        of
                                        <asp:Label runat="server" ID="TotalItemsLabel" Text="<%# Container.Owner.TotalRowCount%>" />
                                        <br />
                                    </b>
                                </div>
                            </PagerTemplate>
                        </dnnweb:DnnDataPagerTemplatePageField>
                    </Fields>
                </dnnweb:DnnDataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <asp:HiddenField ID="hdnfld_userId" runat="server" Value='<%# Eval("userId")%>' />
                <div class="person-container-item person-item-<%# GetMediaItemSource(Eval("source"))%>">
                    <span class="add-user add-user-out"></span>
                    <div class="person-wrapper">
                        <div class="author-thumb">
                            <img alt="author thumbnail" src="<%# Eval("thumbnailUrl") %>" /></div>
                        <div class="author-username">
                            <span class="hidden">
                                <%# Eval("userId")%></span> <span><b>
                                    <%# Eval("username")%></b></span> <span class="source-wrap hidden">
                                        <%# GetMediaItemSource(Eval("source"))%>
                                    </span><span class="name-wrap hidden">
                                        <%# Eval("username")%>
                                    </span>
                            <br />
                            <div>
                            </div>
                            <asp:LinkButton ID="LinkButton10" Visible="false" CommandName="GetProfileUrl" CommandArgument='<%# Eval("userId")+ ":" + Eval("source") %>'
                                runat="server" Text='<%# Eval("username")%>'>
                         
                            </asp:LinkButton>
                            <asp:HyperLink ID="hprlnk_userProfile" Target="_blank" runat="server" NavigateUrl='<%# Eval("profileUrl") %>'>Go to user profile</asp:HyperLink>
                        </div>
                        <%-- <div class="item-tools">
                        <span class="add-user"></span><a href="<%# GetProfileUrl(Eval("userId")+ ":" + Eval("source")) %>"
                            class="message-user"></a>
                        <div class="hidden">
                        </div>
                    </div>--%>
                    </div>
                </div>
            </ItemTemplate>
        </dnnweb:DnnListView>
    </asp:Panel>
    <div class="cleared">
    </div>
</asp:Panel>
<div id="hidden-popup-forms">
    <div id="contact-user-form">
        <asp:Button ID="Button1" runat="server" CssClass="contact-user" ToolTip="contact-user"
            Text="Contact user" /><br />
        <br />
        <asp:Button ID="Button2" runat="server" ToolTip="request-consent-user" Text="Ask user's consent" />
    </div>
    <div id="add-to-group-form">
        <div class="hidden" id="AddPersonIdAnchorElement">
        </div>
        <asp:HiddenField ID="hdnfld_AddPersonId" runat="server" />
        <asp:HiddenField ID="hdnfld_AddPersonSource" runat="server" />
        <asp:HiddenField ID="hdnfld_AddPersonName" runat="server" />
        <h3>
            Add to an existing group</h3>
        <asp:DropDownList ID="ddlAllGroups" runat="server">
        </asp:DropDownList>
        <br />
        <div class="dialog-buttons">
            <asp:Button ID="btn_AddPersonToGroup" runat="server" Text="Add Contact to group"
                OnClick="btn_AddPersonToGroup_Click" /></div>
        <div class="popup-separator">
        </div>
        <h3>
            <asp:Label ID="Label1" runat="server" Text="Add to a new group"></asp:Label></h3>
        <table>
            <tr>
                <td>
                    Name:
                </td>
                <td>
                    <asp:TextBox ID="txt_AddUser_CreateGroupName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Description:
                </td>
                <td>
                    <asp:TextBox ID="txt_AddUser_CreateGroupDescription" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <div class="cleared">
        </div>
        <div class="dialog-buttons">
            <asp:Button ID="btn_AddPersonToNewGroup" runat="server" Text="Create Group and add Contact"
                OnClick="btn_AddPersonToNewGroup_Click" /></div>
    </div>
    <div id="remove-from-group-form">
        Remove user from group
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Text="Syria clashes" Value="0" />
            <asp:ListItem Text="My group 1" Value="1" />
            <asp:ListItem Text="My group 2" Value="2" />
            <asp:ListItem Text="My group 3" Value="3" />
            <asp:ListItem Text="My group 4" Value="4" />
        </asp:DropDownList>
        <div class="cleared">
        </div>
        <div class="dialog-buttons">
            <asp:Button ID="Button4" runat="server" Text="Ok" /></div>
    </div>
    <div id="user-consent-form">
        <div id="fields-wrap">
            <asp:Label ID="Label2" runat="server" Text="From:"></asp:Label>
            <asp:TextBox ID="txtConsentFrom" runat="server"></asp:TextBox><br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="To:"></asp:Label>
            <asp:TextBox ID="txtConsentTo" runat="server"></asp:TextBox><br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Subject:"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="txtConsentFormText" runat="server" Width="400px" Height="150px"
                TextMode="MultiLine"></asp:TextBox>
        </div>
        <br />
        <div class="dialog-buttons">
            <asp:Button ID="Button6" runat="server" Text="Send" />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </div>
    </div>
</div>
<asp:Panel ID="pnlLog" runat="server" Visible="false">
<h1>Log</h1>
    <asp:Label ID="lblLog" runat="server" Text=""></asp:Label>
    <div>
    <asp:TextBox ID="txtLog" runat="server" Width="500px" Height="100px"></asp:TextBox></div>
</asp:Panel>
<asp:ListView ID="ListView1" runat="server" EnableModelValidation="True">
    <AlternatingItemTemplate>
        <tr style="">
            <td>
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            </td>
            <td>
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            </td>
            <td>
                <asp:Label ID="createdLabel" runat="server" Text='<%# Eval("created") %>' />
            </td>
            <td>
                <asp:CheckBox ID="createdSpecifiedCheckBox" runat="server" Checked='<%# Eval("createdSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="thumbnailUrlLabel" runat="server" Text='<%# Eval("thumbnailUrl") %>' />
            </td>
            <td>
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            </td>
            <td>
                <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
            </td>
            <td>
                <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
            </td>
            <td>
                <asp:Label ID="languageLabel" runat="server" Text='<%# Eval("language") %>' />
            </td>
            <td>
                <asp:Label ID="albumIdLabel" runat="server" Text='<%# Eval("albumId") %>' />
            </td>
            <td>
                <asp:Label ID="fileSizeLabel" runat="server" Text='<%# Eval("fileSize") %>' />
            </td>
            <td>
                <asp:CheckBox ID="fileSizeSpecifiedCheckBox" runat="server" Checked='<%# Eval("fileSizeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="startTimeLabel" runat="server" Text='<%# Eval("startTime") %>' />
            </td>
            <td>
                <asp:CheckBox ID="startTimeSpecifiedCheckBox" runat="server" Checked='<%# Eval("startTimeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
            </td>
            <td>
                <asp:Label ID="numVotesLabel" runat="server" Text='<%# Eval("numVotes") %>' />
            </td>
            <td>
                <asp:Label ID="numCommentsLabel" runat="server" Text='<%# Eval("numComments") %>' />
            </td>
            <td>
                <asp:Label ID="numViewsLabel" runat="server" Text='<%# Eval("numViews") %>' />
            </td>
            <td>
                <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
            </td>
            <td>
                <asp:Label ID="taggedPeopleLabel" runat="server" Text='<%# Eval("taggedPeople") %>' />
            </td>
            <td>
                <asp:Label ID="mimeTypeLabel" runat="server" Text='<%# Eval("mimeType") %>' />
            </td>
            <td>
                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
            </td>
            <td>
                <asp:CheckBox ID="typeSpecifiedCheckBox" runat="server" Checked='<%# Eval("typeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="urlLabel" runat="server" Text='<%# Eval("url") %>' />
            </td>
            <td>
                <asp:Label ID="userIdLabel" runat="server" Text='<%# Eval("userId") %>' />
            </td>
        </tr>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            <td>
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
            </td>
            <td>
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            </td>
            <td>
                <asp:TextBox ID="createdTextBox" runat="server" Text='<%# Bind("created") %>' />
            </td>
            <td>
                <asp:CheckBox ID="createdSpecifiedCheckBox" runat="server" Checked='<%# Bind("createdSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="thumbnailUrlTextBox" runat="server" Text='<%# Bind("thumbnailUrl") %>' />
            </td>
            <td>
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
            </td>
            <td>
                <asp:TextBox ID="durationTextBox" runat="server" Text='<%# Bind("duration") %>' />
            </td>
            <td>
                <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
            </td>
            <td>
                <asp:TextBox ID="languageTextBox" runat="server" Text='<%# Bind("language") %>' />
            </td>
            <td>
                <asp:TextBox ID="albumIdTextBox" runat="server" Text='<%# Bind("albumId") %>' />
            </td>
            <td>
                <asp:TextBox ID="fileSizeTextBox" runat="server" Text='<%# Bind("fileSize") %>' />
            </td>
            <td>
                <asp:CheckBox ID="fileSizeSpecifiedCheckBox" runat="server" Checked='<%# Bind("fileSizeSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="startTimeTextBox" runat="server" Text='<%# Bind("startTime") %>' />
            </td>
            <td>
                <asp:CheckBox ID="startTimeSpecifiedCheckBox" runat="server" Checked='<%# Bind("startTimeSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
            </td>
            <td>
                <asp:TextBox ID="numVotesTextBox" runat="server" Text='<%# Bind("numVotes") %>' />
            </td>
            <td>
                <asp:TextBox ID="numCommentsTextBox" runat="server" Text='<%# Bind("numComments") %>' />
            </td>
            <td>
                <asp:TextBox ID="numViewsTextBox" runat="server" Text='<%# Bind("numViews") %>' />
            </td>
            <td>
                <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
            </td>
            <td>
                <asp:TextBox ID="taggedPeopleTextBox" runat="server" Text='<%# Bind("taggedPeople") %>' />
            </td>
            <td>
                <asp:TextBox ID="mimeTypeTextBox" runat="server" Text='<%# Bind("mimeType") %>' />
            </td>
            <td>
                <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
            </td>
            <td>
                <asp:CheckBox ID="typeSpecifiedCheckBox" runat="server" Checked='<%# Bind("typeSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
            </td>
            <td>
                <asp:TextBox ID="userIdTextBox" runat="server" Text='<%# Bind("userId") %>' />
            </td>
        </tr>
    </EditItemTemplate>
    <EmptyDataTemplate>
        <table id="Table1" runat="server" style="">
            <tr>
                <td>
                    No data was returned.
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </td>
            <td>
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
            </td>
            <td>
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            </td>
            <td>
                <asp:TextBox ID="createdTextBox" runat="server" Text='<%# Bind("created") %>' />
            </td>
            <td>
                <asp:CheckBox ID="createdSpecifiedCheckBox" runat="server" Checked='<%# Bind("createdSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="thumbnailUrlTextBox" runat="server" Text='<%# Bind("thumbnailUrl") %>' />
            </td>
            <td>
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
            </td>
            <td>
                <asp:TextBox ID="durationTextBox" runat="server" Text='<%# Bind("duration") %>' />
            </td>
            <td>
                <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
            </td>
            <td>
                <asp:TextBox ID="languageTextBox" runat="server" Text='<%# Bind("language") %>' />
            </td>
            <td>
                <asp:TextBox ID="albumIdTextBox" runat="server" Text='<%# Bind("albumId") %>' />
            </td>
            <td>
                <asp:TextBox ID="fileSizeTextBox" runat="server" Text='<%# Bind("fileSize") %>' />
            </td>
            <td>
                <asp:CheckBox ID="fileSizeSpecifiedCheckBox" runat="server" Checked='<%# Bind("fileSizeSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="startTimeTextBox" runat="server" Text='<%# Bind("startTime") %>' />
            </td>
            <td>
                <asp:CheckBox ID="startTimeSpecifiedCheckBox" runat="server" Checked='<%# Bind("startTimeSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
            </td>
            <td>
                <asp:TextBox ID="numVotesTextBox" runat="server" Text='<%# Bind("numVotes") %>' />
            </td>
            <td>
                <asp:TextBox ID="numCommentsTextBox" runat="server" Text='<%# Bind("numComments") %>' />
            </td>
            <td>
                <asp:TextBox ID="numViewsTextBox" runat="server" Text='<%# Bind("numViews") %>' />
            </td>
            <td>
                <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
            </td>
            <td>
                <asp:TextBox ID="taggedPeopleTextBox" runat="server" Text='<%# Bind("taggedPeople") %>' />
            </td>
            <td>
                <asp:TextBox ID="mimeTypeTextBox" runat="server" Text='<%# Bind("mimeType") %>' />
            </td>
            <td>
                <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
            </td>
            <td>
                <asp:CheckBox ID="typeSpecifiedCheckBox" runat="server" Checked='<%# Bind("typeSpecified") %>' />
            </td>
            <td>
                <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
            </td>
            <td>
                <asp:TextBox ID="userIdTextBox" runat="server" Text='<%# Bind("userId") %>' />
            </td>
        </tr>
    </InsertItemTemplate>
    <ItemTemplate>
        <tr style="">
            <td>
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            </td>
            <td>
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            </td>
            <td>
                <asp:Label ID="createdLabel" runat="server" Text='<%# Eval("created") %>' />
            </td>
            <td>
                <asp:CheckBox ID="createdSpecifiedCheckBox" runat="server" Checked='<%# Eval("createdSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="thumbnailUrlLabel" runat="server" Text='<%# Eval("thumbnailUrl") %>' />
            </td>
            <td>
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            </td>
            <td>
                <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
            </td>
            <td>
                <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
            </td>
            <td>
                <asp:Label ID="languageLabel" runat="server" Text='<%# Eval("language") %>' />
            </td>
            <td>
                <asp:Label ID="albumIdLabel" runat="server" Text='<%# Eval("albumId") %>' />
            </td>
            <td>
                <asp:Label ID="fileSizeLabel" runat="server" Text='<%# Eval("fileSize") %>' />
            </td>
            <td>
                <asp:CheckBox ID="fileSizeSpecifiedCheckBox" runat="server" Checked='<%# Eval("fileSizeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="startTimeLabel" runat="server" Text='<%# Eval("startTime") %>' />
            </td>
            <td>
                <asp:CheckBox ID="startTimeSpecifiedCheckBox" runat="server" Checked='<%# Eval("startTimeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
            </td>
            <td>
                <asp:Label ID="numVotesLabel" runat="server" Text='<%# Eval("numVotes") %>' />
            </td>
            <td>
                <asp:Label ID="numCommentsLabel" runat="server" Text='<%# Eval("numComments") %>' />
            </td>
            <td>
                <asp:Label ID="numViewsLabel" runat="server" Text='<%# Eval("numViews") %>' />
            </td>
            <td>
                <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
            </td>
            <td>
                <asp:Label ID="taggedPeopleLabel" runat="server" Text='<%# Eval("taggedPeople") %>' />
            </td>
            <td>
                <asp:Label ID="mimeTypeLabel" runat="server" Text='<%# Eval("mimeType") %>' />
            </td>
            <td>
                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
            </td>
            <td>
                <asp:CheckBox ID="typeSpecifiedCheckBox" runat="server" Checked='<%# Eval("typeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="urlLabel" runat="server" Text='<%# Eval("url") %>' />
            </td>
            <td>
                <asp:Label ID="userIdLabel" runat="server" Text='<%# Eval("userId") %>' />
            </td>
        </tr>
    </ItemTemplate>
    <LayoutTemplate>
        <table id="Table2" runat="server">
            <tr id="Tr1" runat="server">
                <td id="Td1" runat="server">
                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                        <tr id="Tr2" runat="server" style="">
                            <th id="Th1" runat="server">
                                id
                            </th>
                            <th id="Th2" runat="server">
                                title
                            </th>
                            <th id="Th3" runat="server">
                                created
                            </th>
                            <th id="Th4" runat="server">
                                createdSpecified
                            </th>
                            <th id="Th5" runat="server">
                                thumbnailUrl
                            </th>
                            <th id="Th6" runat="server">
                                description
                            </th>
                            <th id="Th7" runat="server">
                                duration
                            </th>
                            <th id="Th8" runat="server">
                                location
                            </th>
                            <th id="Th9" runat="server">
                                language
                            </th>
                            <th id="Th10" runat="server">
                                albumId
                            </th>
                            <th id="Th11" runat="server">
                                fileSize
                            </th>
                            <th id="Th12" runat="server">
                                fileSizeSpecified
                            </th>
                            <th id="Th13" runat="server">
                                startTime
                            </th>
                            <th id="Th14" runat="server">
                                startTimeSpecified
                            </th>
                            <th id="Th15" runat="server">
                                rating
                            </th>
                            <th id="Th16" runat="server">
                                numVotes
                            </th>
                            <th id="Th17" runat="server">
                                numComments
                            </th>
                            <th id="Th18" runat="server">
                                numViews
                            </th>
                            <th id="Th19" runat="server">
                                tags
                            </th>
                            <th id="Th20" runat="server">
                                taggedPeople
                            </th>
                            <th id="Th21" runat="server">
                                mimeType
                            </th>
                            <th id="Th22" runat="server">
                                type
                            </th>
                            <th id="Th23" runat="server">
                                typeSpecified
                            </th>
                            <th id="Th24" runat="server">
                                url
                            </th>
                            <th id="Th25" runat="server">
                                userId
                            </th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr3" runat="server">
                <td id="Td2" runat="server" style="">
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <tr style="">
            <td>
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            </td>
            <td>
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            </td>
            <td>
                <asp:Label ID="createdLabel" runat="server" Text='<%# Eval("created") %>' />
            </td>
            <td>
                <asp:CheckBox ID="createdSpecifiedCheckBox" runat="server" Checked='<%# Eval("createdSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="thumbnailUrlLabel" runat="server" Text='<%# Eval("thumbnailUrl") %>' />
            </td>
            <td>
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            </td>
            <td>
                <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
            </td>
            <td>
                <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
            </td>
            <td>
                <asp:Label ID="languageLabel" runat="server" Text='<%# Eval("language") %>' />
            </td>
            <td>
                <asp:Label ID="albumIdLabel" runat="server" Text='<%# Eval("albumId") %>' />
            </td>
            <td>
                <asp:Label ID="fileSizeLabel" runat="server" Text='<%# Eval("fileSize") %>' />
            </td>
            <td>
                <asp:CheckBox ID="fileSizeSpecifiedCheckBox" runat="server" Checked='<%# Eval("fileSizeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="startTimeLabel" runat="server" Text='<%# Eval("startTime") %>' />
            </td>
            <td>
                <asp:CheckBox ID="startTimeSpecifiedCheckBox" runat="server" Checked='<%# Eval("startTimeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
            </td>
            <td>
                <asp:Label ID="numVotesLabel" runat="server" Text='<%# Eval("numVotes") %>' />
            </td>
            <td>
                <asp:Label ID="numCommentsLabel" runat="server" Text='<%# Eval("numComments") %>' />
            </td>
            <td>
                <asp:Label ID="numViewsLabel" runat="server" Text='<%# Eval("numViews") %>' />
            </td>
            <td>
                <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
            </td>
            <td>
                <asp:Label ID="taggedPeopleLabel" runat="server" Text='<%# Eval("taggedPeople") %>' />
            </td>
            <td>
                <asp:Label ID="mimeTypeLabel" runat="server" Text='<%# Eval("mimeType") %>' />
            </td>
            <td>
                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
            </td>
            <td>
                <asp:CheckBox ID="typeSpecifiedCheckBox" runat="server" Checked='<%# Eval("typeSpecified") %>'
                    Enabled="false" />
            </td>
            <td>
                <asp:Label ID="urlLabel" runat="server" Text='<%# Eval("url") %>' />
            </td>
            <td>
                <asp:Label ID="userIdLabel" runat="server" Text='<%# Eval("userId") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="sqldtsrc_GetGroupActivitiesItemsCache" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT * FROM [socios_FindMediaItemsCache] WHERE ([sessionId] = @sessionId)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="sessionId" SessionField="findGroupActivitiesCacheSessionId"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_GetGroupEventsItemsCache" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT * FROM [socios_FindMediaItemsCache] WHERE ([sessionId] = @sessionId)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="sessionId" SessionField="findGroupEventsCacheSessionId"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_FindMediaItemsCache" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT * FROM [socios_FindMediaItemsCache] WHERE ([sessionId] = @sessionId)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="sessionId" SessionField="findMediaItemsCacheSessionId"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_ConnectedPersonsCache" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT * FROM [socios_ConnectedPersonsCache] WHERE ([sessionId] = @sessionId)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="sessionId" SessionField="connectedPersonsCacheSessionId"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_AllSocialNetworks" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT Id,CASE WHEN ParentId = 1 THEN NULL ELSE ParentId END AS ParentId ,Value FROM socios_SocialNetworks Tax">
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_ConnectedPersonCache" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT cacheId, sessionId, username, profileUrl, source, userId, thumbnailUrl FROM socios_ConnectedPersonsCache WHERE (sessionId = @sessionId) AND (username = @username)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="sessionId" SessionField="connectedPersonsCacheSessionId"
            Type="String" />
        <asp:ControlParameter ControlID="hdnfld_singleConnectedPersonUsername" Name="username"
            PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="hdnfld_singleConnectedPersonUsername" runat="server" />
<dnnweb:DnnFormDecorator ID="RadFormDecorator1" runat="server" ControlsToSkip="CheckBoxes,RadioButtons" />

<asp:SqlDataSource ID="sqldtsrc_SelectedMediaItems" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    SelectCommand="SELECT CacheId,Item, Url, Title, Id, Id_Id FROM socios_FindMediaItemsCache WHERE (sessionId = @sessionId) AND (selected = 1)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="sessionId" SessionField="findMediaItemsCacheSessionId"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sqldtsrc_SearchMediaItemsHistory" runat="server" ConnectionString="<%$ ConnectionStrings:SiteSqlServer %>"
    
    SelectCommand="SELECT TOP (8) SearchTerms, SearchGuid, SearchDate, ResultsCount, FlickrResults, FacebookResults, TwitterResults, GooglepResults, DailymotionResults, YoutubeResults, MySpaceResults FROM socios_MediaItemsSearchHistory WHERE (UserId = @UserId) ORDER BY SearchDate DESC">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="-1" Name="UserId" SessionField="SearchUserId" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:UpdatePanel ID="updpnlErrorLog" runat="server">
<ContentTemplate>
<asp:Label ID="lblErrorLog" CssClass="errorLog" runat="server" Text=""></asp:Label></ContentTemplate>
</asp:UpdatePanel>

<div class="hidden">
<div id="privacyPolicyDialog">


<div class="privacyPolicyInPopup">
 <div class="dnnFormMessage dnnFormInfo">
                                    
The full privacy notice is available <b><a href="PrivacyPolicy.aspx">here</a></b>.</div>

<h2>Scope</h2>

<b>This condensed privacy notice applies to the SocIoS Prototype.</b>

<h2>Personal Information collected</h2>

<p>We collect information you provide by subscribing to the SocIoS platform such as your name, user name and email address.</p>

<p>We collect the public information available on your Facebook/ Twitter/ FlickR/ Dailymotion/ YouTube/ MySpace profile such as your name, last name, user name, e-mail address, age, gender, and home town. We never collect the information you have made public under the categories "Philosophy" and "Contact information" on your Facebook profile.

<p>We keep information on your activity with us and on your interactions with other users.

<h2>Uses</h2>

<p>We use these data for scientific research purposes to test the proper functioning of the SocIoS Prototype. This prototype is a tool that monitors and aggregates user activity so as to conduct controlled content searches in public profile data, content ranking and classification.

<p>We may recommend additional content that may be of interest to you based on their social value (i.e. popularity among the social media users).

<p>We process the information we collect about you to detect malicious behaviours.

<p>Your name, last name, user name, e-mail address will be used for communication with you and for issuance of the invitations for the next trials.

<h2>Choices</h2>

<p>You may access personal information that we hold about you. You can ask us to correct any errors or delete the information we have about you (see below under "how to contact us" for contact details).</p>

<p>You may choose not to receive any further contact from us (i.e you may choose to opt-out From being contracted by us).</p>

<p>To protect your privacy and the privacy of others, we may have to verify that you are who you say you are before we can give you access to, or change, information about you.</p>

<p>To ensure the reliability of the tests we can ask you to provide a legitimate reason if you require your data to be deleted.</p>

<h2>Important information</h2>

<p>If you do not wish to share some of the information contained in your public profile with us, you should inform us, provide a legitimate reason if necessary for ensuring the reliability of the tests, and we will delete this information from our databases.</p>

<p>Your participation in the SocIoS trial may in some cases reveal information about your racial or ethnic origin, political opinions, religious or philosophical beliefs, trade-union membership, and data concerning health or sex life. SocIoS consortium will not seek to obtain such information nor will it carry any data analysis based on this information. However, if you decide to reveal this information while interacting on the SocIoS platform, you expressly and explicitly consent to have this information processed for the purposes mentioned above in the "Uses" section.</p>

<h2>How to contact us?</h2>

<p>You can contact +Spaces Consortium partner Athens Technology Center (ATC), via mail: Rizariou 10, Chalandri 152 33, Athens, Greece, via telephone: +30/210-6874300, via fax: +30/210-6855564, or via e-mail: info@atc.gr.</p>
</div>

</div>
</div>
<%--<b>Access tokens</b>
                <div>
                </div>
                <asp:Label ID="lbl_AccessInfo" runat="server" Text=""></asp:Label><br />
                <asp:LinkButton ID="lnkbtn_RefreshAccess" runat="server" OnClick="lnkbtn_RefreshAccess_Click">See My Access Tokens</asp:LinkButton>
                <hr />--%>

