<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="fckinstanceoptions.ascx.vb" Inherits="DotNetNuke.HtmlEditor.FckHtmlEditorProvider.fckinstanceoptions" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Sectionhead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<div style="width:100%;height:100%; text-align:center;">
<table id="tblEditorOptions" cellspacing="0" cellpadding="0" style="width:660; text-align:left;margin:0px auto 0px auto;" border="0" runat="server" visible="true">
	<tr>
		<td class="SubHead" valign="top" colspan="2">
			<table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td>
						<table id="Table2" cellspacing="0" cellpadding="0" width="100%" border="0">
							<tr>
								<td><asp:label id="lblModuleType" runat="server" resourcekey="lblModuleType" CssClass="SubHead"></asp:label>&nbsp;<asp:label id="txtModuleType" runat="server" CssClass="Normal"></asp:label></td>
								<td align="right"><asp:label id="txtUsername" runat="server" CssClass="Normal"></asp:label></TD>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><asp:label id="lblModuleName" runat="server" resourcekey="lblModuleName" CssClass="SubHead"></asp:label>&nbsp;<asp:label id="txtModuleName" runat="server" CssClass="Normal"></asp:label></td>
				</tr>
				<tr>
					<td><asp:label id="lblModuleInstance" runat="server" resourcekey="lblModuleInstance" CssClass="SubHead"></asp:label>&nbsp;<asp:label id="txtModuleInstance" runat="server" CssClass="Normal"></asp:label></td>
				</tr>
				<tr>
				    <td><asp:Label ID="lblProviderVersion" runat="server" resourcekey="lblProviderVersion" CssClass="SubHead"></asp:Label>&nbsp;<asp:Label ID="txtProviderVersion" runat="server" CssClass="Normal"></asp:Label></td>
				</tr>
			</table>
			<hr/>
		</td>
	</tr>
	<tr>
		<td class="SubHead" valign="top" style="width:239"><dnn:label id="plSettingsType" runat="server" suffix=":" controlname="rbSettingsType"></dnn:label></TD>
		<td class="Normal" valign="top"><asp:radiobuttonlist id="rbSettingsType" runat="server" CssClass="Normal" AutoPostBack="True" RepeatDirection="Horizontal">
				<asp:ListItem Value="I" resourcekey="typeInstance.Text" Selected="True">Instance</asp:ListItem>
				<asp:ListItem Value="M" resourcekey="typeModule.Text">Module</asp:ListItem>
				<asp:ListItem Value="P" resourcekey="typePortal.Text">Portal</asp:ListItem>
			</asp:radiobuttonlist></td>
	</tr>
	<tr>
		<td style="width:660;height:100%" colspan="2">
			<div id="optionsarea" style="border-right: #000000 1px dashed; padding-right: 10px; border-top: #000000 1px dashed; padding-left: 10px; padding-bottom: 10px; overflow: auto; border-left: #000000 1px dashed; width: 660; color: #333333; padding-top: 10px; border-bottom: #000000 1px dashed; height: 360px; background-color: #ffffff">
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td><dnn:sectionhead id="dshThemes" runat="server" resourcekey="dshThemes" cssclass="Head" text="Editor skins"
								includerule="true" section="tblThemes"></dnn:sectionhead>
							<table id="tblThemes" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
								<tr>
									<td class="SubHead" style="width:230"><dnn:label id="plToolbarSkin" runat="server" suffix=":" controlname="ddlToolbarSkin"></dnn:label></td>
									<td class="Normal"><asp:dropdownlist id="ddlToolbarSkin" runat="server" CssClass="NormalTextBox" Width="296px"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:230"><dnn:label id="plImageBrowserTheme" runat="server" suffix=":" controlname="ddlImageBrowserTheme"></dnn:label></td>
									<td class="Normal"><asp:dropdownlist id="ddlImageBrowserTheme" runat="server" CssClass="NormalTextBox" Width="296px"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:230"><dnn:label id="plFlashBrowserTheme" runat="server" suffix=":" controlname="ddlFlashBrowserTheme"></dnn:label></td>
									<td class="Normal"><asp:dropdownlist id="ddlFlashBrowserTheme" runat="server" CssClass="NormalTextBox" Width="296px"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:230"><dnn:label id="plLinkBrowserTheme" runat="server" suffix=":" controlname="ddlLinkBrowserTheme"></dnn:label></td>
									<td class="Normal"><asp:dropdownlist id="ddlLinkBrowserTheme" runat="server" CssClass="NormalTextBox" Width="296px"></asp:dropdownlist></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><dnn:sectionhead id="dshAvailableStyles" runat="server" resourcekey="dshAvailableStyles" cssclass="Head"
								text="List of Available editor styles" includerule="true" section="tblAvailableStyles" isexpanded="false"></dnn:sectionhead>
							<table id="tblAvailableStyles" cellspacing="0" cellpadding="0" width="100%" border="0"
								runat="server">
								<tr>
									<td class="SubHead" style="width:224"><dnn:label id="plStyleMode" runat="server" suffix=":" controlname="txtStyleFilter"></dnn:label></td>
									<td class="Normal"><asp:radiobuttonlist id="rbStyleMode" runat="server" CssClass="Normal" RepeatDirection="Horizontal" Width="301px">
											<asp:ListItem Value="static" resourcekey="XMLGenStatic" Selected="True">Static</asp:ListItem>
											<asp:ListItem Value="dynamic" resourcekey="XMLGenDynamic">Dynamic</asp:ListItem>
											<asp:ListItem Value="url" resourcekey="XMLGenURL">URL</asp:ListItem>
										</asp:radiobuttonlist></td>
								</tr>
								<tr>
									<td class="SubHead" valign="top" style="width:224"><dnn:label id="plStyleFilter" runat="server" suffix=":" controlname="txtStyleFilter"></dnn:label></td>
									<td class="Normal" valign="top"><asp:textbox id="txtStyleFilter" runat="server" CssClass="NormalTextBox" Width="400px" TextMode="MultiLine"
											Height="56px"></asp:textbox><br/>
										<asp:linkbutton id="cmdCopyFilter" runat="server" CssClass="CommandButton" CausesValidation="False">Copy host default filter</asp:linkbutton></td>
								</tr>
								<tr>
									<td class="SubHead" valign="top" style="width:224"><dnn:label id="plPortalStyle" runat="server" suffix=":" controlname="ctlURL"></dnn:label></td>
									<td class="Normal" valign="top"><portal:url id="ctlURL" runat="server" width="250" ShowUrls="true" ShowTabs="False" ShowLog="False"
											ShowTrack="False" Required="False"></portal:url></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><dnn:sectionhead id="dshEditorAreaCss" runat="server" resourcekey="dshEditorAreaCss" cssclass="Head"
								text="Editor Area Css File" includerule="true" section="tblEditorAreaCss" isexpanded="false"></dnn:sectionhead>
							<table id="tblEditorAreaCss" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
								<tr>
									<td class="SubHead" valign="top" style="width:224"><dnn:label id="plCssMode" runat="server" suffix=":" controlname="txtStyleFilter"></dnn:label></td>
									<td class="Normal" valign="top"><asp:radiobuttonlist id="rbCssMode" runat="server" CssClass="Normal" RepeatDirection="Horizontal" Width="301px">
											<asp:ListItem Value="static" resourcekey="CSSGenStatic" Selected="True">Static</asp:ListItem>
											<asp:ListItem Value="dynamic" resourcekey="CSSGenDynamic">Dynamic</asp:ListItem>
											<asp:ListItem Value="url" resourcekey="CSSGenURL">URL</asp:ListItem>
										</asp:radiobuttonlist></td>
								</tr>
								<tr>
									<td class="SubHead" valign="top" style="width:224"><dnn:label id="plPortalCss" runat="server" suffix=":" controlname="txtStyleFilter"></dnn:label></td>
									<td class="Normal" valign="top"><portal:url id="ctlUrlCss" runat="server" width="250" ShowUrls="true" ShowTabs="False" ShowLog="False"
											ShowTrack="False" Required="False"></portal:url></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><dnn:sectionhead id="dshOther" runat="server" resourcekey="dshOther" cssclass="Head" text="Other editor options"
								includerule="true" section="tblOther" isexpanded="false"></dnn:sectionhead>
							<table id="tblOther" cellspacing="0" cellpadding="0" style="width:100%" border="0" runat="server">
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plToolbarNotExpanded" runat="server" suffix=":" controlname="chkToolbarNotExpanded"></dnn:label></td>
									<td><asp:checkbox id="chkToolbarNotExpanded" runat="server" CssClass="NormalTextBox"></asp:checkbox></td>
								</tr>
                                <tr>
                                    <td class="SubHead" style="width: 225px">
                                        <dnn:Label ID="plHtmlEncodeOutput" runat="server" ControlName="rbHtmlEncodeOutput"
                                            Suffix=":" Text="HTML Encode Output" />
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbHtmlEncodeOutput" runat="server" CssClass="NormalTextBox"
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem value="default" resourcekey="HEODefault" Selected="True">Default</asp:ListItem>
                                            <asp:ListItem Value="true" resourcekey="HEOTrue">Yes</asp:ListItem>
                                            <asp:ListItem Value="false" resourcekey="HEOFalse">No</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>
                                <tr>
                                    <td class="SubHead" style="width: 225px">
                                        <dnn:Label ID="plRevertsHtmlEncodeOutput" runat="server" ControlName="rbRevertsHtmlEncodeOutput"
                                            Suffix=":" Text="Reverts HTML Encode Output" />
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbRevertsHtmlEncodeOutput" runat="server" CssClass="NormalTextBox"
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem value="default" resourcekey="RHEDefault" Selected="True">Default</asp:ListItem>
                                            <asp:ListItem Value="true" resourcekey="RHETrue">Yes</asp:ListItem>
                                            <asp:ListItem Value="false" resourcekey="RHEFalse">No</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                </tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plEnhancedSecurity" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:checkbox id="chkEnhancedSecurity" runat="server" CssClass="NormalTextBox"></asp:checkbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plFullImagePath" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:checkbox id="chkFullImagePath" runat="server" CssClass="NormalTextBox"></asp:checkbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plForceWidth" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:textbox id="txtForceWidth" runat="server" CssClass="NormalTextBox" Width="136px"></asp:textbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plForceHeight" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:textbox id="txtForceHeight" runat="server" CssClass="NormalTextBox" Width="136px"></asp:textbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plImageFolder" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:dropdownlist id="ddlImageFolder" runat="server" CssClass="NormalTextBox" Width="416px"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plFontColors" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:textbox id="txtFontColors" runat="server" CssClass="NormalTextBox" Width="416px"></asp:textbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plFontNames" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:textbox id="txtFontNames" runat="server" CssClass="NormalTextBox" Width="416px"></asp:textbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plFontSizes" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:textbox id="txtFontSizes" runat="server" CssClass="NormalTextBox" Width="416px"></asp:textbox></td>
								</tr>
								<tr>
									<td class="SubHead" style="width:225"><dnn:label id="plFontFormats" runat="server" suffix=":" controlname="chkEnhancedSecurity"></dnn:label></td>
									<td class="Normal"><asp:textbox id="txtFontFormats" runat="server" CssClass="NormalTextBox" Width="416px"></asp:textbox></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td><dnn:sectionhead id="dshToolbarRoles" runat="server" resourcekey="dshToolbarRoles" cssclass="Head"
								text="Toolbar Roles" includerule="true" section="tblToolbarset"></dnn:sectionhead>
							<table id="tblToolbarset" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
								<tr>
									<td class="SubHead" valign="top" style="width:100%"><dnn:label id="plToolbarSet" runat="server" suffix=":" controlname="lstToolbars"></dnn:label><asp:datagrid id="grdToolbars" runat="server" CssClass="Normal" Width="620px" AutoGenerateColumns="False">
											<HeaderStyle CssClass="SubHead"></HeaderStyle>
											<Columns>
												<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" CancelText="Cancel" EditText="Edit">
													<HeaderStyle Width="5px"></HeaderStyle>
													<ItemStyle VerticalAlign="Top"></ItemStyle>
												</asp:EditCommandColumn>
												<asp:TemplateColumn>
													<HeaderStyle Width="5px"></HeaderStyle>
													<ItemStyle VerticalAlign="Top"></ItemStyle>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Toolbar">
													<HeaderStyle Width="180px"></HeaderStyle>
													<ItemStyle VerticalAlign="Top"></ItemStyle>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Disabled">
													<HeaderStyle Width="5px"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="ViewRoles">
													<HeaderStyle Width="100%"></HeaderStyle>
													<ItemStyle VerticalAlign="Top"></ItemStyle>
												</asp:TemplateColumn>
											</Columns>
										</asp:datagrid><asp:linkbutton id="cmdMakeAllUsers" runat="server" resourcekey="cmdMakeAllUsers" CssClass="CommandButton"
											CausesValidation="False">Include all users to each toolbar</asp:linkbutton></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td valign="top" colspan="2">
			<hr/>
			<table id="Table4" cellspacing="0" cellpadding="0" style="width:100%" border="0">
				<tr>
					<td class="SubHead"><dnn:label id="plApplyTo" runat="server" suffix=":" controlname="ddlSettingsType"></dnn:label></td>
					<td class="Normal"><asp:dropdownlist id="ddlSettingsType" runat="server" CssClass="NormalTextBox">
							<asp:ListItem Value="I" resourcekey="typeInstance.Text" Selected="True">Instance</asp:ListItem>
							<asp:ListItem Value="M" resourcekey="typeModule.Text">Module</asp:ListItem>
							<asp:ListItem Value="P" resourcekey="typePortal.Text">Portal</asp:ListItem>
						</asp:dropdownlist>&nbsp;&nbsp;
						<asp:linkbutton id="cmdUpdate" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" CausesValidation="False">Update</asp:linkbutton>&nbsp;
						<asp:linkbutton id="cmdClear" runat="server" resourcekey="cmdClear" CssClass="CommandButton" CausesValidation="False">Clear</asp:linkbutton>&nbsp;
                        <asp:HyperLink ID="hypClose" runat="server" CssClass="CommandButton" NavigateUrl="javascript:window.close();">Close</asp:HyperLink></td>
				</tr>
				<tr>
					<td class="SubHead" colspan="2"><asp:label id="lblResult" runat="server" CssClass="NormalRed"></asp:label></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>