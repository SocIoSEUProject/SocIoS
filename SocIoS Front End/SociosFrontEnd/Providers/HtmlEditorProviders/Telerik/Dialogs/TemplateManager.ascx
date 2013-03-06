<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="DotNetNuke.HtmlEditor.TelerikEditorProvider" Namespace="DotNetNuke.HtmlEditor.TelerikEditorProvider" TagPrefix="provider" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.TemplatePreviewer = function(element)
{
	Telerik.Web.UI.Widgets.TemplatePreviewer.initializeBase(this, [element]);
	
	this._currentItem = null;
	this._currentTemplateItem = null;
}

Telerik.Web.UI.Widgets.TemplatePreviewer.prototype = {
	initialize : function() 
	{
		Telerik.Web.UI.Widgets.TemplatePreviewer.callBaseMethod(this, 'initialize');
		this._initializeChildren();
	},

	_initializeChildren : function()
	{
		this._currentTemplateItem = $get("templateIframe");
	},

	setItem : function(item)
	{
		this._currentItem = item;
		if(this._currentItem.get_type() == Telerik.Web.UI.FileExplorerItemType.File)
		{
			if (this._currentTemplateItem.tagName.toUpperCase() == "IFRAME")
		    {
		        try {
					var loadFunction = function() { 
							try {
								var htmlText = stateObj._currentTemplateItem.contentWindow.document.body.textContent 
									? stateObj._currentTemplateItem.contentWindow.document.body.textContent
									: stateObj._currentTemplateItem.contentWindow.document.body.innerText;
							    
								if (htmlText && htmlText != "")
									stateObj._currentTemplateItem.contentWindow.document.body.innerHTML = htmlText; 
								stateObj = null;
							} 
							catch (ex) { }
						};
							
			        if (window.addEventListener) {
						var stateObj = this;
				        this._currentTemplateItem.addEventListener(
							"load", 
							loadFunction, 
							false);
					} 
			        else if (window.attachEvent) {
						var stateObj = this;
				        this._currentTemplateItem.attachEvent(
							"onload", 
							loadFunction);
					}
		        }
		        catch (ex) { }
		    }
			this._currentTemplateItem.src = __dnnTemplateBaseUrl + '?rurl=' + this._currentItem.get_url();
		}
		else
		{
			this._currentTemplateItem.src = "javascript:''";
		}
	},

	getResult : function()
	{
		if (this._currentItem && this._currentItem.get_type() == Telerik.Web.UI.FileExplorerItemType.File)
		{
			return this._currentTemplateItem.contentWindow.document.body.innerHTML;
		}
		return null;
	},

	dispose : function() 
	{
		this._currentTemplateItem = null;
		Telerik.Web.UI.Widgets.TemplatePreviewer.callBaseMethod(this, 'dispose');
	}
}

Telerik.Web.UI.Widgets.TemplatePreviewer.registerClass('Telerik.Web.UI.Widgets.TemplatePreviewer', Telerik.Web.UI.Widgets.FilePreviewer);

</script>
<div id="TemplatePreviewer" class="templatePreviewer">
	<provider:RenderTemplateUrl ID="RenderBaseUrl" runat="server" />
    <telerik:RadToolBar ID="EmptyToolbar" runat="Server" Height="26px" Width="100%"></telerik:RadToolBar>
	<iframe id="templateIframe" frameborder="0" height="300" width="320">preview</iframe>
	<telerik:RadTabStrip ID="templateTabStrip" runat="server" Width="100%" Orientation="HorizontalBottom"
		ShowBaseLine="true">
		<Tabs>
			<telerik:RadTab Text="Preview" Value="Preview" />
		</Tabs>
	</telerik:RadTabStrip>
</div>
