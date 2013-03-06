<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");
Telerik.Web.UI.Widgets.XhtmlValidator = function(element)
{
	Telerik.Web.UI.Widgets.XhtmlValidator.initializeBase(this, [element]);
	
	this._editor = null;
}

Telerik.Web.UI.Widgets.XhtmlValidator.prototype = {
	initialize : function() 
	{
		Telerik.Web.UI.Widgets.XhtmlValidator.callBaseMethod(this, "initialize");
		
		this.setupChildren();
	},

	setupChildren : function()
	{
		this._editorContent = $get("editorContent");
		this._editorFullPage = $get("editorFullPage");
	},

	clientInit : function(clientParameters)
	{
		this._editor = clientParameters;
		window.frames["responseIframe"].document.open();
	    window.frames["responseIframe"].document.close();
        if (this._editor.get_fullPage() == false)
        {
			this._editorContent.value = "<div>" + this._editor.get_html(true) + "</div>";
			this._editorFullPage.value = "false";
		}
        else
        {
			this._editorContent.value = this._editor.get_html(true);
			this._editorFullPage.value = "true";
        }
        
        var form = document.forms[0];
        //Change target so that the form output is returned to the iframe
        form.target = "responseIframe";
        form.submit();
	},

	dispose : function() 
	{
		this._editor = null;
		this._editorContent = null;
		this._editorFullPage = null;
		Telerik.Web.UI.Widgets.XhtmlValidator.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.XhtmlValidator.registerClass('Telerik.Web.UI.Widgets.XhtmlValidator', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>
<style type="text/css">
html, body, form
{
    height: 100%;
    overflow: hidden;
    font: normal 12px Arial, Verdana, Sans-serif;
}
#contentPanel, #dialogControl, #initializer
{
    height: 100%;
}
</style>
<asp:panel id="contentPanel" runat="server"> 
    <asp:radiobuttonlist repeatdirection="Horizontal" autopostback="true" id="xhtmlSelect" runat="server" >
        <asp:listitem selected="True" value='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">'> XHTML 1.1</asp:listitem>     
        <asp:listitem value='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'>XHTML 1.0 Strict</asp:listitem>
        <asp:listitem value='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'> XHTML 1.0 Transitional</asp:listitem>        
        <asp:listitem value='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">'>HTML 4.01</asp:listitem>
    </asp:radiobuttonlist>
    <input id="editorContent" type="hidden" name="editorContent" runat="server"/>
    <input id="editorFullPage" type="hidden" name="editorContent" runat="server"/>
    <iframe id="responseIframe" frameborder="0" name="responseIframe" style="width: 100%; height: 95%;"></iframe>
</asp:panel>

