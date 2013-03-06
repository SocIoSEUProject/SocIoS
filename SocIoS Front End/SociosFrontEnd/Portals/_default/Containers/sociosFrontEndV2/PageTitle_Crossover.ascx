<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<div class="c_DNN6 c_DNN6_Header CrossoverContainerWrap">
<div class="CrossoverContainerBG">
    <h2 class="CrossoverSideTitle"><dnn:TITLE runat="server" id="dnnTITLE" cssClass="NoClass" /></h2>
    <div id="ContentPane" runat="server"></div>
</div>
<div class="cleared" ></div>
</div><div class="cleared" ></div>