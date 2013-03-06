<%@ control language="C#" inherits="EasyDNN.Modules.EasyDNNGallery.CommunityModeSettings, App_Web_communitymodesettings.ascx.af09375b" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<link href="<%=ModulePath%>AdminUpload.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.style1
	{
		width: 100%;
	}
	.style2
	{
		width: 265px;
	}
</style>
<table class="style1">
	<tr>
		<td class="style2">
			&nbsp;
		</td>
		<td>
			<b>
				<asp:label id="lblCommunityModeSettingsTitle" runat="server" 
				text="Community Mode Settings" 
				resourcekey="lblCommunityModeSettingsTitleResource1" Font-Size="Large"></asp:label></b>
		</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;</td>
		<td>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="style2">
			<dnn:Label ID="lblIsCommunityMode" runat="server" Text="Enable community mode for this instance:"
				HelpText="Enable community mode for this instance:" 
				HelpKey="lblIsCommunityMode.HelpText" ResourceKey="lblIsCommunityMode"></dnn:Label>
		</td>
		<td>
			<asp:checkbox id="cbEnableCommunityMode" runat="server" autopostback="True" 
				oncheckedchanged="cbEnableCommunityMode_CheckedChanged" 
				resourcekey="cbEnableCommunityModeResource1" />
		</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;
		</td>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td class="style2" valign="top">
			<dnn:Label ID="lblLimitUploadResize" runat="server" 
				Text="Auto resize uploaded images:" HelpKey="lblLimitUploadResize.HelpText" 
				ResourceKey="lblLimitUploadResize">
			</dnn:Label>
		</td>
		<td>
			<asp:checkbox id="cbEnableUploadAutoResize" runat="server" autopostback="True" 
				oncheckedchanged="cbEnableUploadAutoResize_CheckedChanged" 
				resourcekey="cbEnableUploadAutoResizeResource1" />
			<br />
		</td>
	</tr>
	<tr>
		<td class="style2" valign="top">
			&nbsp;</td>
		<td>
			<asp:label id="lblResizeWidth" runat="server" text="Width:" 
				resourcekey="lblResizeWidthResource1"></asp:label>
			&nbsp;
			<asp:textbox id="tbAFImageUploadResizeWidth" runat="server" width="50px" text="800"
				validationgroup="vgCommunityMode" enabled="False" 
				resourcekey="tbAFImageUploadResizeWidthResource1"></asp:textbox>
			<asp:comparevalidator id="cvAddImagesFromFolderResizeWidth" runat="server" controltovalidate="tbAFImageUploadResizeWidth"
				display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
				type="Integer" validationgroup="vgCommunityMode" 
				resourcekey="cvAddImagesFromFolderResizeWidthResource1"></asp:comparevalidator>
			<asp:requiredfieldvalidator id="rfvAddImagesFromFolderResize" runat="server" controltovalidate="tbAFImageUploadResizeWidth"
				errormessage="This filed is required." validationgroup="vgCommunityMode" 
				resourcekey="rfvAddImagesFromFolderResizeResource1"></asp:requiredfieldvalidator>
		</td>
	</tr>
	<tr>
		<td class="style2" valign="top">
			&nbsp;</td>
		<td>
			<asp:label id="lblResizeWidth0" runat="server" text="Height:" 
				resourcekey="lblResizeWidth0Resource1"></asp:label>
			&nbsp;<asp:textbox id="tbAFImageUploadResizeHeight" runat="server" width="50px" text="600"
				validationgroup="vgCommunityMode" enabled="False" 
				resourcekey="tbAFImageUploadResizeHeightResource1"></asp:textbox>
			<asp:comparevalidator id="cvAddImagesFromFolderResizeHeight" runat="server" controltovalidate="tbAFImageUploadResizeHeight"
				display="Dynamic" errormessage="Please enter number only." operator="DataTypeCheck"
				type="Integer" validationgroup="vgCommunityMode" 
				resourcekey="cvAddImagesFromFolderResizeHeightResource1"></asp:comparevalidator>
			<asp:requiredfieldvalidator id="rfvAddImagesFromFolderHeight" runat="server" controltovalidate="tbAFImageUploadResizeHeight"
				errormessage="This filed is required." validationgroup="vgCommunityMode" 
				resourcekey="rfvAddImagesFromFolderHeightResource1"></asp:requiredfieldvalidator>
		</td>
	</tr>
	<tr>
		<td class="style2" valign="top">
			&nbsp;</td>
		<td>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="style2">
			<dnn:Label ID="lblEnableJouranlPosting" runat="server" Text="Enable posting to journal:"
				HelpKey="lblEnableJouranlPosting.HelpText" ResourceKey="lblEnableJouranlPosting"></dnn:Label>
		</td>
		<td>
			<asp:checkbox id="cbEnableJournalPosting" runat="server" autopostback="True" oncheckedchanged="cbEnableJournalPosting_CheckedChanged"
				checked="True" resourcekey="cbEnableJournalPostingResource1" />
		</td>
	</tr>
	<tr>
		<td class="style2">
		<dnn:Label ID="lblListOfModules" runat="server" Text="Select module to open gallery details from user Journal:"
				HelpText="Select module to open gallery details from user Journal:" 
				ResourceKey="lblListOfModules" HelpKey="lblListOfModules.HelpText"></dnn:Label>
		</td>
		<td>
			<asp:dropdownlist id="ddlGalleryModuleList" runat="server" 
				resourcekey="ddlGalleryModuleListResource1">
			</asp:dropdownlist>
		</td>
	</tr>
	<tr>
		<td class="style2">
			<dnn:Label ID="lblGroupDetails" runat="server" Text="Select module to open gallery details from group Journal:"
				HelpText="Select module to open gallery details from group Journal:"  ResourceKey="lblGroupDetails" HelpKey="lblGroupDetails.HelpText"></dnn:Label></td>
		<td>
			<asp:dropdownlist id="ddlGroupGalleryModuleList" runat="server" /></td>
	</tr>
	<tr>
		<td class="style2">
			<dnn:Label ID="lblAutoPostToJournal" runat="server" Text="Auto post to journal:"
				HelpText="Auto post to journal:" HelpKey="lblAutoPostToJournal.HelpText" 
				ResourceKey="lblAutoPostToJournal"></dnn:Label>
		</td>
		<td>
			<asp:checkbox id="cbAutoPostingToJourmal" runat="server" autopostback="True" 
				checked="True" resourcekey="cbAutoPostingToJourmalResource1" />
		</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;</td>
		<td>
			&nbsp;</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;
		</td>
		<td>
			<b>
				<asp:label id="lblSchedulerSettingsTitle" runat="server" 
				text="Scheduler settings" resourcekey="lblSchedulerSettingsTitleResource1"></asp:label></b>
		</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;</td>
		<td>
			<asp:Label ID="lblSchedulerInfo" runat="server" resourcekey="lblSchedulerInfo"
				Text="This will enable images published in the Journal posts by a user to be added into user's Journal Post gallery."></asp:Label>
		</td>
	</tr>
	<tr>
		<td class="style2">
			<dnn:label id="lblSchedulerEnabled" runat="server" text="Enable scheduler:" 
				resourcekey="lblSchedulerEnabledResource1" 
				HelpKey="lblSchedulerEnabledResource1.HelpText" HelpText="Enable scheduler:"></dnn:label>
		</td>
		<td>
			<asp:checkbox id="cbSchedulerEnabled" runat="server" 
				resourcekey="cbSchedulerEnabledResource1" />
		</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;
		</td>
		<td>
			<asp:label id="lblInfo" runat="server" enableviewstate="False" forecolor="Red" 
				resourcekey="lblInfoResource1" />
		</td>
	</tr>
	<tr>
		<td class="style2">
			&nbsp;
		</td>
		<td>
			<asp:button id="btnSaveSettings" runat="server" onclick="btnSaveSettings_Click" style="height: 26px"
				text="Save settings" validationgroup="vgCommunityMode" 
				resourcekey="btnSaveSettingsResource1" />
			<asp:button id="btnSaveClose" runat="server" onclick="btnSaveClose_Click" 
				text="Save and Close" resourcekey="btnSaveCloseResource1" />
		</td>
	</tr>
</table>
