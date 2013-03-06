<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="DotNetNuke.Modules.Admin.Users.Register" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>

<div class="dnnForm dnnRegistrationForm">
    <div class="dnnFormItem">
        <div class="dnnFormMessage dnnFormInfo"><asp:label id="userHelpLabel" runat="server" /></div>
    </div>
    <br/>
    <div class="dnnFormItem dnnFormHelp dnnClear"><p class="dnnFormRequired"><span><%=LocalizeString("RequiredFields")%></span></p></div>
    <div class="dnnFormItem dnnClear">
        <dnn:DnnFormEditor id="userForm" runat="Server" FormMode="Short" />
        <div class="dnnSocialRegistration">
            <div id="mainContainer">
                <ul class="buttonList">
                    <asp:PlaceHolder ID="socialLoginControls" runat="server"/>
                </ul>
            </div>
        </div>
    </div>
    <div id="captchaRow" runat="server" visible="false" class="dnnFormItem dnnCaptcha">
        <dnn:label id="captchaLabel" controlname="ctlCaptcha" runat="server" />
        <dnn:captchacontrol id="ctlCaptcha" captchawidth="130" captchaheight="40" ErrorStyle-CssClass="dnnFormMessage dnnFormError dnnCaptcha" runat="server" />
    </div>   
<h2>Agreeing to the Terms of Use and Privacy Policy</h2>
    <div>
	<div class="dnnFormMessage dnnFormInfo">
	
	
	<input type="checkbox" id="agreeTermsOfUseChkbx"> I agree to the SocIos <b><a style="text-decoration: underline;" target="_blank" href="http://frontend.sociosproject.eu/Termsofuse.aspx">Terms of Use</a></b> and <b><a style="text-decoration: underline;"   target="_blank"  href="http://frontend.sociosproject.eu/PrivacyPolicy.aspx">Privacy Policy</a></b>.
</div></div>
    <ul id="actionsRow" runat="server" class="dnnActions dnnClear">
        <li><asp:LinkButton id="registerButton" runat="server" CssClass="dnnPrimaryAction registerButton" resourcekey="cmdRegister" /></li>
        <li><asp:LinkButton id="cancelButton" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdCancel" CausesValidation="false" /></li>
    </ul>
</div>
<script>
$(document).ready(function(){
	var registerOriginalJs = $(".registerButton").attr("href");
	$(".registerButton").attr('disabled', 'disabled');
	$(".registerButton").attr('href', '');
	$("#agreeTermsOfUseChkbx").attr('checked', false);
	$(".registerButton").click(function(){
		alert("You need to accept the terms and conditions in order to register to Socios");
		return false;
	});
$("#agreeTermsOfUseChkbx").click(function(){

	if(!$get("agreeTermsOfUseChkbx").checked)
	{
	$(".registerButton").attr('disabled', 'disabled');
	$(".registerButton").attr('href', '');
	$(".registerButton").click(function(){
		alert("You need to accept the terms and conditions in order to register to Socios");
		return false;
	});
	}
	else
	{
		$(".registerButton").removeAttr('disabled');
$(".registerButton").unbind('click');
	$(".registerButton").attr('href', registerOriginalJs);
	}
	
});

})




</script>

