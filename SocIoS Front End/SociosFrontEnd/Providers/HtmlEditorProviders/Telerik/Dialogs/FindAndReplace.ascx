<%@ Control Language="C#" %><%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor"
	TagPrefix="tools" %><%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %><%@ Register
	Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script type="text/javascript">
	//<!--
	Type.registerNamespace("Telerik.Web.UI.Widgets");

	Telerik.Web.UI.Widgets.FindAndReplace = function(element)
	{
		Telerik.Web.UI.Widgets.FindAndReplace.initializeBase(this, [element]);
		this._clientParameters = null;
		this._findButton = null;
		this._rFindButton = null;
		this._replaceButton = null;
		this._replaceAllButton = null;
	}

	Telerik.Web.UI.Widgets.FindAndReplace.prototype = {
		initialize: function()
		{
			Telerik.Web.UI.Widgets.FindAndReplace.callBaseMethod(this, "initialize");
			this.setupChildren();
		},

		dispose: function()
		{
			$clearHandlers(this._findButton);
			$clearHandlers(this._rFindButton);
			$clearHandlers(this._replaceButton);
			$clearHandlers(this._replaceAllButton);
			$clearHandlers(this._closeButton);

			this._clientParameters = null;
			Telerik.Web.UI.Widgets.FindAndReplace.callBaseMethod(this, "dispose");
		},

		clientInit: function(clientParameters)
		{
			this._clientParameters = clientParameters;

			//feature - copy selected text into the find boxes if it is one line
			this._tab.set_selectedIndex(0);
			var selectedText = clientParameters.editor.getSelection().getText();
			if (selectedText.indexOf("\n") == -1)
			{
				this._rFind.value = selectedText;
				this._find.value = selectedText;
				this._rReplace.value = "";
			}
			else
			{
				this._rFind.value = "";
				this._find.value = "";
				this._rReplace.value = "";
			}

			this._wholeWordFind.checked = false;
			this._wholeWordReplace.checked = false;
			this._matchCaseReplace.checked = false;
			this._matchCaseFind.checked = false;
			this._upReplace.checked = false;
			this._upFind.checked = false;
			this._downReplace.checked = true;
			this._downFind.checked = true;
		},

		_replace: function(editor, str)
		{
			var newStr = str;
			//escape html content (find and replace is not supposed to work in HTML view anyway).
			if (newStr)
				newStr = newStr.replace(/&/gi, "&amp;").replace(/</gi, "&lt;").replace(/>/gi, "&gt;");
			var selectionText = editor.getSelection().getText();
			if (selectionText)
			{
				if ($telerik.isIE)
				{
					//IE selection bug
					try
					{
						editor.getSelection().getRange().duplicate().pasteHTML(newStr);
					}
					catch (uspecifiedError)
					{
						//unspecified error is thrown when replacing text inside a textarea element
						editor.getSelection().getRange().text = newStr;
					}
				}
				else
				{
					editor.pasteHtml(newStr, "FindAndReplace");
				}
			}
		},

		replaceEngine: function(stringToFind, newString, backwards, replaceMode, wholeWord, caseSensitive, wrapContent)
		{
			if (null == stringToFind || "" == stringToFind)
			{
				//nothing to do if search string is empty
				return;
			}
			var editor = this._clientParameters.editor;
			var contentWindow = editor.get_contentWindow();

			if (contentWindow.document.body.innerHTML == "")
			{
				this._showMessageBox(localization["NotFound"]);
				return;
			}

			if ($telerik.isIE)
			{
				editor.setActive();
			}

			var rng = editor.getSelection().getRange();
			if (($telerik.isIE && !rng.findText) || (!$telerik.isIE && !contentWindow.find))
			{
				this._showMessageBox(localization["NotSupported"]);
				return;
			}

			var flags = 0;
			if (wholeWord) flags = flags | 2;
			if (caseSensitive) flags = flags | 4;

			if (replaceMode == "replaceAll")
			{
				//Move the cursor at the beginning of the content
				editor.get_document().execCommand("SelectAll", false, null);
				editor.getSelection().collapse(true);

				var replaceCounter = 0;
				if ($telerik.isIE)
				{
					var rngReplace = editor.getSelection().getRange();
					while (rngReplace.findText(stringToFind, backwards ? -1 : 1, flags))
					{
						replaceCounter++;
						rngReplace.scrollIntoView();
						rngReplace.select();
						this._replace(editor, newString);
					}
				}
				else
				{
					//whole word is still not supported in Firefox
					while (contentWindow.find(stringToFind, caseSensitive, backwards, wrapContent, wholeWord, false, false))
					{
						replaceCounter++;
						this._replace(editor, newString);
					}
				}
				if (replaceCounter > 0)
					this._showMessageBox(String.format(localization["AllReplaced"], replaceCounter));
				else
					this._showMessageBox(localization["NotFound"]);

				return;
			}

			if (replaceMode == "replace")
			{
				this._replace(editor, newString);
			}

			editor.getSelection().collapse(backwards);
			var found = false;
			if ($telerik.isIE)
			{
				var rngFind = editor.getSelection().getRange();
				if (rngFind.findText(stringToFind, backwards ? -1 : 1, flags))
				{
					rngFind.scrollIntoView();
					rngFind.select();
					found = true;
				}
			}
			else
			{
				if (contentWindow.find(stringToFind, caseSensitive, backwards, wrapContent, wholeWord, false, false))
					found = true;
			}

			if (!found)
				this._showMessageBox(localization["NotFound"]);
		},

		_showMessageBox: function(msg)
		{
			window.alert(msg);
		},

		execFind: function()
		{
			var stringToFind = "";
			var backwards = false;
			var wholeWord = false;
			var caseSensitive = false;

			//find out which tab is active
			if (this._tab.get_selectedIndex() == 0)
			{
				stringToFind = this._find.value;
				wholeWord = this._wholeWordFind.checked;
				caseSensitive = this._matchCaseFind.checked;
				backwards = this._upFind.checked;
			}
			else
			{
				stringToFind = this._rFind.value;
				wholeWord = this._wholeWordReplace.checked;
				caseSensitive = this._matchCaseReplace.checked;
				backwards = this._upReplace.checked;
			}

			this.replaceEngine(stringToFind, null, backwards, "find", wholeWord, caseSensitive, true);
		},

		execReplace: function()
		{
			this.replaceEngine(this._rFind.value, this._rReplace.value, this._upReplace.checked, "replace", this._wholeWordReplace.checked, this._matchCaseReplace.checked, true);
		},

		execReplaceAll: function()
		{
			//up/down does not matter here so we send "false" (down)
			//focus the find box so the editor cursor position is lost
			if (this._rFind.focus)
				this._rFind.focus();
			this.replaceEngine(this._rFind.value, this._rReplace.value, false, "replaceAll", this._wholeWordReplace.checked, this._matchCaseReplace.checked, true);
		},

		setupChildren: function()
		{
			//dialog main controls
			this._tab = $find("dialogtabstrip");
			this._tab.add_tabSelected(Function.createDelegate(this, this._tabChangedHandler));

			this._closeButton = $get("CloseButton");
			this._closeButton.title = localization["Close"];

			//dialog buttons
			this._findButton = $get("FindButton");
			this._findButton.title = localization["FindNext"];
			this._rFindButton = $get("rFindButton");
			this._rFindButton.title = localization["FindNext"];
			this._replaceButton = $get("ReplaceButton");
			this._replaceButton.title = localization["Replace"];
			this._replaceAllButton = $get("ReplaceAllButton");
			this._replaceAllButton.title = localization["ReplaceAll"];

			//dialog form controls
			this._upReplace = $get("upReplace");
			this._upFind = $get("upFind");
			this._downReplace = $get("downReplace");
			this._downFind = $get("downFind");
			this._find = $get("find");
			this._rFind = $get("rFind");
			this._rReplace = $get("rReplace");
			this._wholeWordFind = $get("wholeWordFind");
			this._wholeWordReplace = $get("wholeWordReplace");
			this._matchCaseReplace = $get("matchCaseReplace");
			this._matchCaseFind = $get("matchCaseFind");

			//preselect "down" radio button
			this._downReplace.checked = true;
			this._downFind.checked = true;

			if (!$telerik.isIE)
			{
				//hide Whole word on non-IE browsers (not supported)
				$get("wwReplaceContainer").style.visibility = "hidden";
				$get("wwFindContainer").style.visibility = "hidden";
			}
			this._initializeChildEvents();
		},

		_initializeChildEvents: function()
		{
			$addHandlers(this._findButton, { "click": this._findClickHandler }, this);
			$addHandlers(this._rFindButton, { "click": this._findClickHandler }, this);
			$addHandlers(this._replaceButton, { "click": this._replaceClickHandler }, this);
			$addHandlers(this._replaceAllButton, { "click": this._replaceAllClickHandler }, this);
			$addHandlers(this._closeButton, { "click": this._cancelClickHandler }, this);
		},

		_tabChangedHandler: function(sender, args)
		{
			if (sender.get_selectedIndex() == 0)
			{
				this._find.value = this._rFind.value;
				this._wholeWordFind.checked = this._wholeWordReplace.checked;
				this._matchCaseFind.checked = this._matchCaseReplace.checked;
				this._upFind.checked = this._upReplace.checked;
				this._downFind.checked = this._downReplace.checked;
			}
			else
			{
				this._rFind.value = this._find.value;
				this._matchCaseReplace.checked = this._matchCaseFind.checked;
				this._wholeWordReplace.checked = this._wholeWordFind.checked;
				this._upReplace.checked = this._upFind.checked;
				this._downReplace.checked = this._downFind.checked;
			}
		},

		_cancelClickHandler: function(e)
		{
			Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();
		},

		_findClickHandler: function()
		{
			this.execFind();
		},

		_replaceClickHandler: function()
		{
			this.execReplace();
		},

		_replaceAllClickHandler: function()
		{
			this.execReplaceAll();
		}
	}

	Telerik.Web.UI.Widgets.FindAndReplace.registerClass("Telerik.Web.UI.Widgets.FindAndReplace", Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
	// -->
</script>
<table cellpadding="0" cellspacing="0" class="reDialog FindAndReplaceDialog NoMarginDialog" style="width: 420px;">
	<tr>
		<td class="reTopcell">
			<telerik:RadTabStrip ShowBaseLine="true" ID="dialogtabstrip" runat="server" MultiPageID="dialogMultiPage"
				SelectedIndex="0">
				<Tabs>
					<telerik:RadTab Text="Find" Value="Find">
					</telerik:RadTab>
					<telerik:RadTab Text="Replace" Value="Replace">
					</telerik:RadTab>
				</Tabs>
			</telerik:RadTabStrip>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 18px;">
			<telerik:RadMultiPage ID="dialogMultiPage" runat="server" SelectedIndex="0">
				<telerik:RadPageView ID="FindPage" runat="server">
					<table border="0" cellpadding="0" cellspacing="0" class="reControlsLayout">
						<tr>
							<td class="reLabelCell">
								<label for="find" class="reDialogLabel">
									<script type="text/javascript">
										document.write(localization["Find"]);
									</script>
								</label>
							</td>
							<td class="reControlCell" style="width: 213px;">
								<input type="text" id="find" />
							</td>
							<td class="reControlCell">
								<button type="button" id="FindButton">Find</button>
								<script type="text/javascript">
									setInnerHtml("FindButton", localization["Find"]);
								</script>
							</td>
						</tr>
					</table>
					<table border="0" cellpadding="0" cellspacing="0" class="reControlsLayout" style="width: 414px; margin-top: 55px;">
						<tr>
							<td style="width: 200px; padding: 4px;">
								<fieldset>
									<legend>
										<script type="text/javascript">
											document.write(localization["SearchOptions"]);
										</script>
									</legend>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<input type="checkbox" id="matchCaseFind" />
											</td>
											<td>
												<label for="matchCaseFind">
													<script type="text/javascript">
														document.write(localization["MatchCase"]);
													</script>
												</label>
											</td>
										</tr>
										<tr id="wwFindContainer">
											<td>
												<input type="checkbox" id="wholeWordFind" />
											</td>
											<td>
												<label for="wholeWordFind">
													<script type="text/javascript">
														document.write(localization["MatchWholeWords"]);
													</script>
												</label>
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
							<td style="width: 200px; padding: 4px;">
								<fieldset>
									<legend>
										<script type="text/javascript">
											document.write(localization["SearchDirection"]);
										</script>
									</legend>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<input type="radio" name="searchDirection" id="upFind" />
											</td>
											<td>
												<label for="upFind">
													<script type="text/javascript">
														document.write(localization["Up"]);
													</script>
												</label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="searchDirection" checked="checked" id="downFind" />
											</td>
											<td>
												<label for="downFind">
													<script type="text/javascript">
														document.write(localization["Down"]);
													</script>
												</label>
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
						</tr>
					</table>
				</telerik:RadPageView>
				<telerik:RadPageView ID="ReplacePage" runat="server">
					<table border="0" cellpadding="0" cellspacing="0" class="reControlsLayout">
						<tr>
							<td class="reLabelCell">
								<label for="rFind" class="reDialogLabel">
									<script type="text/javascript">
										document.write(localization["Find"]);
									</script>
								</label>
							</td>
							<td class="reControlCell" style="width: 213px;">
								<input type="text" id="rFind" />
							</td>
							<td class="reControlCell">
								<button type="button" id="rFindButton">Find Next</button>
								<script type="text/javascript">
									setInnerHtml("rFindButton", localization["FindNext"]);
								</script>
							</td>
						</tr>
						<tr>
							<td class="reLabelCell">
								<label for="rReplace" class="reDialogLabel">
									<script type="text/javascript">
										document.write(localization["ReplaceWith"]);
									</script>
								</label>
							</td>
							<td class="reControlCell" style="width: 213px;">
								<input type="text" id="rReplace" />
							</td>
							<td class="reControlCell">
								<button type="button" id="ReplaceButton">Replace</button>
								<script type="text/javascript">
									setInnerHtml("ReplaceButton", localization["Replace"]);
								</script>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="reLabelCell">
								&nbsp;
							</td>
							<td class="reControlCell">
								<button type="button" id="ReplaceAllButton">Replace All</button>
								<script type="text/javascript">
									setInnerHtml("ReplaceAllButton", localization["ReplaceAll"]);
								</script>
							</td>
						</tr>
					</table>
					<table border="0" class="reControlsLayout" cellpadding="0" cellspacing="0" style="width: 414px;">
						<tr>
							<td style="width: 200px; padding: 4px;">
								<fieldset>
									<legend>
										<script type="text/javascript">
											document.write(localization["SearchOptions"]);
										</script>
									</legend>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<input type="checkbox" id="matchCaseReplace" />
											</td>
											<td>
												<label for="matchCaseReplace">
													<script type="text/javascript">
														document.write(localization["MatchCase"]);
													</script>
												</label>
											</td>
										</tr>
										<tr id="wwReplaceContainer">
											<td>
												<input type="checkbox" id="wholeWordReplace" />
											</td>
											<td>
												<label for="wholeWordReplace">
													<script type="text/javascript">
														document.write(localization["MatchWholeWords"]);
													</script>
												</label>
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
							<td style="width: 200px; padding: 4px;">
								<fieldset>
									<legend>
										<script type="text/javascript">
											document.write(localization["SearchDirection"]);
										</script>
									</legend>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<input type="radio" name="replaceDirection" id="upReplace" />
											</td>
											<td>
												<label for="upReplace">
													<script type="text/javascript">
														document.write(localization["Up"]);
													</script>
												</label>
											</td>
										</tr>
										<tr>
											<td>
												<input type="radio" name="replaceDirection" checked="checked" id="downReplace" />
											</td>
											<td>
												<label for="downReplace">
													<script type="text/javascript">
														document.write(localization["Down"]);
													</script>
												</label>
											</td>
										</tr>
									</table>
								</fieldset>
							</td>
						</tr>
					</table>
				</telerik:RadPageView>
			</telerik:RadMultiPage>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
			<table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
				<tr>
					<td>
						<button type="button" id="CloseButton">Close</button>
						<script type="text/javascript">
							setInnerHtml("CloseButton", localization["Close"]);
						</script>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
