<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog = function(element)
{
	Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog.initializeBase(this, [element]);
	this._holder = null;
	this._document = null;
	this._container = null;
	this._confirmButton = null;
	this._cancelButton = null;
}

Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog.callBaseMethod(this, "initialize");

		this._initChildren();
	},
	
	_initChildren : function()
	{
		this._holder = $get("holder");
		this._document = this._holder.contentWindow.document;
		this._document.write("<html><head></head><body></body></html>");
		this._document.close();
		this._document.designMode = "on";
		this._setupBody = Function.createDelegate(this, this._setupBody);
		window.setTimeout(this._setupBody, 0);
		
		this._confirmButton = $get("InsertButton");
		this._confirmButton.title = localization["Paste"];
		this._cancelButton = $get("CancelButton");
		this._cancelButton.title = localization["Cancel"];
		
		
		$addHandlers(this._confirmButton, {"click" : this._confirmButtonClickHandler}, this);
		$addHandlers(this._cancelButton, {"click" : this._cancelButtonClickHandler}, this);
	},

	clientInit : function(clientParameters)
	{
		if (this._container)
			this._container.innerHTML = "&nbsp;";
		if (clientParameters && clientParameters.dialogTitle)
		{
			window.setTimeout(function(){Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().set_title(clientParameters.dialogTitle);},1000);
		}
	},
	
	_setupBody : function()
	{
		this._container = this._document.body;
		this._container.style.margin = "0px";
		this._container.style.padding = "0px";
	},

	_confirmButtonClickHandler :function(e)
	{
		var eventArgs = new Sys.EventArgs();
		eventArgs._content = this._container.innerHTML;
		eventArgs.get_content = function(){return this._content;};
		Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close(eventArgs);
	},

	_cancelButtonClickHandler : function(e)
	{
		Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();
	},

	dispose : function()
	{
		$clearHandlers(this._confirmButton);
		$clearHandlers(this._cancelButton);
		this._holder = null;
		this._container = null;
		this._document = null;
		this._confirmButton = null;
		this._cancelButton = null;

		Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog.registerClass("Telerik.Web.UI.Widgets.MozillaPasteHtmlDialog", Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>
<table cellpadding="0" cellspacing="0" class="reDialog" style="margin: 2px 0 0 2px;">
	<tr>
		<td>
			<div>
				<script type="text/javascript">
				document.write(localization["UseControlVMessage"]);
				</script>
			</div>
			<iframe src="javascript:''" id="holder" width="99%" height="200px" frameborder="0" style="border: solid 1px #000;"></iframe>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell" style="padding: 6px 0 0 0;">
			<button type="button" id="InsertButton" style="min-width: 100px;">
				<script type="text/javascript">
				setInnerHtml("InsertButton", localization["Paste"]);
				</script>
			</button>
			<button type="button" id="CancelButton" style="min-width: 100px;">
				<script type="text/javascript">
				setInnerHtml("CancelButton", localization["Cancel"]);
				</script>
			</button>
		</td>
	</tr>
</table>
