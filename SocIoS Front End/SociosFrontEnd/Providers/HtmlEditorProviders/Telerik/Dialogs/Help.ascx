<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">
td
{
	text-align: center;
}
.reDescriptionCell
{
	text-align: left;
}
.bottomBorder td
{
	
}
</style>
<table cellpadding="0" border="0" cellspacing="0" class="reDialog HelpDialog" style="width: 700px; display: block; margin: 4px;">
    <tr>
        <td style="text-align: left; padding: 8px 0">
            <h1>RadEditor for ASP.NET AJAX</h1>
            <h2>Help Topics</h2>
        </td>
    </tr>
	<tr>
		<td style="text-align: left;">
			<div class="helpTopics">
				<!-- help topics go here -->
				<table cellpadding="0" cellspacing="0" class="helpTable bottomBorder">
					<tr>
						<th style="width: 24px;">
							Icon
						</th>
						<th style="width: 500px;">
							Description
						</th>
						<th>
							Shortcut</th>
					</tr>
					<tr>
						<td class="reTool">
							<span class="StyleBuilder">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Style Builder - Allows the user to apply styles to the currently selected element.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="TrackChangesDialog">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							TrackChanges - Provides a comparison between two contents.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="XhtmlValidator">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							XhtmlValidator - Uses the W3C XHTML Validator Page to perform validation of the
							current editor content.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ConvertToUpper">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							ConvertToUpper - Convert the text of the current selection to upper case, preserving
							the non-text elements such as images and tables.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ConvertToLower">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							ConvertToLower - Convert the text of the current selection to lower case, preserving
							the non-text elements such as images and tables.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ImageMapDialog">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							ImageMapDialog - Allow users to create image maps through draging over the images
							and creating hyperlink areas of different shapes.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="FormatCodeBlock">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							FormatCodeBlock - Allow users to insert and format code blocks into the content.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							RealFontSize - Allows the user to apply to the current selection font size measured
							in pixels, rather than a fixed-size 1 to 7 (as does the FontSize tool).
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ToggleScreenMode">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							ToggleScreenMode - Switches RadEditor into Full Screen Mode.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ToggleTableBorder">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Show/Hide Border - Shows or hides borders around tables in the content area.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Zoom - Changes the level of text magnification.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ModuleManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Module Manager - Activates /Deactivates modules from a drop-down list of available
							modules.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="FindAndReplace">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Find and Replace - Find (and replaces) text in the editor's content area.</td>
						<td>
							Ctrl+F</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Print">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Print button - Prints the contents of the RadEditor or the whole web page.
						</td>
						<td>
							Ctrl+P</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="AjaxSpellCheck">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							AjaxSpellCheck - Launches the spellchecker.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Cut">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Cut button - Cuts the selected content and copies it to the clipboard.
						</td>
						<td>
							Ctrl+X</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Copy">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Copy button - Copies the selected content to the clipboard.
						</td>
						<td>
							Ctrl+C</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Paste">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Paste button - Pastes the copied content from the clipboard into the editor.
						</td>
						<td>
							Ctrl+V</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="PasteFromWord">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Paste from Word button - Pastes content copied from Word and removes the web-unfriendly
							tags.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="PasteFromWordNoFontsNoSizes">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Paste from Word cleaning fonts and sizes button - cleans all Word-specific tags
							and removes font names and text sizes.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="PastePlainText">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Paste Plain Text button - Pastes plain text (no formatting) into the editor.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="PasteAsHtml">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Paste as HTML button - Pastes HTML code in the content area and keeps all the HTML
							tags.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Undo">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Undo button - Undoes the last action.
						</td>
						<td>
							Ctrl+Z</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Redo">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Redo button - Redoes/Repeats the last action, which has been undone.
						</td>
						<td>
							Ctrl+Y</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="FormatStripper">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Format Stripper button - Removes custom or all formatting from selected text.
						</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Help">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Help - Launches the Quick Help you are currently viewing.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="AboutDialog">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							About Dialog - Shows the current version and credentials of RadEditor.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td colspan="3" align="center" valign="middle" style="padding-top: 10px">
							<strong>INSERT AND MANAGE LINKS, TABLES, SPECIAL CHARACTERS, IMAGES and MEDIA</strong></td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ImageManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Image Manager button - Inserts an image from a predefined image folder(s).</td>
						<td>
							Ctrl+G</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ImageMapDialog">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Image map - Allows users to define clickable areas within image.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="AbsolutePosition">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Absolute Object Position button - Sets an absolute position of an object (free move).</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertTable">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert Table button - Inserts a table in the RadEditor.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ToggleTableBorder">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Toggle Table Borders - Toggles borders of all tables within the editor.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertSnippet">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert Snippet - Inserts pre-defined code snippets.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertFormElement">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert Form Element - Inserts a form element from a drop-down list with available
							elements.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertDate">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert Date button - Inserts current date.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertTime">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert Time button - Inserts current time.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="FlashManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Flash Manager button - Inserts a Flash animation and lets you set its properties.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="MediaManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Windows Media Manager button - Inserts a Windows media object (AVI, MPEG, WAV, etc.)
							and lets you set its properties.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="DocumentManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Document Manager - Inserts a link to a document on the server (PDF, DOC, etc.)</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="LinkManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Hyperlink Manager button - Makes the selected text or image a hyperlink.</td>
						<td>
							Ctrl+K</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Unlink">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Remove Hyperlink button - Removes the hyperlink from the selected text or image.</td>
						<td>
							Ctrl+Shift+K</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Insert Special Character dropdown - Inserts a special character (&euro; &reg;, <font
								face="Arial">©, ±</font>, etc.)</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Insert Custom Link dropdown - Inserts an internal or external link from a predefined
							list.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="TemplateManager">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Choose HTML Template - Applies and HTML template from a predefined list of templates.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td colspan="3" align="center" valign="middle" style="padding-top: 10px">
							<strong>CREATE, FORMAT AND EDIT PARAGRAPHS and LINES</strong></td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertParagraph">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert New Paragraph button - Inserts new paragraph.</td>
						<td>
							Ctrl+M</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Paragraph Style Dropdown button - Applies standard text styles to selected text.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Outdent">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Outdent button - Indents paragraphs to the left.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Indent">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Indent button - Indents paragraphs to the right.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="JustifyLeft">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Align Left button - Aligns the selected paragraph to the left.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="JustifyCenter">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Center button - Aligns the selected paragraph to the center.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="JustifyRight">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Align Right button - Aligns the selected paragraph to the right.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="JustifyFull">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Justify button - Justifies the selected paragraph.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertUnorderedList">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Bulleted List button - Creates a bulleted list from the selection.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertOrderedList">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Numbered List button - Creates a numbered list from the selection.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="InsertHorizontalRule">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Insert horizontal line (e.g. horizontal rule) button - Inserts a horizontal line
							at the cursor position.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td colspan="3" align="center" valign="middle" style="padding-top: 10px">
							<strong>CREATE, FORMAT AND EDIT TEXT, FONT and LISTS</strong></td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Bold">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Bold button - Applies bold formatting to selected text.</td>
						<td>
							Ctrl+B</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Italic">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Italic button - Applies italic formatting to selected text.</td>
						<td>
							Ctrl+I</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Underline">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Underline button - Applies underline formatting to selected text.</td>
						<td>
							Ctrl+U</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="StrikeThrough">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Strikethrough button - Applies strikethrough formatting to selected text.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Superscript">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Superscript button - Makes a text superscript.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="Subscript">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Subscript button - Makes a text subscript.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Font Select button - Sets the font typeface.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Font Size button - Sets the font size.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="ForeColor">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Text Color (foreground) button - Changes the foreground color of the selected text.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="BackColor">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Text Color (background) button - Changes the background color of the selected text.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Apply class - applies custom, predefined styles to the selected text.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<span class="FormatCodeBlock">&nbsp;</span>
						</td>
						<td class="reDescriptionCell">
							Format Code Block - Allow users to insert and format code blocks into the content.</td>
						<td>
							-</td>
					</tr>
					<tr>
						<td class="reTool">
							<select disabled="disabled">
							</select>
						</td>
						<td class="reDescriptionCell">
							Custom Links dropdown - Inserts custom, predefined link.</td>
						<td>
							-</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
		    <table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
                <tr>
                    <td>
			            <button type="button" onclick="javascript:Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();"
				            style="width: 75px;" id="OkButton">
				            <script type="text/javascript">
				                setInnerHtml("OkButton", localization["OK"]);
			                </script>
				        </button>
				    </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<div style="display: none;">
	<!-- hidden color picker will load the necessary css images -->
	<tools:ColorPicker id="ColorPicker" runat="server">
	</tools:ColorPicker>
</div>