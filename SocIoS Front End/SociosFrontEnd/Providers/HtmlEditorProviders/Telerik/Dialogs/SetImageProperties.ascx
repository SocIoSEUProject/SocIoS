<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.ImageProperties = function(element)
{
	Telerik.Web.UI.Widgets.ImageProperties.initializeBase(this, [element]);
	this._clientParameters = null;
	this._allowedASCII = new Array(8, 16, 35, 36, 37, 39, 45, 46);
	this._constrainDimentions = false;
	this._ratio = 0;

	//this is used when we try to load an image before the dialog is initialized
	this._initialImage = null;
}

Telerik.Web.UI.Widgets.ImageProperties.prototype = {
	initialize: function()
	{
		Telerik.Web.UI.Widgets.ImageProperties.callBaseMethod(this, 'initialize');
		this._setupChildren();
		this._originalImage = null;
		this._initialImage = null;
	},

	dispose: function()
	{
		$clearHandlers(this._imageWidth);
		$clearHandlers(this._imageHeight);
		$clearHandlers(this._constrainButton);
		if (this._insertButton) $clearHandlers(this._insertButton);
		if (this._cancelButton) $clearHandlers(this._cancelButton);
		Telerik.Web.UI.Widgets.ImageProperties.callBaseMethod(this, 'dispose');
	},

	clientInit: function(clientParameters)
	{
		this._colors = clientParameters.Colors != null ? clientParameters.Colors : [];
		this._editor = clientParameters.editor;
		this._cssClasses = clientParameters.CssClasses != null ? clientParameters.CssClasses : [];
		if (!clientParameters.get_value)
		{
			return;
		}
		var originalImage = null;

		if (this._initialImage != null)
		{
			originalImage = this._initialImage;
			this._initialImage = null;
		}
		else
		{
			try
			{
				//prevent"Can't execude code from a freed script"
				originalImage = clientParameters.get_value();
			} catch (ex) { };
		}

		if (originalImage)
		{
			this.loadImageProperties(originalImage);
		}
	},

	loadImageProperties: function(originalImage)
	{
		if (this._editor == null)
		{
			//wait for clientInit before loading the image
			this._initialImage = originalImage;
			return;
		}
		
		this._originalImage = originalImage;
		var currentImage = this._originalImage.cloneNode(true);

		var widthValue = this._getOriginalWidth(this._originalImage);
		this._imageWidth.value = (widthValue.indexOf("px") != -1) ? parseInt(widthValue) : widthValue; //strp px from the width value
		var heightValue = this._getOriginalHeight(this._originalImage);
		this._imageHeight.value = (heightValue.indexOf("px") != -1) ? parseInt(heightValue) : heightValue; //strp px from the width value
		//NEW: Support for %
		this._ratio = parseInt(this._imageWidth.value) / parseInt(this._imageHeight.value);


		var currentSrc = currentImage.getAttribute("src", 2);
		if (this._imageSrc)
		{
			this._imageSrc.set_value(currentSrc);
			this._imageSrc.set_editor(this._editor);
			var imgButton = this._imageSrc.get_pushButton();
			if (imgButton && imgButton.title)
			{
				var localizedTitle = localization[imgButton.title];
				if (localizedTitle)
				{
					imgButton.title = localizedTitle;
				}
			}
			this._imageSrcValue = null;
		}
		else
		{
			this._imageSrcValue = currentSrc;
		}

		this._imageAlt.value = this._getAttribute(currentImage, "alt");
		this._imageLongDecs.value = this._getAttribute(currentImage, "longDesc");
		this._imageAlignment.setTagName("IMG");

		//TODO: This should be moved to a separate method - perhaps even a shared method because similar code is used in an editor filter and in the nodeinspectormodule
		var floatJSProperty = ($telerik.isIE) ? "styleFloat" : "cssFloat";
		var styleFloat = (typeof (currentImage.style[floatJSProperty]) == "undefined") ? "" : currentImage.style[floatJSProperty];
		var verticalAlign = (typeof (currentImage.style["verticalAlign"]) == "undefined") ? "" : currentImage.style["verticalAlign"];
		var alignValue = "";

		if (verticalAlign == "" && styleFloat != "")
		{
			switch (styleFloat)
			{
				case "left":
					alignValue = "left";
					break;
				case "right":
					alignValue = "right";
					break;
			}
		}
		if (styleFloat == "")
		{
			switch (verticalAlign)
			{
				case "top":
					alignValue = "top";
					break;
				case "middle":
					alignValue = "absmiddle";
					break;
				case "text-bottom":
					alignValue = "bottom";
					break;
			}
		}

		this._imageAlignment.updateValue(alignValue, null);

		if (currentImage.style.marginTop)
			this._marginTopSpinBox.set_value(currentImage.style.marginTop.replace("px", ""));
		else
			this._marginTopSpinBox.set_value("");

		if (currentImage.style.marginRight)
			this._marginRightSpinBox.set_value(currentImage.style.marginRight.replace("px", ""));
		else
			this._marginRightSpinBox.set_value("");

		if (currentImage.style.marginBottom)
			this._marginBottomSpinBox.set_value(currentImage.style.marginBottom.replace("px", ""));
		else
			this._marginBottomSpinBox.set_value("");

		if (currentImage.style.marginLeft)
			this._marginLeftSpinBox.set_value(currentImage.style.marginLeft.replace("px", ""));
		else
			this._marginLeftSpinBox.set_value("");

		var borderValue = parseInt(currentImage.style.borderWidth);
		if (isNaN(borderValue)) borderValue = "";
		if (!borderValue)
		{
			var borderAttributeValue = currentImage.getAttribute("border");
			if (borderAttributeValue)
			{
				borderValue = borderAttributeValue;
				currentImage.style.borderWidth = borderAttributeValue + "px";
				currentImage.style.borderStyle = "solid";
			}
		}
		currentImage.removeAttribute("border");
		this._borderWidthSpinBox.set_value(borderValue);

		//Set colors to the color picker
		this._colorPicker.set_items(this._colors);

		var borderColor = currentImage.style.borderColor.toUpperCase();
		this._colorPicker.set_color(borderColor);

		//Set css class names to the css dropdown and selects the one of the selected image if existing
		//localization
		this._imageCssClassList.set_showText(true);
		this._imageCssClassList.set_clearclasstext(localization["ClearClass"]);
		this._imageCssClassList.set_text(localization["ApplyClass"]);
		this._imageCssClassList.set_items(this._cssClasses);

		if (currentImage.className != null && currentImage.className != "")
		{
			this._imageCssClassList.updateValue(currentImage.className);
		}
	},

	_getOriginalWidth: function(currentImage)
	{
		if (!currentImage) return "";

		//Make 4 attempts to obtain width - 1)from style, 2) from attribute 3) from client size
		var width;
		if (currentImage.style.width)
		{
			width = currentImage.style.width;
		}

		//Try to obtain the value from the attribute.
		if (!width)
		{
			width = currentImage.getAttribute("width");
		}

		//Try script property
		if (!width)
		{
			width = currentImage.width;
		}

		if (!width)
		{
			width = currentImage.offsetWidth;
		}

		return width == null ? "" : width + "";
	},

	_getOriginalHeight: function(currentImage)
	{
		if (!currentImage) return "";

		//Make 4 attempts to obtain height - 1)from style, 2) from attribute 3) from client size
		var height;

		if (currentImage.style.height)
		{
			height = currentImage.style.height;
		}

		//Try to obtain the value from the attribute.
		if (!height)
		{
			height = currentImage.getAttribute("height");
		}

		//Try script property
		if (!height)
		{
			height = currentImage.height;
		}

		if (!height)
		{
			height = currentImage.offsetHeight;
		}

		return height == null ? "" : height + "";
	},

	_getImageOriginalSize: function(img) //NEW gets original image size
	{
		var tempImg = new Image();
		tempImg.src = (img.getAttribute ? img.getAttribute("src") : false) || img.src;
		var size = {
			width: tempImg.width,
			height: tempImg.height
		};
		return size;
	},

	_clearImgeDimensions: function(image) //NEW clear image's style size properties if they concur with the original image size.
	{
		var imageOriginalSize = this._getImageOriginalSize(image);

		var imageOriginalWidth = imageOriginalSize.width;
		var imageCurrentWidth = this._getOriginalWidth(image);
		if (imageCurrentWidth.indexOf("px") != -1) imageCurrentWidth = parseInt(imageCurrentWidth); //remove the px unit

		var imageOriginalHeight = imageOriginalSize.height;
		var imageCurrentHeight = this._getOriginalHeight(image);
		if (imageCurrentHeight.indexOf("px") != -1) imageCurrentHeight = parseInt(imageCurrentHeight); //remove the px unit

		if ((imageOriginalWidth == imageCurrentWidth && (imageCurrentHeight == 0 || imageOriginalHeight == imageCurrentHeight)) || (imageOriginalHeight == imageCurrentHeight && (imageCurrentWidth == 0 || imageOriginalWidth == imageCurrentWidth)))
		{
			image.style["width"] = "";
			image.style["height"] = "";
		}
	},

	getModifiedImage: function()
	{
		if (this._originalImage == null)
		{
			return null;
		}

		var resultImage = this._originalImage.cloneNode(true);

		//Make sure the image src attribute is set before the widht/height, as setting the src causes IE to add width and height attributes expicitly
		var srcValue = this._imageSrcValue ? this._imageSrcValue : this._imageSrc.get_value();
		this._setAttribute(resultImage, "src", srcValue);

		this._setDimensionAttribute(resultImage, "width", this._imageWidth.value);
		this._setDimensionAttribute(resultImage, "height", this._imageHeight.value);
		this._clearImgeDimensions(resultImage); //check if the current dimensions coincide with the original image size and remove the css width properties

		this._setAttribute(resultImage, "alt", this._imageAlt.value);
		this._setAttribute(resultImage, "longDesc", this._imageLongDecs.value);

		//image align
		this._setImgAlignStyle(resultImage, this._imageAlignment.getAlign());

		var marginTop = parseInt(this._marginTopSpinBox.get_value());
		resultImage.style.marginTop = (!isNaN(marginTop)) ? marginTop + "px" : "";

		var marginRight = parseInt(this._marginRightSpinBox.get_value());
		resultImage.style.marginRight = (!isNaN(marginRight)) ? marginRight + "px" : "";

		var marginBottom = parseInt(this._marginBottomSpinBox.get_value());
		resultImage.style.marginBottom = (!isNaN(marginBottom)) ? marginBottom + "px" : "";

		var marginLeft = parseInt(this._marginLeftSpinBox.get_value());
		resultImage.style.marginLeft = (!isNaN(marginLeft)) ? marginLeft + "px" : "";

		var borderSize = parseInt(this._borderWidthSpinBox.get_value());
		if (!isNaN(borderSize) && borderSize >= 0)
		{
			resultImage.style.borderWidth = borderSize + "px";
			resultImage.style.borderStyle = "solid";
		}
		else
		{
			resultImage.style.borderWidth = "";
			resultImage.style.borderStyle = "";
		}
		resultImage.removeAttribute("border");

		if (this._colorPicker.get_color())
		{
			resultImage.style.borderColor = this._colorPicker.get_color();
		}

		this._setClass(resultImage, this._imageCssClassList);
		return resultImage;
	},

	_setImgAlignStyle: function(img, align)
	{
		var floatJSProperty = ($telerik.isIE) ? "styleFloat" : "cssFloat";
		switch (align)
		{
			case "left":
				img.style[floatJSProperty] = "left";
				img.style["verticalAlign"] = "";
				break;
			case "right":
				img.style[floatJSProperty] = "right";
				img.style["verticalAlign"] = "";
				break;
			case "top":
				img.style[floatJSProperty] = "";
				img.style["verticalAlign"] = "top";
				break;
			case "bottom":
				img.style[floatJSProperty] = "";
				img.style["verticalAlign"] = "text-bottom";
				break;
			case "absmiddle":
				img.style[floatJSProperty] = "";
				img.style["verticalAlign"] = "middle";
				break;
			default:
				img.style[floatJSProperty] = "";
				img.style["verticalAlign"] = "";
				break;
		}
		img.removeAttribute("align");
	},

	_getAttribute: function(image, attributeName)
	{
		var attributeValue = "";
		if (image.getAttribute(attributeName))
		{
			attributeValue = image.getAttribute(attributeName);
		}
		return attributeValue;
	},

	_setAttribute: function(image, attributeName, attributeValue)
	{
		if (attributeValue.trim())
		{
			image.setAttribute(attributeName, attributeValue);
		}
		else
		{
			image.removeAttribute(attributeName, false);
		}
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

	_setupChildren: function()
	{
		this._imageWidth = $get("ImageWidth");
		this._imageHeight = $get("ImageHeight");
		this._constrainButton = $get("ConstrainButton");
		this._colorPicker = $find("BorderColor");
		this._imageAlignment = $find("ImageAlignment");
		this._imageAlt = $get("ImageAlt");
		this._imageLongDecs = $get("ImageLongDesc");
		this._imageSrc = $find("ImageSrc");
		this._marginTopSpinBox = $find("marginTop");
		this._marginRightSpinBox = $find("marginRight");
		this._marginBottomSpinBox = $find("marginBottom");
		this._marginLeftSpinBox = $find("marginLeft");
		this._borderWidthSpinBox = $find("ImageBorderWidth");
		this._imageCssClassList = $find("ImageCssClass");
		this._insertButton = $get("InsertButton");
		if (this._insertButton) this._insertButton.title = localization["OK"];
		this._cancelButton = $get("CancelButton");
		if (this._cancelButton) this._cancelButton.title = localization["Cancel"];

		this._initializeChildEvents();
	},

	_initializeChildEvents: function()
	{
		$addHandlers(this._imageWidth, { "keyup": this._validateDimensionByWidth }, this);
		$addHandlers(this._imageWidth, { "keydown": this._validateNumber }, this);
		$addHandlers(this._imageHeight, { "keyup": this._validateDimensionByHeight }, this);
		$addHandlers(this._imageHeight, { "keydown": this._validateNumber }, this);
		$addHandlers(this._constrainButton, { "click": this._constrainClickHandler }, this);
		if (this._insertButton) $addHandlers(this._insertButton, { "click": this._insertClickHandler }, this);
		if (this._cancelButton) $addHandlers(this._cancelButton, { "click": this._cancelClickHandler }, this);
	},

	_setDimensionAttribute: function(image, attributeName, size)
	{
		image.removeAttribute(attributeName);
		var bRamoveStyleProperty = false;
		if (!size)
		{
			//remove style property if size is empty
			if (image.style.removeAttribute) image.style.removeAttribute(attributeName, false);
			else image.style[attributeName] = "";
		}
		else
		{
			//NEW: Provide support for % as well, not just px
			var unit = $telerik.parseUnit(size);
			image.style[attributeName] = unit.size + unit.type;
		}
	},

	_validateDimensionByWidth: function(e)
	{
		this._validateDimension(e, "width");
	},

	_validateDimensionByHeight: function(e)
	{
		this._validateDimension(e, "height");
	},

	_constrainClickHandler: function(e)
	{
		this._constrainDimentions = !this._constrainDimentions;

		if (this._constrainDimentions)
		{
			//Update the readings on the gauges
			//this._updateConstraintGauges(); there is no need to update the heiht on click of the this._constrainButton
			Sys.UI.DomElement.addCssClass(this._constrainButton.parentNode, "toggle");
		}
		else
		{
			Sys.UI.DomElement.removeCssClass(this._constrainButton.parentNode, "toggle");
		}

		//Cancel the postback that the button causes in FF
		return $telerik.cancelRawEvent(e);
	},

	_updateConstraintGauges: function(attributeName)
	{
		//If no attributeName is specified, the "width" is assumed
		var useWidth = (attributeName != "height");

		var dependantControl = null;
		var rulingControl = null;
		var ratio = 0;

		if (useWidth)
		{
			dependantControl = this._imageHeight;
			rulingControl = this._imageWidth;
			ratio = 1 / this._ratio;
		}
		else
		{
			dependantControl = this._imageWidth;
			rulingControl = this._imageHeight;
			ratio = this._ratio;
		}
		var rulingControlValue = rulingControl.value;
		var newValue = "";
		if (rulingControlValue)
		{
			//Support %, not just px
			var rulingUnit = $telerik.parseUnit(rulingControlValue);
			var size = rulingUnit.size;

			//Set the value
			newValue = Math.ceil(size * ratio);
			var rulingUnitType = rulingUnit.type;
			if (rulingUnitType != "px") newValue += rulingUnitType;
		}
		dependantControl.value = newValue;
	},

	_validateDimension: function(e, attributeName)
	{
		if (!this._validateNumber(e))
			return false;

		if (this._constrainDimentions)
			this._updateConstraintGauges(attributeName);

		return true;
	},

	_validateNumber: function(e)
	{
		if (window.event != null) e = window.event;

		if (((e.keyCode >= 48) && (e.keyCode <= 57)) ||
			((e.keyCode >= 96) && (e.keyCode <= 105)) ||
			(Array.contains(this._allowedASCII, e.keyCode)))
		{
			return true;
		}
		else
		{
			return $telerik.cancelRawEvent(e);
		}
	},

	_insertClickHandler: function(e)
	{
		var image = this.getModifiedImage();
		if (image)
		{
			var arg = new Telerik.Web.UI.EditorCommandEventArgs("SetImageProperies", null, image)
			Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close(arg);
		}
		else $telerik.cancelRawEvent(e); //cancel event if there is no image to return
	},

	_cancelClickHandler: function(e)
	{
		Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();
	},

	get_imageWidth: function()
	{
		return this._imageWidth;
	},

	get_imageHeight: function()
	{
		return this._imageHeight;
	},

	get_ratio: function()
	{
		return this._ratio;
	},

	set_ratio: function(value)
	{
		this._ratio = value;
	}
}

Telerik.Web.UI.Widgets.ImageProperties.registerClass('Telerik.Web.UI.Widgets.ImageProperties', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>

<table cellspacing="0" cellpadding="0" border="0" class="reDialog ImageProperties"
	style="width: 300px;">
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" class="reControlsLayout">
				<tr>
					<td colspan="2">
						<!-- height, width and constrain proportions button -->
						<table cellpadding="0" cellspacing="0" class="reConstrainProportionsWrapper">
							<tr>
								<td class="reLabelCell" style="width: 120px;">
									<label class="reDialogLabel">
										<span style="text-align: right;">
											<script type="text/javascript">document.write(localization["Width"]);</script>
										</span>
									</label>
								</td>
								<td class="reControlCell">
									<input type="text" id="ImageWidth" style="width: 26px; text-align: right;" />
								</td>
								<td>
									px
								</td>
								<td rowspan="2">
									<ul>
										<li class="ConstrainProportions">
											<button id="ConstrainButton" class="ConstrainButton">
												&nbsp;</button>
										
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="reLabelCell" style="width: 120px;">
									<label class="reDialogLabel">
										<span style="text-align: right;">
											<script type="text/javascript">document.write(localization["Height"]);</script>
										</span>
									</label>
								</td>
								<td class="reControlCell">
									<input type="text" id="ImageHeight" style="width: 26px; text-align: right;" />
								</td>
								<td>
									px
								</td>
							</tr>
						</table>
						<!-- end of height, width and constrain proportions button -->
					</td>
				</tr>
				<tr>
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["BorderColor"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<tools:ColorPicker ID="BorderColor" runat="Server" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["BorderWidth"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<tools:EditorSpinBox ID="ImageBorderWidth" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["ImageAltText"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="ImageAlt" style="width: 165px;" />
					</td>
				</tr>
				<tr class="textAttributes">
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["LongDescription"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="ImageLongDesc" style="width: 165px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["ImageAlignment"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<tools:AlignmentSelector ID="ImageAlignment" runat="Server" />
					</td>
				</tr>
				<tr class="imageSrc" id="imageCallerRow" runat="server">
					<td class="reLabelCell">
						<label class="reDialogLabel" style="width: 120px;">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["ImageSrc"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<tools:ImageDialogCaller ID="ImageSrc" runat="server" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;"><script type="text/javascript">document.write(localization["Margin"]);</script></span>
						</label>
					</td>
					<td class="reControlCell setMarginsCell">
						<table cellpadding="0" cellspacing="2" class="setMarginsTable">
							<tr>
								<td>
									<script type="text/javascript">
										document.write(localization["Top"]);
									</script>
								</td>
								<td>
									<tools:EditorSpinBox ID="marginTop" runat="server" />
								</td>
								<td style="padding-left: 5px">
									<script type="text/javascript">
										document.write(localization["Right"]);
									</script>
								</td>
								<td>
									<tools:EditorSpinBox ID="marginRight" runat="server" />
								</td>
							</tr>
							<tr>
								<td>
									<script type="text/javascript">
										document.write(localization["Bottom"]);
									</script>
								</td>
								<td>
									<tools:EditorSpinBox ID="marginBottom" runat="server" />
								</td>
								<td style="padding-left: 5px">
									<script type="text/javascript">
										document.write(localization["Left"]);
									</script>
								</td>
								<td>
									<tools:EditorSpinBox ID="marginLeft" runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="reLabelCell" style="width: 120px;">
						<label class="reDialogLabel">
							<span style="text-align: right;">
								<script type="text/javascript">
									document.write(localization["CssClass"]);
								</script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<tools:ApplyClassDropDown ID="ImageCssClass" runat="Server" />
					</td>
				</tr>
				<tr id="controlButtonsRow" runat="server">
					<td class="reBottomcell" colspan="2">
						<table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
							<tr>
								<td>
									<button type="button" id="InsertButton">
										<script type="text/javascript">
											setInnerHtml("InsertButton", localization["OK"]);
										</script>
									</button>
								</td>
								<td>
									<button type="button" id="CancelButton">
										<script type="text/javascript">
											setInnerHtml("CancelButton", localization["Cancel"]);
										</script>
									</button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
