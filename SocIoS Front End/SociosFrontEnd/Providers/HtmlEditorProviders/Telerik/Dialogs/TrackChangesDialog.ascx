<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");
Telerik.Web.UI.Widgets.TrackChangesDialog = function(element)
{
	Telerik.Web.UI.Widgets.TrackChangesDialog.initializeBase(this, [element]);
		
	this._editor = null;
}

Telerik.Web.UI.Widgets.TrackChangesDialog.prototype = {
	initialize : function() 
	{
		Telerik.Web.UI.Widgets.TrackChangesDialog.callBaseMethod(this, "initialize");

		this.setupChildren();
	},

	setupChildren : function()
	{
		this._initContentField = $get("initialContent");
		this._curContentField  = $get("currentContent");
	},

	clientInit : function(clientParameters)
	{
	    this._editor = clientParameters;
	    window.frames["responseIframe"].document.open();
	    window.frames["responseIframe"].document.close();
	    //Editor's current content
        this._curContentField.value = this._editor.get_html(true);
        
        //Editor's initial content
        this._initContentField.value = this._editor.get_initialContent();
                
        //Force postback, and change target so that the form output is returned to the iframe
        //TODO: Later , when the dialog is configured to use some kind of data source, we will probably have a dropdown, which will be able to do more postbacks
        var form = document.forms[0];
        form.target = "responseIframe";
        form.submit();
	},

	dispose : function()
	{
        this._editor = null;
        this._initContentField = null;
        this._curContentField = null;
		Telerik.Web.UI.Widgets.TrackChangesDialog.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.TrackChangesDialog.registerClass('Telerik.Web.UI.Widgets.TrackChangesDialog', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>
<style type="text/css">
html, body, form
{
    height: 100%;
    overflow: hidden;
}

#contentPanel, #initializer
{
    height: 100%;
}

#dialogControl
{
    height: 100%;
    display: block;
}
</style>
<input id="initialContent" type="hidden" name="initialContent" runat="server" />
<input id="currentContent" type="hidden" name="currentContent" runat="server" />
<asp:panel id="responsePanel" runat="server" enableviewstate="false">
    <style runat="server" id="cssFormatting" type="text/css">
    body
    {
        background-color: transparent;
    }

    .diff_new
    {
        background-color: #00ff00;
    }
    
    legend
    {   
        font: normal 12px Arial, Verdana, Sans-serif;
    }
    
    table.diff_new
    {
        border:2px solid green;
    }
    
    .diff_new td
    {
        padding: 5px, 5px, 5px, 5px;
        background-color: #00ff00;
    }

    .diff_deleted
    {
        color: Red;
        text-decoration: line-through;
    }

    table.diff_deleted 
    {
        padding: 5px, 5px, 5px, 5px;
        border:2px solid red;
    }
    
    table.diff_deleted 
    {
        filter:alpha(opacity=20);
        -moz-opacity:0.2;
        opacity:0.2;
    }
    </style>
</asp:panel>
<iframe id="responseIframe" frameborder="0" name="responseIframe" style="width: 100%; height: 100%;"></iframe>
