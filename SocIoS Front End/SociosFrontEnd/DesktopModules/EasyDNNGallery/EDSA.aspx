<%@ page language="C#" autoeventwireup="true" inherits="DesktopModules_EasyDNNgallery_ManualActivation, App_Web_edsa.aspx.af09375b" viewStateEncryptionMode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<style type="text/css">
		.style1
		{
			width: 100%;
		}
		.style2
		{
		}
		.style3
		{
		}
		.style4
		{
			width: 395px;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		&nbsp;<asp:Panel ID="pnlManualActivation" runat="server" Visible="False" Width="800px"
			BorderStyle="Solid" BorderWidth="1px" Style="margin: auto">
			<table class="style1" style="border-style: 1; font-size: medium; border-width: thin;
				border-color: #000000">
				<tr>
					<td align="center" colspan="2" style="font-size: medium; font-weight: bold">
						Manual Activation
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style3" align="center" colspan="2">
						<asp:Label ID="lblInvoiceID" runat="server" Text="Enter invoice id:"></asp:Label>
						&nbsp;&nbsp;
						<asp:TextBox ID="tbInvoiceID" runat="server" Width="500px"></asp:TextBox>
						&nbsp;
						<asp:Button ID="btnCrateCode" runat="server" OnClick="btnCrateCode_Click" Text="Create code" />
					</td>
				</tr>
				<tr>
					<td class="style2" align="center" colspan="2">
						<asp:TextBox ID="tbCodeToSend" runat="server" Height="200px" TextMode="MultiLine"
							Width="400px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td class="style2" align="center" colspan="2">
						<asp:Label ID="lblCodeToEmail" runat="server" Text="Please copy and email this code to: support@easydnnsolutions.com"
							Visible="False"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="style3">
						&nbsp;
					</td>
					<td class="style4">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="style2" colspan="2">
						<hr />
					</td>
				</tr>
				<tr>
					<td align="center" class="style2" colspan="2">
						<asp:Label ID="lblActivationCodeHere" runat="server" 
							Text="If you have already received activation code please paste it here:"></asp:Label>
					</td>
				</tr>
				<tr>
					<td class="style2" align="center" colspan="2">
						<asp:TextBox ID="tbActivationCode" runat="server" Height="200px" TextMode="MultiLine"
							Width="400px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td class="style2" align="center" colspan="2">
						<asp:Button ID="btnActivateCode" runat="server" OnClick="btnActivateCode_Click" Text="Activate code" />
					</td>
				</tr>
			</table>
		</asp:Panel>
	</div>
	</form>
</body>
</html>
