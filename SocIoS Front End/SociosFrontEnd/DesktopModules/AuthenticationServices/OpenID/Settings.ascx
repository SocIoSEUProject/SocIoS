<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="DotNetNuke.Authentication.OpenID.Settings, DotNetNuke.Authentication.OpenID" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
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
            <dnn:FieldEditorControl id="fldIncludeExample" runat="Server" DataField="IncludeExample" />
            <dnn:FieldEditorControl id="fldIncludeHelp" runat="Server" DataField="IncludeHelp" />
            <dnn:FieldEditorControl id="fldIncludeRegister" runat="Server" DataField="IncludeRegister" />
            <dnn:FieldEditorControl id="fldIncludeProfile" runat="Server" DataField="IncludeProfile" />
            <dnn:FieldEditorControl id="fldAutoRegister" runat="Server" DataField="AutoRegister" />
        </Fields>
    </dnn:propertyeditorcontrol>