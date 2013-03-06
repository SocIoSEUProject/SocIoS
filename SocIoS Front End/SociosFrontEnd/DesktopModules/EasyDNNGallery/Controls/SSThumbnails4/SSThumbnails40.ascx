<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_SSThumbnailsControl4, App_Web_ssthumbnails40.ascx.b92ef30d" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    
 <script type="text/javascript">

<%=ViewState["jQuery"]%>(document).ready(function() 
{
 
 if('<%=ViewState["ShowToolTips"]%>'=='True')
   {
   if('<%=ViewState["LightboxDescription"] %>'=='True')
   {
    <%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>EasyDNNGallery .panel a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGvideo a[title], #<%=ViewState["ModulNr"]%>EasyDNNGallery .EDGaudio a[title]').each(function() // Select all elements with the "tooltip" attribute
    {
        if(<%=ViewState["jQuery"]%>(this).attr("title").length>0)
        {
            <%=ViewState["jQuery"]%>(this).qtip(
            {
                show: { effect: {type: '<%=ViewState["ShowEffect"]%>', length: '<%=ViewState["ShowEffectDuration"]%>' } },
                hide: { effect: {type: '<%=ViewState["HideEffect"]%>', length: '<%=ViewState["HideEffectDuration"]%>' } },
                position: { corner: { target: '<%=ViewState["TargetPosition"]%>', tooltip: '<%=ViewState["TooltipPosition"]%>'}},
                style: { name: '<%=ViewState["TooltipTheme"]%>', tip: true ,  border: { width: <%=ViewState["TooltipBorder"]%>, radius: <%=ViewState["TooltipRadius"]%> }} 
            });
        }
    });
    }
    }
    
});


//var $ = jQuery.noConflict();    
</script>
  
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
                ttn: <%=ViewState["TTN"]%>,
                external_description_height: <%=ViewState["OverlaySize"]%>,
                external_description_position: '<%=ViewState["TitlePosition"]%>',
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
                    <div id='<%=ViewState["ModulNr"] %>' align="center" class="galleryview">
                        <asp:Repeater ID="Repeater2" runat="server" OnItemCreated="Repeater2_ItemCreated"
                            Visible="<%# ToDisplaySSBN() %>">
                            <ItemTemplate>
                                <div class="panel">
                                    <a  href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID"))%>' rel="<%#RelLink()%>" target="<%#TargetWin()%>"
                                     title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                        <asp:Image ID="imgSlideImage" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ShortEmbedUrl")) %>' />
                                    </a>
                                    <asp:Panel ID="pnlMediaInfo" class="media_info" style="display: none;" Visible='<%#IsOverlayVisibleBol(Eval("Title"),Eval("Description"))%>' runat="server">
                                        <p class="title"><%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%></p>
                                        <div class="content"><%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%></div>
                                    </asp:Panel>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <ul  id='FS<%=ViewState["ModulNr"]%>' class="filmstrip">
                            <asp:Repeater ID="repThumbs" runat="server" 
                                Visible="<%# ToDisplayFilmStrip() %>">
                                <ItemTemplate>
                                    <li>
                                        <asp:Image ID="imgThumbImage" runat="server" alt='<%#Eval("Title")%>' ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>' />
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

<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" TypeName="DataAcess" 
    SelectMethod="GetOnlyRandomImagesFromGallery" 
    OldValuesParameterFormatString="{0}">
    <SelectParameters>
        <asp:Parameter Name="GalleryID" Type="Int32" />
        <asp:Parameter Name="isRandom" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
