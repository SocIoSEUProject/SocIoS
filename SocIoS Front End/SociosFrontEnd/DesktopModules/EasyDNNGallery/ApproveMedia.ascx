<%@ control language="C#" inherits="EasyDNN.Modules.EasyDNNGallery.ApproveMedia, App_Web_approvemedia.ascx.af09375b" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<link href="<%=ModulePath%>UserUpload.css" rel="stylesheet" type="text/css" />

<script src="<%=ModulePath%>js/swfobject.js" type="text/javascript"></script>

<style type="text/css">
    .tablecolumnleft2
    {
    }
    .tablecolumnleft
    {
    }
    .style4
    {
        width: 165px;
    }
</style>

<div id="divUpload">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="EDGAdminContent">
                    <p style="width: 800px">
                        <asp:Label ID="lblPortalID" runat="server" Visible="False" resourcekey="lblPortalIDResource1"
                            meta:resourcekey="lblPortalIDResource1"></asp:Label>
                        <asp:Panel ID="pnlApproveMedia" runat="server" Border="0" Width="800px" resourcekey="btnCloseImageManageResource1"
                            meta:resourcekey="pnlApproveMediaResource1">
                            <table cellpadding="2" cellspacing="2" width="800px">
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <asp:ObjectDataSource ID="odsGalleryImages" TypeName="DataAcess" runat="server" SelectMethod="GetAllUnapprovedImagesFromGallery"
                                UpdateMethod="UpdateImageApprove" DeleteMethod="DeleteImage">
                                <DeleteParameters>
                                    <asp:Parameter Name="PictureID" Type="Int32" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSelectGallery" Name="GalleryID" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="PictureID" Type="Int32" />
                                    <asp:Parameter Name="Category" Type="String" />
                                    <asp:Parameter Name="Title" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="FileName" Type="String" />
                                    <asp:Parameter Name="Position" Type="Int32" />
                                    <asp:Parameter Name="ImageUrl" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <div class="headermedia">
                                <div class="bordermedtop">
                                    <asp:ObjectDataSource ID="odsCategories" runat="server" SelectMethod="GetCategories"
                                        TypeName="DataAcess">
                                        <SelectParameters>
                                            <asp:Parameter Name="PortalID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="odsGalleries" runat="server" SelectMethod="GetGaleries"
                                        TypeName="DataAcess" DeleteMethod="DeleteImage" OldValuesParameterFormatString="original_{0}">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PictureID" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlSelectCategory" Name="CategoryID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="odsGetAllUnapprovedImages" TypeName="DataAcess" runat="server"
                                        SelectMethod="GetAllUnapprovedImagesFromPortal" UpdateMethod="UpdateImageApprove"
                                        DeleteMethod="DeleteImage">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PictureID" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:Parameter Name="PortalID" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PictureID" Type="Int32" />
                                            <asp:Parameter Name="Category" Type="String" />
                                            <asp:Parameter Name="Title" Type="String" />
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="FileName" Type="String" />
                                            <asp:Parameter Name="Position" Type="Int32" />
                                            <asp:Parameter Name="ImageUrl" Type="String" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="odsGetUsersAllUnapprovedImages" runat="server" DeleteMethod="DeleteImage"
                                        SelectMethod="GetUsersForAllUnapprovedImagesFromPortal" TypeName="DataAcess"
                                        UpdateMethod="UpdateImageApprove">
                                        <DeleteParameters>
                                            <asp:Parameter Name="PictureID" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:Parameter Name="PortalID" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PictureID" Type="Int32" />
                                            <asp:Parameter Name="Category" Type="String" />
                                            <asp:Parameter Name="Title" Type="String" />
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="FileName" Type="String" />
                                            <asp:Parameter Name="Position" Type="Int32" />
                                            <asp:Parameter Name="ImageUrl" Type="String" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                </div>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="style4">
                                            <img alt="Manage Media" src="<%=ModulePath%>images/mediamanagerthumb.png" style="width: 124px;
                                                height: 103px" />
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="lblMediaManagerTitle" resourcekey="lblMediaManagerTitle" runat="server"
                                                CssClass="MediaManagerTitle" Text="&lt;b&gt;Approve&lt;/b&gt; Media"></asp:Label>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;<div class="bordermedbot">
                                </div>
                            </div>
                            <div class="gallerylistbox">
                                <asp:Panel ID="pnlSelectCategoryGallery" runat="server" Visible="False" meta:resourcekey="pnlSelectCategoryGalleryResource1">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <td align="left">
                                                <table cellpadding="0" cellspacing="0" class="selectcategory" style="margin-bottom: 7px;">
                                                    <tr>
                                                        <td>
                                                            <div class="selcatleft">
                                                            </div>
                                                        </td>
                                                        <td valign="middle">
                                                            <asp:Label ID="lblSelectedCatName" runat="server" CssClass="selectcategorytxt" resourcekey="lblSelectedCatNameResource1"
                                                                Text="Select category:"></asp:Label>
                                                            &nbsp;<asp:DropDownList ID="ddlSelectCategory" runat="server" DataSourceID="odsCategories"
                                                                DataTextField="CategoryName" DataValueField="CategoryID" meta:resourcekey="ddlSelectCategoryResource1"
                                                                AutoPostBack="True" OnSelectedIndexChanged="ddlSelectCategory_SelectedIndexChanged1">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <div class="selcatright">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table cellpadding="0" cellspacing="0" class="selectgalegory" style="margin-left: 35px;">
                                                    <tr>
                                                        <td>
                                                            <div class="selgalleft">
                                                            </div>
                                                        </td>
                                                        <td valign="middle">
                                                            <asp:Label ID="lblSelectedGalleryNameTitle" runat="server" CssClass="selectcategorytxt"
                                                                resourcekey="lblSelectedGalleryNameTitleResource1" Text="Select gallery:"></asp:Label>
                                                            &nbsp;<asp:DropDownList ID="ddlSelectGallery" runat="server" AutoPostBack="True"
                                                                DataSourceID="odsGalleries" DataTextField="GalleryName" DataValueField="GalleryID"
                                                                OnSelectedIndexChanged="ddlSelectGallery_SelectedIndexChanged" meta:resourcekey="ddlSelectGalleryResource1">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <div class="selgalright">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="pnlShowAllMedia" runat="server" Visible="False" meta:resourcekey="pnlShowAllMediaResource1">
                                    <div style="background-color: #CCCCCC; padding-top: 2px; padding-bottom: 2px; margin-top:10px;">
                                        <div style="padding: 7px; background-color: #666666; text-decoration: none;">
                                            <asp:LinkButton ID="lbShowMediaByGallery" runat="server" CssClass="selectcategorytxt"
                                                OnClick="lbShowMediaByCategory_Click" Visible="False" Font-Bold="True" resourcekey="lbShowMediaByGalleryResource1">Show media by category &amp; gallery</asp:LinkButton>
                                            <asp:LinkButton ID="lbShowAllMedia" runat="server" CssClass="selectcategorytxt" OnClick="lb_Click"
                                                Font-Bold="True" resourcekey="lbShowAllMediaResource1">Show all unapproved media</asp:LinkButton>
                                           
                                            <asp:Panel ID="pnlFilterUsers" runat="server" Visible="False" meta:resourceKey="pnlFilterUsersResource1">
                                                <div style="margin-top:15px; margin-bottom:15px;"><asp:CheckBox ID="cbFilterByUser" runat="server" AutoPostBack="True" OnCheckedChanged="cbFilterByUser_CheckedChanged"
                                                    Text="Filter by user." resourceKey="cbFilterByUserResource1"  ForeColor="#ffffff"/>&nbsp;
                                                <asp:DropDownList ID="ddlUserList" runat="server" AutoPostBack="True" DataSourceID="odsGetUsersAllUnapprovedImages"
                                                    DataTextField="DisplayName" DataValueField="UserID" OnSelectedIndexChanged="ddlUserList_SelectedIndexChanged"
                                                    meta:resourceKey="ddlUserListResource1">
                                                </asp:DropDownList></div>
                                            </asp:Panel>
                                           
                                        </div>
                                    </div>
                                </asp:Panel>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMedidaManagerMessage" runat="server" Visible="False" resourcekey="lblMedidaManagerMessageResource1"
                                                meta:resourcekey="lblMedidaManagerMessageResource1"></asp:Label>
                                            <asp:GridView ID="gvGalleryImages" runat="server" AllowPaging="True" AllowSorting="True"
                                                AutoGenerateColumns="False" Border="0" CellPadding="4" CssClass="galleryliststylebox"
                                                DataKeyNames="PictureID" DataSourceID="odsGalleryImages" ForeColor="Black" OnDataBound="gvGalleryImages_DataBound"
                                                OnPreRender="gvGalleryImages_PreRender" OnRowCancelingEdit="gvGalleryImages_RowCancelingEdit"
                                                OnRowCommand="gvGalleryImages_RowCommand" OnRowCreated="gvGalleryImages_RowCreated"
                                                OnRowDeleted="gvGalleryImages_RowDeleted" OnRowEditing="gvGalleryImages_RowEditing"
                                                OnRowUpdated="gvGalleryImages_RowUpdated" OnSelectedIndexChanged="gvGalleryImages_SelectedIndexChanged"
                                                Width="800px" GridLines="Horizontal" 
                                                resourcekey="gvGalleryImagesResource1" OnRowDataBound="gvGalleryImages_RowDataBound"
                                                ShowFooter="True" meta:resourcekey="gvGalleryImagesResource1" 
                                                EnableModelValidation="True">
                                                <AlternatingRowStyle CssClass="gallerygrid1" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Action" meta:resourcekey="Action" ShowHeader="False">
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="lbMediaUpdate" runat="server" CommandName="Update" CssClass="gallerycontrollink"
                                                                Text="Update" resourcekey="lbMediaUpdateResource1"></asp:LinkButton>
                                                            &nbsp;<asp:LinkButton ID="lbMediaCancel" runat="server" CausesValidation="False"
                                                                CommandName="Cancel" CssClass="gallerycontrollink" Text="Cancel" resourcekey="lbMediaCancelResource1"
                                                                ></asp:LinkButton>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbMediaEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                                CssClass="gallerycontrollinklight" Text="Quick Edit" resourcekey="lbMediaEditResource1"
                                                                ></asp:LinkButton>
                                                            <asp:LinkButton ID="lbMediaDelete" runat="server" CommandName="Delete" CssClass="gallerycontrollinklight"
                                                                OnClientClick="return confirm('Are you sure you want to delete this media?');"
                                                                Text="Delete" resourcekey="lbMediaDeleteResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ControlStyle Width="70px" />
                                                        <ItemStyle HorizontalAlign="Left" Width="70px" Wrap="True" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="PictureID" HeaderText="ID" meta:resourcekey="ID" ReadOnly="True">
                                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="GalleryID" HeaderText="GalleryID" meta:resourcekey="GalleryID"
                                                        ReadOnly="True" Visible="False" />
                                                    <asp:TemplateField HeaderText="Title" meta:resourcekey="Title" SortExpression="Title">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Title") %>' resourcekey="TextBox3Resource1"
                                                                meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbMediaTitleOpen" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                                CommandName="Open" CssClass="gallerycontrollinklight" Text='<%# Bind("Title") %>'
                                                                resourcekey="lbMediaTitleOpenResource1" meta:resourcekey="lbMediaTitleOpenResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description" meta:resourcekey="Description">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="tbMediaEditDescription" runat="server" Height="150px" Text='<%# Bind("Description") %>'
                                                                TextMode="MultiLine" Width="120px" resourcekey="tbMediaEditDescriptionResource1"
                                                                meta:resourcekey="tbMediaEditDescriptionResource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMediaDescription" runat="server" Text='<%# Bind("Description") %>'
                                                                resourcekey="lblMediaDescriptionResource1" meta:resourcekey="lblMediaDescriptionResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Thumbnail" meta:resourcekey="Thumbnail">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="hlMediaThumbnailOpen" runat="server" NavigateUrl='<%# Eval("FileName") %>'
                                                                Target="_blank" resourcekey="hlMediaThumbnailOpenResource1" meta:resourcekey="hlMediaThumbnailOpenResource1">
                                                                <asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" BorderWidth="3px"
                                                                    CssClass="imagethumbbrd" ImageUrl='<%# Eval("ThumbUrl") %>' resourcekey="Image1Resource1"
                                                                    meta:resourcekey="Image1Resource1" />
                                                            </asp:HyperLink>
                                                            <br />
                                                            <asp:Label ID="lblMediaImageUrl" runat="server" Text='<%# Bind("ImageUrl") %>' resourcekey="lblMediaImageUrlResource1"
                                                                meta:resourcekey="lblMediaImageUrlResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Position" meta:resourcekey="Position" SortExpression="Position"
                                                        Visible="False">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="tbMediaPosition" runat="server" CssClass="boxposition2" Text='<%# Bind("Position") %>'
                                                                resourcekey="tbMediaPositionResource1" meta:resourcekey="tbMediaPositionResource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="btnMediaSavePositions" runat="server" CssClass="btnsaveposition"
                                                                            OnClick="btnSavePositions_Click" Text="Save Positions" ToolTip="Save Positions"
                                                                            resourcekey="btnMediaSavePositionsResource1" meta:resourcekey="btnMediaSavePositionsResource1" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton ID="imgbtnRearangeMediaPositions" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/rearrangegal.png"
                                                                            OnClick="btnOrgPozicije_Click" ToolTip="Rearrange media positions numbers in gallery."
                                                                            resourcekey="imgbtnRearangeMediaPositionsResource1" meta:resourcekey="imgbtnRearangeMediaPositionsResource1" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="padding-right: 10px;">
                                                                        <asp:TextBox ID="tbMediaPosition" runat="server" CssClass="boxposition2" Text='<%# Bind("Position") %>'
                                                                            resourcekey="tbMediaPositionResource2" meta:resourcekey="tbMediaPositionResource2"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton ID="imbMediaUp" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                                            CommandName="Up" Height="16px" ImageUrl="~/images/action_up.gif" Text="Up" resourcekey="imbMediaUpResource1"
                                                                            meta:resourcekey="imbMediaUpResource1" />
                                                                        <br />
                                                                        <asp:ImageButton ID="imbMediaDown" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                                            CommandName="Down" ImageUrl="~/images/action_down.gif" Text="Gore" resourcekey="imbMediaDownResource1"
                                                                            meta:resourcekey="imbMediaDownResource1" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False" Visible="False" meta:resourcekey="TemplateFieldResource1">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imbMediaUp2" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                                CommandName="Up" ImageUrl="~/images/action_up.gif" Text="Up" resourcekey="imbMediaUp2Resource1"
                                                                meta:resourcekey="imbMediaUp2Resource1" />
                                                            <br />
                                                            <asp:ImageButton ID="imbMediaDown2" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                                CommandName="Down" ImageUrl="~/images/action_down.gif" Text="Gore" resourcekey="imbMediaDown2Resource1"
                                                                meta:resourcekey="imbMediaDown2Resource1" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="MediaType" HeaderText="Type" meta:resourcekey="Type" ReadOnly="True"
                                                        SortExpression="MediaType">
                                                        <ControlStyle Width="50px" />
                                                        <FooterStyle Width="50px" />
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="DateUploaded" HeaderText="DateUploaded" ReadOnly="True"
                                                        SortExpression="DateUploaded" meta:resourcekey="DateUploaded" >
                                                   <ItemStyle Font-Size="11px" />
                                                   <ItemStyle Width="120px" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="User" SortExpression="UserID" meta:resourcekey="User">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUserName" runat="server" Text='<%# GetUserName(Eval("UserID")) %>'
                                                                meta:resourcekey="lblUserNameResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approved" meta:resourcekey="Approved">
                                                        <EditItemTemplate>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                        <table width="100%"><tr><td>
                                                              <asp:Image ID="Image3" runat="server" ImageUrl="~/DesktopModules/EasyDNNGallery/images/remove.png" AlternateText="Unapproved" Visible='<%#!Convert.ToBoolean(GetApproved(Eval("PictureID")))%>' /><br />
                                                            <%--<asp:Label ID="lblApproved" runat="server" Text='<%# GetApproved(Eval("PictureID")) %>'
                                                                meta:resourcekey="lblApprovedResource1"></asp:Label>--%>
                                                            <br />
                                                            <asp:LinkButton ID="lbApprove" runat="server" CausesValidation="False" CommandArgument='<%# Eval("PictureID") %>'
                                                                CommandName="Approve" Font-Bold="False" Text="Approve" Visible='<%# !Convert.ToBoolean(GetApproved(Eval("PictureID"))) %>'
                                                                resourcekey="lbApproveResource1" CssClass="approvelink"></asp:LinkButton>
                                                            <asp:LinkButton ID="lbUnApprove" runat="server" CausesValidation="False" CommandArgument='<%# Eval("PictureID") %>'
                                                                CommandName="Unapprove" Font-Bold="False" Text="Unapprove" Visible='<%# Convert.ToBoolean(GetApproved(Eval("PictureID"))) %>'
                                                                resourcekey="lbUnApproveResource1"></asp:LinkButton>
                                                            <br />
                                                        
                                                        </td>
                                                        
                                                        
                                                        
                                                        
                                                        <td align="right"> <asp:CheckBox ID="cbApproved" runat="server" Checked='<%# Convert.ToBoolean(GetApproved(Eval("PictureID"))) %>'
                                                                resourcekey="cbApprovedResource1"></asp:CheckBox></td></tr></table>



                                                  
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />

                                                         <FooterTemplate>
                                                            <asp:Button ID="btnBulkApprove" runat="server" OnClick="btnBulkApprove_Click" Text="Approve"
                                                                resourcekey="btnBulkApproveResource1" CssClass="btnsaveposition"/>
                                                        </FooterTemplate>



                                                    </asp:TemplateField>
                                          
                                                </Columns>
                                                <FooterStyle CssClass="gallerygrid1" />
                                                <HeaderStyle CssClass="galleryboxheaderbgrd" Font-Names="arial" Font-Size="12px"
                                                    ForeColor="#343E1C" VerticalAlign="Middle" />
                                                <PagerStyle BackColor="#E3E1E1" CssClass="pagegal" ForeColor="#556C20" Height="45px"
                                                    HorizontalAlign="Center" />
                                                <RowStyle CssClass="gallerygrid2" />
                                                <SelectedRowStyle CssClass="gallerygridselected" />
                                            </asp:GridView>
                                            <table cellpadding="2" cellspacing="2" align="center">
                                                <tr>
                                                    <td>
                                                        <dnn:Label ID="lblNumberOfMediaPerPage" runat="server" Text="Items per page:" HelpText="Select the number of items to display on one page."
                                                            ResourceKey="lblNumberOfMediaPerPage" CssClass="labeltext" HelpKey="lblNumberOfMediaPerPage.HelpText"></dnn:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;<asp:DropDownList ID="ddlImagesPerPage" runat="server" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlImagesPerPage_SelectedIndexChanged" CssClass="ddlpageitems"
                                                            resourcekey="ddlImagesPerPageResource1" meta:resourcekey="ddlImagesPerPageResource1">
                                                            <asp:ListItem Text="10" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                            <asp:ListItem Text="30" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                            <asp:ListItem Text="50" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <table cellpadding="2" cellspacing="2" width="800px" style="padding-top: 15px; padding-right: 10px;">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="btnCloseApprove" runat="server" OnClick="btnCloseApprove_Click" Text="Close media approval"
                                                resourcekey="btnclosemediaResource1" CssClass="btnclosemediamanager" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                    </p>
                </div>
            </td>
        </tr>
    </table>
</div>
