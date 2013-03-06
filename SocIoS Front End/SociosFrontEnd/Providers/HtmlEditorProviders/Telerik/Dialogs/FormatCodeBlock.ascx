<%@ Control Language="C#" %><%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor"
	TagPrefix="tools" %><%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script type="text/javascript">
	//<!--
	Type.registerNamespace("Telerik.Web.UI.Widgets");

	Telerik.Web.UI.Widgets.CodeFormatter = function(element)
	{
		Telerik.Web.UI.Widgets.CodeFormatter.initializeBase(this, [element]);
		this._confirmButton = null;
		this._cancelButton = null;
		this._previewButton = null;
		this._dirtyCode = null;
		this._maxSnippetWidth = null;
		this._language = null;
		this._maxSnippetHeight = null;
		this._showLineNumbers = null;
		this._previewArea = null;
		this._clientParameters = null;
		this._highlighterParams = {};
	}

	Telerik.Web.UI.Widgets.CodeFormatter.prototype = {
		initialize: function()
		{
			Telerik.Web.UI.Widgets.CodeFormatter.callBaseMethod(this, 'initialize');
			this._initializeChildren();
		},

		clientInit: function(clientParameters)
		{
			this._clientParameters = clientParameters;
			this.set_dirtyCode(this._clientParameters.get_value());
			this._previewArea.innerHTML = "";
		},

		_initializeChildren: function()
		{
			this._confirmButton = $get("confirm");
			this._confirmButton.title = localization["OK"];

			this._cancelButton = $get("cancel");
			this._cancelButton.title = localization["Cancel"];

			this._previewButton = $get("preview");
			this._previewButton.title = localization["Preview"];

			this._dirtyCode = $get("dirtyCode");
			this._maxSnippetWidth = $get("maxSnippetWidth");
			this._language = $get("language");
			this._fixDropDownLocalization(this._language);
			this._maxSnippetHeight = $get("maxSnippetHeight");
			this._showLineNumbers = $get("showLineNumbers");
			this._previewArea = $get("previewArea");

			$addHandlers(this._confirmButton, { "click": this._confirmClickHandler }, this);
			$addHandlers(this._cancelButton, { "click": this._cancelClickHandler }, this);
			$addHandlers(this._previewButton, { "click": this._previewClickHandler }, this);
		},

		_fixDropDownLocalization: function(ddl)
		{

			for (var i = 0; i < ddl.options.length; i++)
			{
				var option = ddl.options[i];
				var localizedText = localization["Language" + option.value];
				if (localizedText)
					option.text = localizedText;
			}
		},

		_preview: function()
		{
			this._previewArea.innerHTML = this.getFormattedCode();
		},

		_confirmClickHandler: function(e)
		{
			if (this._dirtyCode.value.trim() != "")
			{
				this._preview();
				var previewHTML = this._previewArea.innerHTML;
				var width = this.get_maxSnippetWidth();
				var height = this.get_maxSnippetHeight();
				var value = String.format("<div class='reCodeBlock' style='border:solid 1px #7f9db9;width:{0};height:{1};overflow-y:auto;'>{2}</div>", width, height, previewHTML);

				var eventArgs = new Telerik.Web.UI.EditorCommandEventArgs("FormatCodeBlock", null, value);
				eventArgs._width = width;
				eventArgs._height = height;
				eventArgs.get_width = function() { return this._width; };
				eventArgs.get_height = function() { return this._height; };

				Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close(eventArgs);
			}
		},

		_cancelClickHandler: function(e)
		{
			Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();
		},

		_previewClickHandler: function(e)
		{
			this._preview();
		},

		get_dirtyCode: function()
		{
			return this._dirtyCode.value;
		},

		set_dirtyCode: function(dirtyCode)
		{
			this._dirtyCode.value = dirtyCode;
		},

		get_maxSnippetWidth: function()
		{
			return this._maxSnippetWidth.value;
		},

		set_maxSnippetWidth: function(value)
		{
			this._maxSnippetWidth.value = value;
		},

		get_maxSnippetHeight: function()
		{
			return this._maxSnippetHeight.value;
		},

		set_maxSnippetHeight: function(value)
		{
			this._maxSnippetHeight.value = value;
		},

		get_selectedLanguage: function()
		{
			var lang = this._language.options[this._language.selectedIndex].value;
			return lang ? lang.toLowerCase() : "";
		},

		get_showLineNumbers: function()
		{
			return this._showLineNumbers.checked;
		},

		set_showLineNumbers: function(show)
		{
			this._showLineNumbers.checked = value;
		},

		_highlight: function(globalParams, source)
		{
			if (!source || !globalParams || !globalParams.brush)
				return "";

			var sh = SyntaxHighlighter;
			var params = sh.utils.parseParams("brush: " + globalParams.brush);
			var brushName;
			params = sh.utils.merge(globalParams, params);
			brushName = params['brush'];
			var brush = sh.utils.findBrush(brushName);
			if (brush)
			{
				var highlighter = new brush();
				highlighter.highlight(source, params);

				var result = highlighter.div.innerHTML;
				return result;
			}
			else
			{
				return source;
			}
		},

		getFormattedCode: function()
		{
			var params = this._highlighterParams;
			params.brush = this.get_selectedLanguage();
			params.gutter = this.get_showLineNumbers();
			var result = this._highlight(params, this.get_dirtyCode());
			return result;
		},

		dispose: function()
		{
			$clearHandlers(this._confirmButton);
			$clearHandlers(this._cancelButton);
			$clearHandlers(this._previewButton);
			this._confirmButton = null;
			this._cancelButton = null;
			this._previewButton = null;
			this._dirtyCode = null;
			this._maxSnippetWidth = null;
			this._language = null;
			this._maxSnippetHeight = null;
			this._showLineNumbers = null;
			this._previewArea = null;
			this._clientParameters = null;
			Telerik.Web.UI.Widgets.CodeFormatter.callBaseMethod(this, 'dispose');
		}
	}

	Telerik.Web.UI.Widgets.CodeFormatter.registerClass('Telerik.Web.UI.Widgets.CodeFormatter', Telerik.Web.UI.RadWebControl);
	// -->
