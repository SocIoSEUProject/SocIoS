<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_ImageCarousel, App_Web_imagecarousel.ascx.dc9a219e" %>
<script src="<%=ModulePath.Replace("Controls/","")%>js/swfobject.js" type="text/javascript"></script>
<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>"
    rel="stylesheet" type="text/css" media="screen" />
<%--<link href="<%=ModulePath.Replace("Controls/","")%>css/ImageCarousel.css" rel="stylesheet"
    type="text/css" />--%>
<script src="<%=ModulePath.Replace("Controls/","")%>js/jquery.carouFredSel-3.2.0.js"
    type="text/javascript"></script>
    
    <style type="text/css">
        .image_carousel {
	        padding: 15px 0px 15px 0px;
	        position: relative;
        }
        .image_carousel img {
	        border: 1px solid #ccc;
	        background-color: white;
	        padding: 0px;
	        margin: 0px;
	        display: block;
	        float: left;
        }
        a.prev<%=ViewState["ModulNr"]%>, a.next<%=ViewState["ModulNr"]%> {
	        background: url(<%=ModulePath.Replace("Controls/","")%>css/images/miscellaneous_sprite.png) 0 0 no-repeat transparent;
	        width: 45px;
	        height: 45px;
	        display: block;
	        position: absolute;
	        top: <%=ViewState["intmiddle"]%>px;
	        z-index: 150;
        }
        a.prev<%=ViewState["ModulNr"]%> 
            {
		        left: -22px;
	        }
        a.prev<%=ViewState["ModulNr"]%>:hover
            {
    	        background-position: 0 -50px;
            }
        a.next<%=ViewState["ModulNr"]%> 
            {
    	        right: -12px;
    	        background-position: -50px 0;
            }
        a.next<%=ViewState["ModulNr"]%>:hover 
            {
    	        background-position: -50px -50px;
            }
        a.prev<%=ViewState["ModulNr"]%> span, a.next<%=ViewState["ModulNr"]%> span
            {
	            display: none;
            }
        .pagination<%=ViewState["ModulNr"]%> 
            {
	            text-align: center;
	        }
        .pagination<%=ViewState["ModulNr"]%> a 
            {
	            background: url(<%=ModulePath.Replace("Controls/","")%>css/images/miscellaneous_sprite.png) 0 -100px no-repeat transparent;
	            width: 15px;
	            height: 15px;
	            margin: 0 5px 0 0;
	            display: inline-block;
            }
        .pagination<%=ViewState["ModulNr"]%> a.selected 
            {
	            background-position: -25px -100px;
	            cursor: default;
            }
        .pagination<%=ViewState["ModulNr"]%> a span 
            {
	            display: none;
            }
        .clearfix
            {
	            float: none;
	            clear: both;
            }
            
                         #IC<%=ViewState["ModulNr"]%>
          {
              overflow: hidden;
              }  
            
        #<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain
            {
            visibility:hidden;
        }    
        
        .image_carousel
         {
        height:0px;
        overflow:hidden;
        }

    </style>

    <script type="text/javascript">
                <%=ViewState["jQuery"]%>(window).load(function() {
                <%=ViewState["jQuery"]%>('#IC<%=ViewState["ModulNr"]%>').carouFredSel({
	                auto : <%=ViewState["SSAutoSlideRandom"]%>,
	                auto : {
	                play:<%=ViewState["SSAutoSlideRandom"]%>,
	                    	pauseDuration	: <%=ViewState["SlidePause"]%>,
		                    pauseOnHover	: true
	                       },

	                items	: <%=ViewState["SliderTransition"]%>,
	                scroll	: {
		                         items 		: <%=ViewState["SSAutoStartRandom"]%>
	                        },

	                prev : {	
		                button	: '#foo2_prev<%=ViewState["ModulNr"]%>',
		                key		: "left"
	                },
	                next : { 
		                button	: '#foo2_next<%=ViewState["ModulNr"]%>',
		                key		: "right"
	                },
	                pagination	: '#<%=ViewState["PagingVisible"]%>'
                });
                 <%=ViewState["jQuery"]%>('#<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain').css('visibility', 'visible');
                <%=ViewState["jQuery"]%>('.image_carousel').css('overflow', 'visible');
                <%=ViewState["jQuery"]%>('.image_carousel').css('height', 'auto');
            }); 
                       <%=ViewState["jQuery"]%>(document).ready(function() {
                 <%=ViewState["jQuery"]%>('#<%=ViewState["CssClass"]%> #IC<%=ViewState["ModulNr"]%> .EDGmain').css('visibility', 'visible');
                <%=ViewState["jQuery"]%>('.image_carousel').css('overflow', 'visible');
                <%=ViewState["jQuery"]%>('.image_carousel').css('height', 'auto');
 
        });
    </script>
    
<div id="ImageCarousel" runat="server">
<asp:Panel ID="pnlImageCarousel" runat="server">
    <table align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <div id="<%=ViewState["CssClass"]%>">
                    <div class="EDGbackground">
                        <div class="EDGcontentbgrd">
                            <div class="EDGcornerbotleft">
                                <div class="EDGcornerbotright">
                                    <div class="EDGcornertopleft">
                                        <div class="EDGcornertopright">
                                            <div class="EDGcontent">
                                                <div class="EDGTitle">
                                                    <div class="image_carousel">
                                                        <div id='IC<%=ViewState["ModulNr"]%>'>
                                                            <asp:Repeater ID="repImageCarousel" runat="server" DataSourceID="odsGetOnlyImages">
                                                                <ItemTemplate>
                                                                    <div class="EDGmain">
                                                                        <div class="EDGimage">
                                                                            <a href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>' rel="<%#RelLink()%>"
                                                                                target="<%#TargetWin()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                                <img id="imgImageSlider" runat="server" alt='<%# GetAlt(Eval("Title"),Eval("PictureID")) %>' src='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb")) %>'
                                                                                    title='<%#ImageSliderTD(Eval("Title"),Eval("Description")) %>' />
                                                                                <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>    
                                                                                <span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"))%>'>
                                                                                    <asp:Label ID="lblTGNGTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                        Visible='<%#TitleToDisplay(Eval("Title"))%>'></asp:Label>
                                                                                    <asp:Label ID="lblTGNGDescription" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                        Visible='<%#DescriptionToDisplay(Eval("Description"))%>'></asp:Label></span>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                        <div class="clearfix">
                                                        </div>
                                                        <a class="prev<%=ViewState["ModulNr"]%>" id='foo2_prev<%=ViewState["ModulNr"]%>' href="#" style='visibility: <%=ViewState["ShowNavigation"]%>'><span>prev</span></a>
                                                        <a class="next<%=ViewState["ModulNr"]%>" id='foo2_next<%=ViewState["ModulNr"]%>' href="#" style='visibility: <%=ViewState["ShowNavigation"]%>'><span>next</span></a>
                                                        <div class="pagination<%=ViewState["ModulNr"]%>" id='foo2_pag<%=ViewState["ModulNr"]%>'>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
<asp:ObjectDataSource ID="odsGetOnlyImages" runat="server" SelectMethod="GetOnlyImagesFromGallery"
    TypeName="DataAcess">
    <SelectParameters>
        <asp:Parameter Name="GalleryID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
