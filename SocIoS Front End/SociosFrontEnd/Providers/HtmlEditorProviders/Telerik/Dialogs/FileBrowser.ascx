<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
	Type.registerNamespace("Telerik.Web.UI.Editor.DialogControls");

	Telerik.Web.UI.Editor.DialogControls.FileBrowser = function(element)
	{
		Telerik.Web.UI.Editor.DialogControls.FileBrowser.initializeBase(this, [element]);
	}

	Telerik.Web.UI.Editor.DialogControls.FileBrowser.prototype = {
		initialize: function()
		{
			this.set_insertButton($get("InsertButton"));
			this.set_cancelButton($get("CancelButton"));

			var previewer = this.get_previewerType();
			var previewerType = eval("Telerik.Web.UI.Widgets." + previewer);
			$create(previewerType, { "browser": this }, null, null, $get(previewer));
			this.set_filePreviewer($find(previewer));
			this.set_fileBrowser($find("RadFileExplorer1"));

			Telerik.Web.UI.Editor.DialogControls.FileBrowser.callBaseMethod(this, 'initialize');
		},

		dispose: function()
		{
			Telerik.Web.UI.Editor.DialogControls.FileBrowser.callBaseMethod(this, 'dispose');
			this._insertButton = null;
			this._cancelButton = null;
		}
	}

	Telerik.Web.UI.Editor.DialogControls.FileBrowser.registerClass('Telerik.Web.UI.Editor.DialogControls.FileBrowser', Telerik.Web.UI.Widgets.FileManager);
</script>
<style type="text/css">
.RadFileExplorer .RadGrid .rgPager .rgWrap {float:none;}
.RadFileExplorer .RadGrid .rgPager .RadSlider {float:none;}
.RadFileExplorer .RadGrid .rgPager .rgSliderLabel {float:left;}
.RadFileExplorer .RadGrid .rgPager .rgInfoPart {text-align:right;}
</style>
<table class="reDialog ManagerDialog NoMarginDialog" border="0" cellpadding="0"
	cellspacing="0" style="width: 100%;">
	<tr id="listRow">
		<td rowspan="2" class="FileExplorerPlaceholder">
			<telerik:RadFileExplorer ID="RadFileExplorer1" Height="410px" Width="400px" TreePaneWidth="150px"
				runat="Server" EnableOpenFile="false" AllowPaging="true" />
		</td>
		<td rowspan="2" class="DialogSeparator">
			&nbsp;
		</td>
		<td style="width: 100%; vertical-align: top; padding: 0; height: 372px;">
			<asp:PlaceHolder ID="PreviewerPlaceHolder" runat="server" />
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
			<table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
				<tr>
					<td>
						<button type="button" id="InsertButton">
							<script type="text/javascript">setInnerHtml("InsertButton", localization["Insert"]);</script>
						</button>
					</td>
					<td class="reRightMostCell">
						<button type="button" id="CancelButton">
							<script type="text/javascript">setInnerHtml("CancelButton", localization["Cancel"]);</script>
						</button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
