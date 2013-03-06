<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.MozillaPasteTextDialog = function(element)
{
	Telerik.Web.UI.Widgets.MozillaPasteTextDialog.initializeBase(this, [element]);
	this._document = null;
	this._container = null;
	this._confirmButton = null;
	this._cancelButton = null;
}

Telerik.Web.UI.Widgets.MozillaPasteTextDialog.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.MozillaPasteTextDialog.callBaseMethod(this, "initialize");

		this._initChildren();
	},
	
	_initChildren : function()
	{
		this._container = $get("holder");
		
		this._confirmButton = $get("InsertButton");
		this._confirmButton.title = localization["Paste"];
		this._cancelButton = $get("CancelButton");
		this._cancelButton.title = localization["Cancel"];
		
		
		$addHandlers(this._confirmButton, {"click" : this._confirmButtonClickHandler}, this);
		$addHandlers(this._cancelButton, {"click" : this._cancelButtonClickHandler}, this);
	},

	clientInit : function(cilentParameters)
	{
		this._container.value = "";
	},
	
	_confirmButtonClickHandler :function(e)
	{
		var eventArgs = new Sys.EventArgs();
		eventArgs._content = this._container.value;
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
		this._container = null;
		this._document = null;
		this._confirmButton = null;
		this._cancelButton = null;

		Telerik.Web.UI.Widgets.MozillaPasteTextDialog.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.MozillaPasteTextDialog.registerClass("Telerik.Web.UI.Widgets.MozillaPasteTextDialog", Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>
<table cellpadding="0" cellspacing="0" class="reDialog" style="margin: 2px 0 0 2px;">
	<tr>
		<td>
			<div id="UseControlVMessage">
				<script type="text/javascript">
				setInnerHtml("UseControlVMessage", localization["UseControlVMessage"]);
				</script>
			</div>
			<textarea id="holder" rows="12" cols="59"></textarea>
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
