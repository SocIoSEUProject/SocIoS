<%@ Control language="C#" CodeFile="ViewProfile.ascx.cs" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.Modules.Admin.Users.ViewProfile" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<dnn:DnnJsInclude ID="DnnJsInclude" runat="server" FilePath="~/Resources/Shared/scripts/knockout.js" />

<div id="profileOutput" runat="server" style="display:none" data-bind="visible: Visible"></div>
<asp:Label id="noPropertiesLabel" runat="server" resourcekey="NoProperties" Visible="false" />
<div id="buttonPanel" runat="server">
    <ul class="dnnActions dnnClear">
        <li><asp:HyperLink id="editLink" runat="server" resourcekey="Edit" CssClass="dnnPrimaryAction" /></li>
    </ul>
</div>
<script language="javascript" type="text/javascript">

    jQuery(document).ready(function($) {
        function ProfileViewModel() {
            var self = this;
            self.AboutMeText = '<%=LocalizeString("AboutMe") %>';
            self.LocationText = '<%=LocalizeString("Location") %>';
            self.GetInTouchText = '<%=LocalizeString("GetInTouch") %>';
            <% = ProfileProperties %>

            self.Location = ko.computed(function() {
                var city = self.City();
                var region = self.Region();
                var location = (city != null) ? city : '';
                if (location != '' && region != null && region != '') {
                    location += ', ';
                }
                if (region != null) {
                    location += region;
                }

                return location;
            });

            self.Visible = true;
        };

        ko.applyBindings(new ProfileViewModel(), document.getElementById($('#<%= profileOutput.ClientID %>').attr("id")));

        });

</script>
