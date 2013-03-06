<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_SSThumbnails, App_Web_ssthumbnails.ascx.dc9a219e" %>

<script src="<%=ModulePath.Replace("Controls/","")%>js/jquery.timers-1.1.2.js" type="text/javascript"></script>
<%--<script src="<%=ModulePath.Replace("Controls/","")%>js/jquery.galleryview-1.1-pack.js"
    type="text/javascript"></script>--%>
    <script src="<%=ModulePath.Replace("Controls/","")%>js/<%=ViewState["JSCFile"]%>"
    type="text/javascript"></script>
    
<%--<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>"
    rel="stylesheet" type="text/css" media="screen" />--%>
    
<link href="<%=ModulePath.Replace("Controls/","")%>js/galleryview.css" rel="stylesheet"
    type="text/css" media="screen" />
    
   <style type="text/css"> 
        
        .galleryview
         {
        height:0px;
        overflow:hidden;
        }
            
    </style>
    
<div id="SSThumbnails">
    <asp:Panel ID="pnlSSthumbs" runat="server">
        <script type="text/javascript">
        //jQuery.noConflict();
        <%=ViewState["jQuery"]%>(document).ready(function() {
            <%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"] %>').galleryView({
                panel_width: <%=ViewState["SSTHwidth"]%>,
                panel_height: <%=ViewState["SSTHheight"]%>,               
                frame_width: <%=ViewState["SSTHumbwidth"]%>,
                frame_height: <%=ViewState["SSTHumbheight"]%>,
                overlay_height: <%=ViewState["OverlaySize"]%>,
                overlay_position: '<%=ViewState["OverlayPosition"]%>',
                overlay_opacity: <%=ViewState["OverlayOpacity"]%>,
                overlay_text_color: '#<%=ViewState["OverlayTextColor"]%>',
                overlay_color:'#<%=ViewState["OverlayColor"]%>',
                transition_speed: <%=ViewState["TransitionSpeed"]%>,
                transition_interval: <%=ViewState["TransitionInterval"]%>,
                border: '<%=ViewState["BorderSize"]%>px solid #<%=ViewState["BorderColor"]%>',
                nav_theme: 'light',
                filmstrip_size: <%=ViewState["FilmStripSize"]%>,
                filmstrip_position: '<%=ViewState["ThumbnailPosition"]%>',
                pause_on_hover: true
            });
        });        
        </script>

        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                <div style="text-align: center;">
                        <asp:Label ID="lblSSTBGalleryTitle" runat="server"
                            Visible="False" style="display:block; font-weight:bold; margin-bottom:5px; font-size:large;"></asp:Label>
                        <asp:Label ID="lblSSTBGalleryDescription" runat="server" style="margin-bottom:10px; display:block; font-size:medium;"></asp:Label>
                    </div>
                    <div id='<%=ViewState["ModulNr"] %>' align="center" class="galleryview" visible="<%#ToDisplaySSBN()%>">
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="odsGetOnlyImages" OnItemCreated="Repeater2_ItemCreated"
                            Visible="<%#ToDisplaySSBN()%>">
                            <ItemTemplate>
                                <div class="panel">
                                    <a  href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID"))%>' rel="<%#RelLink()%>" target="<%#TargetWin()%>"
                                     title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                        <asp:Image ID="imgSlideImage" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ShortEmbedUrl")) %>' />
                                    </a>
                                    <div class="panel-overlay">
                                        <b>
                                            <asp:Label ID="lblSSTNMediaTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
                                        </b>
                                        <br />
                                        <asp:Label ID="lblSSTNMediaDescription" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <ul  id='FS<%=ViewState["ModulNr"]%>' class="filmstrip" visible="<%#ToDisplayFilmStrip()%>">
                            <asp:Repeater ID="repThumbs" runat="server" DataSourceID="odsGetOnlyImages" Visible="<%#ToDisplayFilmStrip()%>">
                                <ItemTemplate>
                                    <li>
                                        <asp:Image ID="imgThumbImage" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>' />
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
</div>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
    <SelectParameters>
        <asp:Parameter Name="PortalID" Type="Int32" />
        <asp:Parameter Name="ModuleID" Type="Int32" />
        <asp:Parameter Name="ArticleID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" TypeName="DataAcess" SelectMethod="GetOnlyImagesFromGallery">
    <SelectParameters>
        <asp:Parameter Name="GalleryID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
