<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_Lightbox, App_Web_lightbox.ascx.dc9a219e" debug="True" %>

<script src="<%=ModulePath.Replace("Controls/","")%>js/swfobject.js" type="text/javascript"></script>

<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>"
    rel="stylesheet" type="text/css" media="screen" />
        <style type="text/css">
    .PageUpdateProgress
      {

        background-image:url('/DesktopModules/EasyDNNgallery/images/loader_bg.png');
        background-repeat:no-repeat;
        background-position:center center;
        width:50px;
        height:50px;
        text-align: center;
        vertical-align: middle;
        position:fixed;
        bottom: 50%;
        left: 45%;
        text-align:center;
        z-index:10002;
    }


    .PageUpdateProgress img
       {

        padding-top:13px;
    }

    .TransparentBackground 
        {
           position: fixed;
           top: 0;
           left: 0;
           background-color:#2c2b2b;
           filter:alpha(opacity=60);
           opacity:0.7;
           height: 100%;
           width: 100%;
           min-height: 100%;
           min-width: 100%;
           z-index:10001;
}    
    </style>


<div id="LightBoxGallery">
    <asp:UpdatePanel ID="upTableGallery" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="<%=ViewState["CssClass"]%>">
                <div class="EDGbackground">
                    <div class="EDGcontentbgrd">
                        <div class="EDGcornerbotleft">
                            <div class="EDGcornerbotright">
                                <div class="EDGcornertopleft">
                                    <div class="EDGcornertopright">
                                        <div class="EDGcontent">
                                            <asp:Panel ID="pnlBreadCrumb" runat="server" Visible="True" CssClass="nestedBreadCrumb">
                                                <asp:LinkButton ID="lbBCTOPGallery" runat="server" OnClick="lbBCTOPGallery_Click"></asp:LinkButton> > 
                                                <asp:LinkButton ID="lblBCGallery" runat="server"></asp:LinkButton>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlNestedGalleries" runat="server" HorizontalAlign="Center">
                                                <asp:DataList ID="dlNestedCategory" runat="server" DataKeyField="GalleryID" OnItemCommand="dlNestedCategory_ItemCommand"
                                                    HorizontalAlign="Center" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div class="EDGmain">
                                                            <div class="EDGimage">
                                                                <a href="" runat="server">
                                                                    <asp:ImageButton ID="ibNestedGallery" runat="server" CommandName="OpenNestedGallery"
                                                                        CommandArgument='<%#Eval("GalleryID")%>' ImageUrl='<%#GetGalleryThumbPath(DataBinder.Eval(Container.DataItem, "GalleryID")) %>' />
                                                                    <span class="flagObject"></span><span class="flag"></span>
                                                                    <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>                                                                    
                                                                    <span class='<%#NGTitleClass(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryDescription"))%>'>
                                                                        <asp:Label ID="lblTGNGTitle" runat="server" Text='<%#Server.HtmlDecode(ShowNestedGalleryTitle(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
                                                                            Visible='<%#NGTitleToDisplay(Eval("GalleryName"))%>'></asp:Label>
                                                                        <asp:Label ID="lblTGNGDescription" runat="server" CssClass="Description" Text='<%#Server.HtmlDecode(ShowNestedGalleryDescription(DataBinder.Eval(Container.DataItem, "GalleryDescription"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
                                                                            Visible='<%#NGDescriptionToDisplay(Eval("GalleryDescription"))%>'></asp:Label>
                                                                            <asp:Label ID="lbGalleryLink" runat="server" CssClass="Description" Text='<%#GetMediaInfo(Eval("GalleryID"))%>' Visible='<%#Convert.ToBoolean(ViewState["GalleryInfo"])%>' ></asp:Label>
                                                                        <%--<asp:LinkButton ID="lbGalleryLink" runat="server" CommandName="OpenNestedGallery" 
                                                                            CommandArgument='<%#Eval("GalleryID")%>' Visible='<%#Convert.ToBoolean(ViewState["GalleryInfo"])%>'><%#Eval("GalleryName")%><%#GetMediaInfo(Eval("GalleryID"))%></asp:LinkButton>--%>
                                                                    </span></a>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlTGDisplay" runat="server" HorizontalAlign="Center">
                                                <div class="EDGTitle">
                                                    <asp:Label ID="lblTGTitle" runat="server" CssClass="EDGTitleText"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblTGDescription" runat="server" CssClass="GalleryDescription"></asp:Label>
                                                </div>
                                                <asp:ObjectDataSource ID="odsTGMedia" runat="server" TypeName="DataAcess" SelectMethod="GetImagesFromGallery">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="GalleryID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                                <asp:DataList ID="dlTableGallery" runat="server" CellPadding="0" RepeatDirection="Horizontal"
                                                    RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                    Font-Strikeout="False" Font-Underline="False" DataKeyField="PictureID" OnPreRender="dlTableGallery_PreRender"
                                                    RepeatLayout="Table" HorizontalAlign="Center" OnItemCreated="dlTableGallery_ItemCreated"
                                                    ItemStyle-HorizontalAlign="Center">
                                                    <AlternatingItemStyle HorizontalAlign="Center" />
                                                    <EditItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <div class="EDGmain">
                                                            <asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
                                                                <div class="EDGimage">
                                                                    <a href='<%#LinkOrLightbox(Eval("FileName"),Eval("ImageUrl"),Eval("PictureID")) %>' target="<%#TargetWin()%>"
                                                                        title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                        rel="<%#RelLink()%>">
                                                                        <asp:Image ID="DataListImage" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))  %>'
                                                                            EnableTheming="True" alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' ImageAlign="Middle" />
                                                                        <span class="flagObject"></span><span class="flag"></span>
                                                                        <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>
                                                                        <span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                            <asp:Label ID="lblItemTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label><br />
                                                                            <asp:Label ID="lblTGDescription6" runat="server" CssClass="Description" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></span>
                                                                    </a>
                                                                </div>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
                                                                <div class="EDGvideo">
                                                                    <a href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
                                                                        rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                        <asp:Image ID="EmbedImageThumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                            alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' />
                                                                        <span class="flagObject"></span><span class="flag"></span>
                                                                        <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>
                                                                        <span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                            <asp:Label ID="EmbedTitleLabel" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label><br />
                                                                            <asp:Label ID="lblTGDescription2" CssClass="Description" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></span>
                                                                    </a>
                                                                </div>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideo("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
                                                                <div class="EDGvideo">
                                                                    <a href='<%=ViewState["hostpath"]%><%=ModulePath.Replace("Controls/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=ViewState["VGSkin"]%>&playonload=<%=ViewState["PlayOnLoad"]%>&info=<%=ViewState["Info"]%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=ViewState["AllowFullscren"]%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
                                                                        rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                        <asp:Image ID="FlashImageThumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                            alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' />
                                                                        <span class="flagObject"></span><span class="flag"></span>
                                                                        <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>
                                                                        <span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                            <asp:Label ID="FlashTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label><br />
                                                                            <asp:Label ID="lblTGDescription3" CssClass="Description" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></span>
                                                                    </a>
                                                                </div>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
                                                                <div class="EDGvideo">
                                                                    <a href='<%#Eval("Filename") %>' rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                        <asp:Image ID="imgflasmovthumb" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
                                                                            alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' />
                                                                        <span class="flagObject"></span><span class="flag"></span>
                                                                        <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>
                                                                        <span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                            <asp:Label ID="Label2" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label><br />
                                                                            <asp:Label ID="lblTGDescription4" CssClass="Description" runat="server" Text='<%#ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></span>
                                                                    </a>
                                                                </div>
                                                            </asp:PlaceHolder>
                                                            <asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
                                                                <div class="EDGaudio">
                                                                    <a href='<%=ModulePath.Replace("Controls/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=ViewState["AudioPlayOnLoad"]%>&volume=1&song1url=<%=ViewState["hostpath"]%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
                                                                        rel="<%#RelLink()%>" title='<%#GetDescription3(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                        <asp:Image ID="imgTGAudio" runat="server" ImageUrl='<%#GetThumbPath(DataBinder.Eval(Container.DataItem, "ViewerThumb"),DataBinder.Eval(Container.DataItem, "PictureID")) %>'
                                                                            alt='<%#GetAlt(Eval("Title"),Eval("PictureID"))%>' />
                                                                        <span class="flagObject"></span><span class="flag"></span>
                                                                        <span class="leftsh"></span><span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span><span class="round1"></span><span class="round2"></span><span class="round3"></span><span class="round4"></span>
                                                                        <span class='<%#TitleClass(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'>
                                                                            <asp:Label ID="lblAudioTitle" runat="server" Text='<%#ShowTitle(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#TitleToDisplay(Eval("Title"),Eval("PictureID"))%>'></asp:Label><br />
                                                                            <asp:Label ID="lblTGDescription5" CssClass="Description" runat="server" Text='<%# ShowDescription(DataBinder.Eval(Container.DataItem, "Description"),DataBinder.Eval(Container.DataItem, "PictureID"))%>'
                                                                                Visible='<%#DescriptionToDisplay(Eval("Description"),Eval("PictureID"))%>'></asp:Label></span>
                                                                    </a>
                                                                </div>
                                                            </asp:PlaceHolder>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                                                    <SelectedItemStyle HorizontalAlign="Center" />
                                                    <SeparatorStyle HorizontalAlign="Center" />
                                                </asp:DataList>
                                                <asp:GridView ID="gvTGPagination" runat="server" AllowPaging="True" DataKeyNames="PictureID"
                                                    DataSourceID="odsTGMedia" OnPageIndexChanged="GridView1_PageIndexChanged" OnPreRender="gvTGPagination_PreRender"
                                                    Width="28px" HorizontalAlign="Center" ShowFooter="True" AutoGenerateColumns="False"
                                                    PageSize="1" ShowHeader="False" BorderWidth="0" BorderStyle="None" Border="0"
                                                    GridLines="None" CssClass="pagerbox">
                                                    <Columns>
                                                        <asp:BoundField DataField="FileName" Visible="False" />
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Center" CssClass="EDGpager" BorderWidth="0px" BorderStyle="None" />
                                                </asp:GridView>
                                                <table cellpadding="0" cellspacing="0" border="0" align="center"><tr><td>
                                                <asp:LinkButton ID="btnPrev" runat="server" OnClick="btnPrev_Click" CssClass="buttonPrev"
                                                    Style="margin-top: 15px;"/>
                                                <asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="buttonNext"
                                                    Style="margin-top: 15px;" />
                                                </td></tr></table>


                                            </asp:Panel>
                                            <asp:UpdateProgress ID="upLighbox" runat="server" AssociatedUpdatePanelID="upTableGallery">
                       <ProgressTemplate>
                        <div class='<%=ViewState["PreloaderBackground"]%>'></div>
                        <table cellpadding="0" cellspacing="0" align="center" style="margin-top:10px;"><tr><td>
                        <div class='<%=ViewState["PreloaderClass"]%>'>
                            <img id='preloader' src='<%=ModulePath.Replace("Controls/","")%>images/<%=ViewState["PreloaderImage"]%>' />                        
                                </div></td></tr></table>
                        </ProgressTemplate>

                        </asp:UpdateProgress>
                                            <asp:Panel ID="pnlNestedGalleryBack" runat="server" Visible="False">
                                                <div>
                                                    <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click" CssClass="btnGalleryBack">
                                                       
                                                    </asp:LinkButton>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="EDGclear">
                        &nbsp;
                        
                    </div>
                </div>
            </div>            
        </ContentTemplate>        
    </asp:UpdatePanel>
</div>
<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
    <SelectParameters>
        <asp:Parameter Name="PortalID" Type="Int32" />
        <asp:Parameter Name="ModuleID" Type="Int32" />
        <asp:Parameter Name="ArticleID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