</script>
<table border="0" cellpadding="0" cellspacing="0" class="reDialog FormatCodeBlock" style="width: 698px;">
	<tr>
		<td>
			<fieldset style="width: 694px;">
				<legend>
					<script type="text/javascript">
						document.write(localization["PasteSourceCode"]);
					</script>
				</legend>
				<table cellpadidng="0" cellspacing="0" border="0">
					<tr>
						<td>
							<textarea class="dirtyCode" cols="10" rows="10" style="border: 0; width: 680px; overflow: auto;" id="dirtyCode"></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset style="width: 694px;">
				<legend>Options</legend>
				<table border="0" cellpadding="0" cellspacing="0" class="reControlsLayout" style="margin-bottom: 8px;">
					<tr>
						<td class="reLabelCell" style="width: 130px;">
							<label for="maxSnippetWidth" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["MaxSnippetWidth"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<input type="text" id="maxSnippetWidth" style="width: 26px" />
						</td>
						<td>
							px / %
						</td>
						<td style="width: 100px;">
							<label for="language" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["SelectLanguage"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<select id="language" style="width: 200px;">
								<option value="Xml" selected="selected">xml</option>
								<option value="Javascript">Javascript</option>
								<option value="Css">Css</option>
								<option value="CS">CS</option>
								<option value="CPP">CPP</option>
								<option value="VB">VB</option>
								<option value="Php">Php</option>
								<option value="SQL">SQL</option>
								<option value="Delphi">Delphi</option>
								<option value="Python">Python</option>
							</select>
						</td>
						<td rowspan="2" class="reControlCell">
							<button type="button" id="preview" style="width: 120px;">
								<script type="text/javascript">
									setInnerHtml("preview", localization["Preview"]);
								</script>
							</button>
						</td>
					</tr>
					<tr>
						<td class="reLabelCell" style="width: 130px;">
							<label for="maxSnippetHeight" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["MaxSnippetHeight"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<input type="text" id="maxSnippetHeight" style="width: 26px" />
						</td>
						<td>
							px / %
						</td>
						<td colspan="2" class="reControlCell" style="text-align: right; padding-right: 8px;">
							<label for="showLineNumbers">
								<script type="text/javascript">
									document.write(localization["DisplayLineNumbers"]);
								</script>
							</label>
							<input type="checkbox" id="showLineNumbers" />
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset style="width: 694px;">
				<legend>
					<script type="text/javascript">
						document.write(localization["Preview"]);
					</script>
				</legend>
				<div class="FormattedCodePreview" id="previewArea" style="width: 690px">
					<!-- / -->
				</div>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
			<table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
				<tr>
					<td>
						<button type="button" id="confirm">
							<script type="text/javascript">
								setInnerHtml("confirm", localization["OK"]);
							</script>
						</button>
					</td>
					<td class="reRightMostCell">
						<button type="button" id="cancel">
							<script type="text/javascript">
								setInnerHtml("cancel", localization["Cancel"]);
							</script>
						</button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
