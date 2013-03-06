<%@ Control Language="C#" AutoEventWireup="true" Codebehind="Settings.ascx.cs" Inherits="DotNetNuke.Authentication.LiveID.Settings, DotNetNuke.Authentication.LiveID" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<asp:Label ID="lblHelp" runat="Server" resourcekey="LiveIDHelp" CssClass="Normal" />
<dnn:propertyeditorcontrol id="SettingsEditor" runat="Server" 
    AutoGenerate="false"
    editcontrolwidth="200px" 
    labelwidth="250px" 
    width="450px" 
    editcontrolstyle-cssclass="NormalTextBox" 
    helpstyle-cssclass="Help" 
    labelstyle-cssclass="SubHead" 
    editmode="Edit"
    SortMode="SortOrderAttribute">
        <Fields>
            <dnn:FieldEditorControl id="fldEnabled" runat="Server" DataField="Enabled" />
            <dnn:FieldEditorControl id="fldIncludeHelp" runat="Server" DataField="IncludeHelp" />
            <dnn:FieldEditorControl id="fldAppId" runat="Server" DataField="AppID" />
            <dnn:FieldEditorControl id="fldSecretKey" runat="Server" DataField="SecretKey" />
        </Fields>
    </dnn:propertyeditorcontrol>
<asp:Label ID="lblMessage" runat="Server" resourcekey="LiveIDMessage" CssClass="NormalRed" Visible="false" />