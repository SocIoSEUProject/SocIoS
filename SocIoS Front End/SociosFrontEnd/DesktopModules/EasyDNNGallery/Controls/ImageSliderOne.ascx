<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_ImageSliderOne, App_Web_imagesliderone.ascx.dc9a219e" %>

<script src="<%=ModulePath.Replace("Controls/","")%>js/swfobject.js" type="text/javascript"></script>
           
<%--<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>" rel="stylesheet" type="text/css" media="screen" />--%>

<style type="text/css">
    #<%=ViewState["ModulNr"]%>
    {
        background:#202834 url(<%=ModulePath.Replace("Controls/","")%>css/images/loading.gif) no-repeat scroll 50% 50%;
        margin:5px 5px 10px;
        position:relative;
    }
    
    #<%=ViewState["ModulNr"]%> img 
    {
        display:none;
        left:0;
        position:absolute;
        top:0;
    }
    #<%=ViewState["ModulNr"]%> a 
    {
        border:0 none;
        display:block;
    } 
</style>

<link href="<%=ModulePath.Replace("Controls/","")%>css/nivo-slider.css" rel="stylesheet"
    type="text/css" />
    
<script src="<%=ModulePath.Replace("Controls/","")%>js/jquery.nivo.slider.js" type="text/javascript"></script>

<div id="ImageSliderOne" runat="server">
 <script type="text/javascript">
                <%=ViewState["jQuery"]%>(window).load(function() {
	                <%=ViewState["jQuery"]%>('#<%=ViewState["ModulNr"]%>').nivoSlider({
		                effect:'<%=ViewState["SliderEffect"]%>', 
		                animSpeed:<%=ViewState["SliderTransition"]%>,
		                pauseTime:<%=ViewState["SlidePause"]%>,
		                startSlide:<%=ViewState["SliderStart"]%>, 
		                directionNav:true, 
		                directionNavHide:true, 
		                controlNav:<%=ViewState["PagingVisible"]%>, 
		                controlNavThumbs:false, 
                        controlNavThumbsFromRel:false,
		                keyboardNav:true, 
		                pauseOnHover:true, 
		                manualAdvance:false, 
		                captionOpacity:0.8 
	                });
                });                
            </script>
            
    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <div class="sliderborder">
                    <div class="sliderborder2">
                        <div id='<%=ViewState["ModulNr"]%>' style='width: <%=ViewState["SliderWidth"]%>px;
                            height: <%= ViewState["SliderHeight"]%>px'>
                            <asp:Repeater ID="repImageSlider" runat="server" DataSourceID="odsGetOnlyImages"
                                EnableTheming="True">
                                <ItemTemplate>
                                    
                                            <a href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>' rel="<%#RelLink()%>"
                                                target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                <img id="imgImageSlider" runat="server" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
                                                    title='<%#ImageSliderTD(Eval("Title"),Eval("Description"),Eval("PictureID")) %>' />
                                            </a>
                                     
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
    <SelectParameters>
        <asp:Parameter Name="PortalID" Type="Int32" />
        <asp:Parameter Name="ModuleID" Type="Int32" />
        <asp:Parameter Name="ArticleID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" SelectMethod="GetOnlyImagesFromGallery"
    TypeName="DataAcess">
    <SelectParameters>
        <asp:Parameter Name="GalleryID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
