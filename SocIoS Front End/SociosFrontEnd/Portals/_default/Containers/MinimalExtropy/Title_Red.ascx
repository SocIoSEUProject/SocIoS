<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<div class="c_container c_head_red">
    <div class="head_title">
        <div class="c_actions">
            <dnn:ACTIONS runat="server" id="dnnACTIONS"  ProviderName="DNNMenuNavigationProvider" ExpandDepth="1" PopulateNodesFromClient="True" />
        </div>
        <div class="c_icon">
            <dnn:ICON runat="server" id="dnnICON"  />
            <h2 class="c_title">
                <dnn:TITLE runat="server" id="dnnTITLE"  CssClass="TitleHead" />
            </h2>
        </div>
        <div class="title_vis">
        <dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON3"  CommandName="PrintModule.Action" DisplayIcon="True" DisplayLink="false" />
            <dnn:VISIBILITY runat="server" id="dnnVISIBILITY"  minicon="images/DNN-minus.gif" maxicon="images/DNN-plus.gif" />
        </div>
        <div class="clear_float">
        </div>
    </div>
    <div class="c_content">
        <div id="ContentPane" runat="server" class="Normal c_contentpane">
        </div>
    </div>
    <div class="c_footer">
        <dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON1"  CommandName="AddContent.Action" DisplayIcon="True" DisplayLink="True" />
        <dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON2"  CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="false" />
        <dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON4"  CommandName="ModuleSettings.Action" DisplayIcon="True" DisplayLink="false" />
    </div>
</div>
