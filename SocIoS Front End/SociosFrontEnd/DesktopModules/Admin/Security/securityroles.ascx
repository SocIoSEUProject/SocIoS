<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.Admin.Security.SecurityRoles" CodeFile="SecurityRoles.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div class="dnnForm dnnManageSecurityRoles">
    <asp:Panel ID="pnlRoles" runat="server" Visible="True">
        <h2 class="dnnFormSectionHead"><asp:Label ID="lblTitle" runat="server" /></h2>
        <table cellspacing="0" cellpadding="0" border="0" class="dnnSecurityRoles dnnClear">
            <tr class="dnnFormItem">
                <td valign="top" width="250">
                    <dnn:Label ID="plUsers" runat="server" ControlName="cboUsers" />
                    <dnn:Label ID="plRoles" runat="server" ControlName="cboRoles" />
                </td>
                <td width="10"></td>
                <td valign="top" width="150"><dnn:Label ID="plEffectiveDate" runat="server" ControlName="txtEffectiveDate" /></td>
                <td width="10"></td>
                <td valign="top" width="150"><dnn:Label ID="plExpiryDate" runat="server" ControlName="txtExpiryDate" /></td>
                <td width="30"></td>
                <td valign="top" width="200"></td>
            </tr>
            <tr class="dnnFormItem">
                <td valign="top" width="250">
                    <asp:TextBox ID="txtUsers" runat="server" Width="150" />
                    <asp:LinkButton ID="cmdValidate" runat="server" CssClass="dnnSecondaryAction" resourceKey="cmdValidate" />
                    <asp:DropDownList ID="cboUsers" runat="server" AutoPostBack="True" Width="100%" />
                    <asp:DropDownList ID="cboRoles" runat="server" AutoPostBack="True" DataValueField="RoleID" DataTextField="RoleName" Width="100%" />
                </td>
                <td width="10"></td>
                <td valign="top" width="150" nowrap="nowrap" align="right">
                    <dnn:DnnDatePicker ID="effectiveDatePicker" runat="server"/>
                </td>
                <td width="10"></td>
                <td valign="top" width="150" nowrap="nowrap" align="right">
                    <dnn:DnnDatePicker ID="expiryDatePicker" runat="server"/>
                </td>
                <td width="30"></td>
                <td valign="top" width="200" nowrap="nowrap">
                    <asp:LinkButton ID="cmdAdd" CssClass="dnnPrimaryAction" runat="server"  CausesValidation="true" ValidationGroup="SecurityRole" />
                </td>
            </tr>
        </table>
        <asp:CompareValidator ID="valEffectiveDate" CssClass="dnnFormError" runat="server" resourcekey="valEffectiveDate" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="effectiveDatePicker" ValidationGroup="SecurityRole" />
        <asp:CompareValidator ID="valExpiryDate" CssClass="dnnFormError" runat="server" resourcekey="valExpiryDate" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="expiryDatePicker" ValidationGroup="SecurityRole" />
        <asp:CompareValidator ID="valDates" CssClass="dnnFormError" runat="server" resourcekey="valDates" Display="Dynamic" Type="Date" Operator="GreaterThan" ControlToValidate="expiryDatePicker" ControlToCompare="effectiveDatePicker" ValidationGroup="SecurityRole" />
    </asp:Panel>
    <asp:CheckBox ID="chkNotify" resourcekey="SendNotification" runat="server" Checked="True" />

    <asp:Panel ID="pnlUserRoles" runat="server" CssClass="WorkPanel" Visible="True">
        <asp:DataGrid ID="grdUserRoles" runat="server" Width="100%" GridLines="None" BorderStyle="None" DataKeyField="UserRoleID" EnableViewState="false" AutoGenerateColumns="false" CellSpacing="0" CellPadding="0" CssClass="dnnGrid dnnSecurityRoles">
            <headerstyle cssclass="dnnGridHeader" verticalalign="Top"/>
            <itemstyle cssclass="dnnGridItem" horizontalalign="Left" />
            <alternatingitemstyle cssclass="dnnGridAltItem" />
            <edititemstyle cssclass="dnnFormInput" />
            <selecteditemstyle cssclass="dnnFormError" />
            <footerstyle cssclass="dnnGridFooter" />
            <pagerstyle cssclass="dnnGridPager" />
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <!-- [DNN-4285] Hide the button if the user cannot be removed from the role -->
                        <dnn:DnnImageButton ID="cmdDeleteUserRole" runat="server" AlternateText="Delete" CausesValidation="False" CommandName="Delete" IconKey="Delete" resourcekey="cmdDelete"  Visible='<%# DeleteButtonVisible(Convert.ToInt32(Eval("UserID")), Convert.ToInt32(Eval("RoleID")))  %>' OnClick="cmdDeleteUserRole_click">
                        </dnn:DnnImageButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UserName">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#FormatUser(Convert.ToInt32(Eval("UserID")),Eval("FullName").ToString()) %>' ID="UserNameLabel" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="RoleName" HeaderText="SecurityRole" />
                <asp:TemplateColumn HeaderText="EffectiveDate">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#FormatDate(Convert.ToDateTime(Eval("EffectiveDate"))) %>' ID="Label2" name="Label1" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ExpiryDate">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#FormatDate(Convert.ToDateTime(Eval("ExpiryDate"))) %>' ID="Label1" name="Label1" />
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </asp:Panel>
    <ul id="actionsRow" runat="server" class="dnnActions dnnClear">
        <li><asp:HyperLink id="cmdCancel" runat="server" CssClass="dnnPrimaryAction" resourcekey="Close" /></li>
    </ul>
</div>