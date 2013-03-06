<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_FlashGallery, App_Web_flashgallery.ascx.dc9a219e" %>
<script src="<%=ModulePath.Replace("Controls/","")%>js/swfobject.js" type="text/javascript"></script>
<%--<link href="<%=ModulePath.Replace("Controls/","")%>Themes/<%=ViewState["Cssfile"]%>" rel="stylesheet" type="text/css" media="screen" />--%>
 
<div id="FlashGallery" >
<asp:Panel ID="pnlFlashGallery" runat="server" Visible="False" Height="21px">
    <a href='<%=ModulePath.Replace("Controls/","")%><%=ViewState["FlashGalTheme"]%>?width=<% =ViewState["FGSSTHwidth"]%>&height=<% =ViewState["FGSSTHheight"]%>&flashvars=xml=<%=MyFlashPath%>' rel="prettyPhoto[flash]" title=""><alt="" width="60" /><%=ViewState["FlashText"]%></a>
</asp:Panel>

<asp:Panel ID="pnlEmbededFlashGallery" runat="server" Visible="False">
    <div id='<%=ViewState["ModulNr"]%>' style='width: <% =ViewState["FGSSTHwidth"]%>; height: <%=ViewState["FGSSTHheight"]%>'>
        <script type="text/javascript">
                //jQuery.noConflict();
                <%=ViewState["jQuery"]%>(document).ready(function() {
                var flashvars = { xml: '<%=ViewState["MyFlashPath"]%>' };
                var params = {};
                params.wmode='transparent';
                var attributes = {};
                swfobject.embedSWF('<%=ModulePath.Replace("Controls/","")%><%=ViewState["FlashGalTheme"]%>', '<%=ViewState["ModulNr"]%>', '<%=ViewState["FGSSTHwidth"]%>', '<%=ViewState["FGSSTHheight"]%>', "9.0.0",'<%=ModulePath.Replace("Controls/","")%>js/expressInstall.swf', flashvars, params, attributes);
            }); 
        </script>
    </div>
</asp:Panel> 

<asp:Panel ID="pnlFlash2" runat="server" Visible="False" Enabled="False">
    <div id='<%=ViewState["ModulNr"]%>0' 
        style='width: <%=ViewState["Flash2width"]%>; height: <%=ViewState["Flash2height"]%>'>
        <script type="text/javascript">    
        //jQuery.noConflict();
        <%=ViewState["jQuery"]%>(document).ready(function() {
            var flashvars = { xmlFile: '<%=ViewState["MyFlashPath2"]%>' };
            var params = {};
            params.wmode='transparent';
            params.allowFullScreen='true';
            params.quality='best';
            var attributes = {};
            swfobject.embedSWF('<%=ModulePath.Replace("Controls/","")%>gallery2.swf', '<%=ViewState["ModulNr"]%>', '<%=ViewState["Flash2width"]%>', '<%=ViewState["Flash2height"]%>', "9.0.0","expressInstall.swf", flashvars, params, attributes);
        });
        </script> 
    </div>
</asp:Panel>
</div>

<asp:ObjectDataSource ID="odsIntegrate" TypeName="DataAcess" runat="server" SelectMethod="GetIntegration">
    <SelectParameters>
        <asp:Parameter Name="PortalID" Type="Int32" />
        <asp:Parameter Name="ModuleID" Type="Int32" />
        <asp:Parameter Name="ArticleID" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>


