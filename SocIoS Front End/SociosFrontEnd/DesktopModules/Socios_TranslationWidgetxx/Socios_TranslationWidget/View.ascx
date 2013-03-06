<%@ Control language="C#" Inherits="DotNetNuke.Modules.Socios_TranslationWidget.View" AutoEventWireup="false"  Codebehind="View.ascx.cs" %>

        <div id="translator-wrapper">
<asp:Label ID="lblDescription" runat="server" Text="Use the automatic translation tool to translate user replies."></asp:Label>
           <div id="translator-ddl">
           <div class="translator-ddl-wrap">
            <asp:DropDownList CausesValidation="false" ID="translateLanguage" CssClass="translateLanguage" runat="server">
            <asp:ListItem Selected="True" Text="Translate to..." Value="x"></asp:ListItem>
            <asp:ListItem Text="English" Value="en"></asp:ListItem>
             <asp:ListItem Text="German" Value="de"></asp:ListItem>
              <asp:ListItem Text="Czech" Value="cs"></asp:ListItem>
               <asp:ListItem Text="Greek" Value="el"></asp:ListItem>
                <asp:ListItem Text="Original" Value="-"></asp:ListItem>
            </asp:DropDownList>
            </div>
            </div>

<div id="translating-status">
    <asp:Label ID="Label1" runat="server" Text="Translating"></asp:Label>...</div>
    <div id="translating-complete">
    <asp:Label ID="Label2" runat="server" Text="Translation complete!"></asp:Label></div>
    <div id="reverting-complete">
    <asp:Label ID="Label3" runat="server" Text="Reverted to original language."></asp:Label></div>
    </div>

    