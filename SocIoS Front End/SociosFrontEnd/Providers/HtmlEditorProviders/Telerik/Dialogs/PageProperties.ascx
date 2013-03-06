<%@ Control Language="C#" %><%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor"
	TagPrefix="tools" %><%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<script type="text/javascript">

	Type.registerNamespace("Telerik.Web.UI.Widgets");
	Telerik.Web.UI.Widgets.PageProperties = function(element)
	{
		Telerik.Web.UI.Widgets.PageProperties.initializeBase(this, [element]);

		this._editorRef = null;
		this._editorBase = null;

		this._pageTitle = null;
		this._baseLocation = null;
		this._pageDescription = null;
		this._pageKeywords = null;
		this._pageBodyClassName = null;

		this._colorPicker = null;
		this._imageCaller = null;

		this._pageMarginTop = null;
		this._pageMarginBottom = null;
		this._pageMarginLeft = null;
		this._pageMarginRight = null;

		this._confirmButton = null;
		this._cancelButton = null;

		this._oMetaNames =
	{
		description: null,
		keywords: null
	};
	}

	Telerik.Web.UI.Widgets.PageProperties.prototype = {
		initialize: function()
		{
			Telerik.Web.UI.Widgets.PageProperties.callBaseMethod(this, "initialize");
			this.setupChildren();
		},

		setupChildren: function()
		{
			this._pageTitle = $get("PageTitle");
			this._baseLocation = $get("BaseLocation");
			this._pageDescription = $get("PageDescription");
			this._pageKeywords = $get("PageKeywords");
			this._pageBodyClassName = $find("PageBodyClassName");

			this._pageMarginTop = $get("PageMarginTop");
			this._pageMarginBottom = $get("PageMarginBottom");
			this._pageMarginLeft = $get("PageMarginLeft");
			this._pageMarginRight = $get("PageMarginRight");

			this._confirmButton = $get("confirm");
			this._confirmButton.title = localization["OK"];
			this._cancelButton = $get("cancel");
			this._cancelButton.title = localization["Cancel"];

			this._pageBodyClassName.add_valueSelected(this._cssValueSelected);
			$addHandlers(this._confirmButton, { "click": this._confirmButtonClickHandler }, this);
			$addHandlers(this._cancelButton, { "click": this._cancelButtonClickHandler }, this);
		},

		_confirmButtonClickHandler: function(e)
		{
			this._updateEditorDocument();
			Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close(Sys.EventArgs.Empty);
		},

		_cancelButtonClickHandler: function(e)
		{
			Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();
		},

		_cssValueSelected: function(oTool, args)
		{
			if (!oTool) return;
			var commandName = oTool.get_name();

			if ("ApplyClass" == commandName)
			{
				var attribValue = oTool.get_selectedItem();
				oTool.updateValue(attribValue);
			}
		},

		clientInit: function(clientParameters)
		{
			this._editorRef = clientParameters.editor;
			this._cssClasses = clientParameters.CssClasses;

			this._colorPicker = $find("ColorPicker");
			this._colorPicker.set_items(clientParameters.Colors);

			this._imageCaller = $find("ImageCaller");
			this._imageCaller.set_editor(this._editorRef);

			this._loadData(this._editorRef.get_document());
		},

		_getMetaTag: function(ownerDoc, name)
		{
			var metas = ownerDoc.getElementsByTagName("META");
			name = name.toLowerCase();
			var theMeta = null;

			for (var i = 0; i < metas.length; i++)
			{
				var meta = metas[i];
				var metaName = ("" + meta.getAttribute("name")).toLowerCase();
				if (name == metaName)
				{
					theMeta = meta;
				}
			}
			return theMeta;
		},

		_getAttribute: function(element, attributeName)
		{
			if (!element || !attributeName) return "";
			return element.getAttribute(attributeName);
		},

		_loadData: function(editorDocument)
		{
			if (editorDocument)
			{
				//TITLE
				this._pageTitle.value = editorDocument.title;

				this._pageDescription.value = "";
				this._pageKeywords.value = "";

				//&lt;meta name="keywords" content="keywords,keyword,keyword phrase,etc."&gt;
				var meta = this._getMetaTag(editorDocument, "Description");
				if (meta)
				{
					this._oMetaNames["Description"] = meta.getAttribute("content");
					this._pageDescription.value = this._oMetaNames["Description"];
				}

				meta = this._getMetaTag(editorDocument, "Keywords");
				if (meta)
				{
					this._oMetaNames["Keywords"] = meta.getAttribute("content");
					this._pageKeywords.value = this._oMetaNames["Keywords"];
				}

				// CSS classes
				var className = editorDocument.body.className;

				//localization
				this._pageBodyClassName.set_showText(true);
				this._pageBodyClassName.set_clearclasstext(localization["ClearClass"]);
				this._pageBodyClassName.set_text(localization["ApplyClass"]);
				this._pageBodyClassName.set_items(this._cssClasses);

				if (className)
				{
					this._pageBodyClassName.updateValue(className);
				}

				var imagePath = editorDocument.body.style.backgroundImage;
				imagePath = (!imagePath) ? "" : imagePath.substring(4, imagePath.length - 1);
				this._imageCaller.set_value(imagePath);

				//BASES
				var bases = editorDocument.getElementsByTagName("BASE");
				if (bases.length > 0)
				{
					this._editorBase = bases[0];
					this._baseLocation.value = this._editorBase.getAttribute("href");
				}

				//Body attributes
				var marginTop = editorDocument.body.style.marginTop;
				this._pageMarginTop.value = marginTop.replace("px", "");

				var marginRight = editorDocument.body.style.marginRight;
				this._pageMarginRight.value = marginRight.replace("px", "");
				var marginBottom = editorDocument.body.style.marginBottom;
				this._pageMarginBottom.value = marginBottom.replace("px", "");
				var marginLeft = editorDocument.body.style.marginLeft;
				this._pageMarginLeft.value = marginLeft.replace("px", "");


				//BgColor
				//TODO: Use the following check editorDocument.body._getAttribute("bgColor") - otherwise FF returns "#ffffff"
				//even though there is no bgColor attribute.
				var backgroundColor = editorDocument.body.style.backgroundColor;
				this._colorPicker.set_color(backgroundColor);
			}
		},

		_updateEditorMetaTag: function(editorHead, metaName, metaContent)
		{
			var editorMetaTag = null;
			var ownerDoc = editorHead.ownerDocument;

			if (!this._oMetaNames[metaName] && metaContent)
			{
				//TODO: !$telerik.isFirefox
				if (document.all)
				{
					editorMetaTag = editorHead.appendChild(ownerDoc.createElement("<META NAME='" + metaName + "'></META>"));
				}
				else
				{
					editorMetaTag = editorHead.appendChild(ownerDoc.createElement("META"));
					editorMetaTag.setAttribute("name", metaName);
				}
			}
			else editorMetaTag = this._getMetaTag(ownerDoc, metaName);

			if (editorMetaTag)
			{
				editorMetaTag.setAttribute("content", metaContent);
			}
		},

		_updateEditorDocument: function()
		{
			var editor = this._editorRef;

			if (!editor.get_fullPage())
			{
				//not editing in full HTML mode yet.
				var content = "<html><head><title>RadEditor</title></head><body>" + editor.get_html() + "</body>";
				editor.set_html(content);
			}

			var editorDocument = editor.get_document();
			var editorHead = editorDocument.getElementsByTagName("HEAD")[0];

			// Title
			editorDocument.title = this._pageTitle.value;

			//Problem with setting a title in Mozilla
			if (!$telerik.isIE)
			{
				var head = editorDocument.getElementsByTagName("HEAD")[0];
				var title = head.getElementsByTagName("title")[0];

				if (!title)
				{
					var title = editorDocument.createElement("title");
					head.appendChild(title);
				}

				if (title.firstChild) title.removeChild(title.firstChild);
				title.appendChild(editorDocument.createTextNode(this._pageTitle.value));
			}

			// Description, Keywords
			this._updateEditorMetaTag(editorHead, "Description", this._pageDescription.value);
			this._updateEditorMetaTag(editorHead, "Keywords", this._pageKeywords.value);

			// CSS
			this._setClass(editorDocument.body, this._pageBodyClassName);

			// Base
			var strBase = this._baseLocation.value;
			if (!this._editorBase && strBase)
			{
				this._editorBase = editorHead.appendChild(editorDocument.createElement("BASE"));
			}

			this._setAttribute(this._editorBase, "href", strBase);

			// COLOR
			//Firefox problem - even if the bg color has not been changed from the default,
			//FF will add a bgcolor attribute to the body tag
			if (editorDocument.body.style["backgroundColor"] != this._colorPicker.get_color())
			{
				this._setCssPropertyValue(editorDocument.body, "backgroundColor", this._colorPicker.get_color(), "bgColor");
			}

			// set the bg image
			var backgroundImage = this._imageCaller.get_value();
			backgroundImage = (backgroundImage) ? "url(" + backgroundImage + ")" : "";
			this._setCssPropertyValue(editorDocument.body, "backgroundImage", backgroundImage, "background");

			//TODO: Make this with style, as FF does not apply the margin attributes.
			var marginTop = this._pageMarginTop.value;
			if (marginTop) marginTop += "px";
			this._setCssPropertyValue(editorDocument.body, "marginTop", marginTop);

			var marginRight = this._pageMarginRight.value;
			if (marginRight) marginRight += "px";
			this._setCssPropertyValue(editorDocument.body, "marginRight", marginRight);

			var marginBottom = this._pageMarginBottom.value;
			if (marginBottom) marginBottom += "px";
			this._setCssPropertyValue(editorDocument.body, "marginBottom", marginBottom);

			var marginLeft = this._pageMarginLeft.value;
			if (marginLeft) marginLeft += "px";
			this._setCssPropertyValue(editorDocument.body, "marginLeft", marginLeft);
		},

		_setClass: function(element, cssClassHolder)
		{
			if (cssClassHolder.get_value() == "")
			{
				element.removeAttribute("className");
			}
			else
			{
				element.className = cssClassHolder.get_value();
			}
		},

		_setCssPropertyValue: function(element, cssProperty, value, attribute)
		{
			if (!element || !cssProperty) return;
			if (attribute) element.removeAttribute(attribute);
			element.style[cssProperty] = value;
		},

		_setAttribute: function(element, attributeName, attributeValue)
		{
			if (!element || !attributeName) return;
			if (attributeValue)
			{
				element.setAttribute(attributeName, attributeValue);
			}
			else
			{
				element.removeAttribute(attributeName);
			}
		},

		dispose: function()
		{
			$clearHandlers(this._confirmButton);
			$clearHandlers(this._cancelButton);

			this._editorRef = null;
			this._editorBase = null;

			this._pageTitle = null;
			this._baseLocation = null;
			this._pageDescription = null;
			this._pageKeywords = null;
			this._pageBodyClassName = null;

			this._colorPicker = null;
			this._imageCaller = null;

			this._pageMarginTop = null;
			this._pageMarginBottom = null;
			this._pageMarginLeft = null;
			this._pageMarginRight = null;

			this._confirmButton = null;
			this._cancelButton = null;

			Telerik.Web.UI.Widgets.PageProperties.callBaseMethod(this, "dispose");
		}
	}

	Telerik.Web.UI.Widgets.PageProperties.registerClass('Telerik.Web.UI.Widgets.PageProperties', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);

