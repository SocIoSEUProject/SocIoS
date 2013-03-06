<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table cellpadding="0" cellspacing="0" class="reDialog AboutDialog" style="width: 488px; height: 280px;">
	<tr>
		<td style="padding: 6px;">
			<h6 style="padding: 0; margin: 0;">
				<span><!----></span>
			</h6>
			<ul style="margin: 0; clear: both; margin-bottom: 70px; margin-left: 12px; padding: 0;">
				<li><a href="http://www.telerik.com" title="Telerik" rel="external">www.telerik.com</a></li>
			</ul>
			<p style="margin: 0; margin-top: 158px; margin-left: 12px; padding: 0;">
				<script type="text/javascript">document.write(localization["Copyright"]);</script>
			</p>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
			<table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
				<tr>
					<td>
						<button type="button" onclick="javascript:Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();"
							id="CancelButton" style="width: 75px;">
							<script type="text/javascript">setInnerHtml("CancelButton", localization["OK"]);</script>
						</button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