</script>
<style type="text/css">
	/* xl_input */
	.PageProperties td
	{
		padding: 0;
	}
</style>
<form id="Form1" action="" method="post">
<table cellpadding="0" cellspacing="0" class="reDialog PageProperties">
	<tr>
		<td>
			<fieldset style="width: 376px">
				<legend>
					<script type="text/javascript">
						document.write(localization["PageAttributes"]);
					</script>
				</legend>
				<table cellpadding="0" cellspacing="0" class="reControlsLayout" style="margin-bottom: 8px;">
					<tr>
						<td class="reLabelCell" style="width: 100px;">
							<label for="PageTitle" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["PageTitle"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<input type="text" id="PageTitle" style="width: 220px;" />
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label for="BaseLocation" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["BaseLocation"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<input type="text" id="BaseLocation" style="width: 220px;" />
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label for="PageDescription" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["Description"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<textarea id="PageDescription" cols="10" rows="3" style="width: 220px;"></textarea>
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label for="PageKeywords" class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["Keywords"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<textarea id="PageKeywords" cols="10" rows="3" style="width: 220px;"></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td>
			<fieldset style="width: 376px">
				<legend>
					<script type="text/javascript">
						document.write(localization["BodyAttributes"]);
					</script>
				</legend>
				<table cellpadding="0" cellspacing="0" class="reControlsLayout" style="margin-bottom: 8px;">
					<tr>
						<td class="reLabelCell" style="width: 100px;">
							<label class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["ClassName"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<tools:ApplyClassDropDown ID="PageBodyClassName" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["BackColor"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<tools:ColorPicker ID="ColorPicker" runat="server" />
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label class="reDialogLabel">
								<span style="text-align: right; width: 130px;">
									<script type="text/javascript">
										document.write(localization["BackgroundImage"]);
									</script>
								</span>
							</label>
						</td>
						<td class="reControlCell">
							<tools:ImageDialogCaller ID="ImageCaller" runat="server" />
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td>
			<fieldset style="width: 376px">
				<legend>Margins</legend>
				<table cellpadding="0" cellspacing="0" border="0" class="reControlsLayout" style="margin-left: 44px;
					width: 290px; margin-bottom: 8px;">
					<tr>
						<td style="text-align: right; padding-bottom: 4px;">
							<label for="PageMarginTop" class="reDialogLabel">
								<span style="text-align: right; width: 90px; margin-right: 4px;">
									<script type="text/javascript">
										document.write(localization["TopMargin"]);
									</script>
								</span>
							</label>
						</td>
						<td style="text-align: right; padding-bottom: 4px;">
							<input type="text" id="PageMarginTop" style="width: 26px; text-align: right;" /> px
						</td>
						<td style="text-align: right;" class="marginCell">
							<label for="PageMarginRight" class="reDialogLabel">
								<span style="text-align: right; width: 90px; margin-right: 4px;">
									<script type="text/javascript">
										document.write(localization["RightMargin"]);
									</script>
								</span>
							</label>
						</td>
						<td style="text-align: right; padding-bottom: 4px;">
							<input type="text" id="PageMarginRight" style="width: 26px; text-align: right;" /> px
						</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-bottom: 4px;">
							<label for="PageMarginBottom" class="reDialogLabel">
								<span style="text-align: right; width: 90px; margin-right: 4px;">
									<script type="text/javascript">
										document.write(localization["BottomMargin"]);
									</script>
								</span>
							</label>
						</td>
						<td class="marginCell">
							<input type="text" id="PageMarginBottom" style="width: 26px; text-align: right;" /> px
						</td>
						<td style="text-align: right;" class="marginCell">
							<label for="PageMarginLeft" class="reDialogLabel">
								<span style="text-align: right; width: 90px; margin-right: 4px;">
									<script type="text/javascript">
										document.write(localization["LeftMargin"]);
									</script>
								</span>
							</label>
						</td>
						<td class="marginCell">
							<input type="text" id="PageMarginLeft" style="width: 26px; text-align: right;" /> px
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
			<table cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
				<tr>
					<td style="padding-right: 8px;">
						<button type="button" id="confirm">
							<script type="text/javascript">setInnerHtml("confirm", localization["OK"]);</script>
						</button>
					</td>
					<td class="reRightMostCell">
						<button type="button" id="cancel">
							<script type="text/javascript">setInnerHtml("cancel", localization["Cancel"]);</script>
						</button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
