<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.ImageEditor = function(element)
{
	Telerik.Web.UI.Widgets.ImageEditor.initializeBase(this, [element]);
	this._clientParameters = null;
	this._imageSettingsPanel = null;

	this._suffix = "_thumb";
	this._name = "";
	this._src = "";
	this._editableImage = null;
	this._cropEnabled = false;

	//Utility variables
	this._currentPixelProportion = 1;
	this._maxNumber = 5;

}

Telerik.Web.UI.Widgets.ImageEditor.prototype =
{
	initialize: function()
	{
		Telerik.Web.UI.Widgets.ImageEditor.callBaseMethod(this, "initialize");
		this.setupChildren();
	},

	dispose: function()
	{
		this.clearHandlers();
		this._imageSettingsPanel = null;
		this._overrideExistingControl = null;

		Telerik.Web.UI.Widgets.ImageEditor.callBaseMethod(this, "dispose");
	},

	clientInit: function(clientParameters)
	{
		this._clientParameters = clientParameters;
		this.set_src(clientParameters.imageSrc, clientParameters.path);
		this._name = clientParameters.name;
		if (clientParameters.suffix != null)
		{
			this.set_suffix(clientParameters.suffix);
		}
		this._resetImageEditor();
	},

	setupChildren: function()
	{
		this._imageSettingsPanel = $find("imageSettings");

		//Sliders
		this._opacitySlider = $find("opacitySlider");
		this._opacitySlider.add_valueChanged(Function.createDelegate(this, this._onOpacitySliderChanged));

		this._widthSlider = $find("widthSlider");
		this._widthSlider.add_valueChanged(Function.createDelegate(this, this._onSizeSliderChanged));

		this._heightSlider = $find("heightSlider");
		this._heightSlider.add_valueChanged(Function.createDelegate(this, this._onSizeSliderChanged));

		//Tranpsarency
		this._opacityInput = $get("opacityInput");

		//Resize
		this._currentWidthInput = $get("currentWidthInput");
		this._currentHeightInput = $get("currentHeightInput");
		this._constrainProportionsControl = $get("ConstrainProportionsCheckBox");
		$addHandlers(this._constrainProportionsControl, { "click": this._onConstrainProportionsClicked }, this);

		//Crop
		this._cropXControl = $get("CropX");
		this._cropYControl = $get("CropY");
		this._boundsWidthControl = $get("CropWidth");
		this._boundsHeightControl = $get("CropHeight");
		$addHandlers(this._cropXControl, { "blur": this._onCropControlChanged }, this);
		$addHandlers(this._cropYControl, { "blur": this._onCropControlChanged }, this);
		$addHandlers(this._boundsWidthControl, { "blur": this._onCropControlChanged }, this);
		$addHandlers(this._boundsHeightControl, { "blur": this._onCropControlChanged }, this);

		//Flip
		this._flipHorizontalControl = $get("FlipHorizontal");
		this._flipVerticalControl = $get("FlipVertical");
		this._flipBothControl = $get("FlipBoth");
		this._flipNoneControl = $get("FlipNone");
		$addHandlers(this._flipNoneControl, { "click": this._onFlipControlChanged }, this);
		$addHandlers(this._flipHorizontalControl, { "click": this._onFlipControlChanged }, this);
		$addHandlers(this._flipVerticalControl, { "click": this._onFlipControlChanged }, this);
		$addHandlers(this._flipBothControl, { "click": this._onFlipControlChanged }, this);

		//Rotate
		this._rotateNoneControl = $get("RotateNone");
		this._rotate90Control = $get("Rotate90");
		this._rotate180Control = $get("Rotate180");
		this._rotate270Control = $get("Rotate270");
		$addHandlers(this._rotateNoneControl, { "click": this._onRotateControlChanged }, this);
		$addHandlers(this._rotate90Control, { "click": this._onRotateControlChanged }, this);
		$addHandlers(this._rotate180Control, { "click": this._onRotateControlChanged }, this);
		$addHandlers(this._rotate270Control, { "click": this._onRotateControlChanged }, this);

		//Utility controls
		this._imageEditorPane = $get("ImageEditorPane");
		this._overrideExistingControl = $get("OverwriteExistingCheckBox");
		this._newImageNameControl = $get("NewImageName");
		this._originalImageLocationControl = $get("OriginalImageLocation");

		//Save button
		this._saveButton = $get("saveThumbnail");
		this._saveButton.title = localization["Save"];
		$addHandlers(this._saveButton, { "click": this._saveButtonClickHandler }, this);
		this._cancelButton = $get("CancelButton");
		this._cancelButton.title = localization["Cancel"];

		//Reset button
		this._resetButton = $get("ResetImageEditor");
		this._resetButton.title = localization["RestoreImage"];
		$addHandlers(this._resetButton, { "click": this._resetImageEditor }, this);

		//Toggle crop button
		this._toggleCrop = $get("ToggleCrop");
		$addHandlers(this._toggleCrop, { "click": this._onToggleCropClick }, this);
		var buttonText = this._cropEnabled ? localization["DisableCrop"] : localization["EnableCrop"];
		this._updateDecoratedButton(this._toggleCrop.id, buttonText);
	},

	_updateDecoratedButton: function(buttonId, text)
	{
		//sets the text/title of a formdecorated button (Anchor)
		var button = $get(buttonId);
		button.innerHTML = text;
		button.title = text;
	},

	clearHandlers: function()
	{
		//Save button - could have remained from earlier phase, prior to AJAX
		if (this._saveButton) $clearHandlers(this._saveButton);
		if (this._resetButton) $clearHandlers(this._resetButton);
		if (this._toggleCrop) $clearHandlers(this._toggleCrop);
		if (this._flipNoneControl) $clearHandlers(this._flipNoneControl);
		if (this._flipHorizontalControl) $clearHandlers(this._flipHorizontalControl);
		if (this._flipVerticalControl) $clearHandlers(this._flipVerticalControl);
		if (this._flipBothControl) $clearHandlers(this._flipBothControl);

		if (this._rotateNoneControl) $clearHandlers(this._rotateNoneControl);
		if (this._rotate90Control) $clearHandlers(this._rotate90Control);
		if (this._rotate180Control) $clearHandlers(this._rotate180Control);
		if (this._rotate270Control) $clearHandlers(this._rotate270Control);

		if (this._cropXControl) $clearHandlers(this._cropXControl);
		if (this._cropYControl) $clearHandlers(this._cropYControl);
		if (this._boundsWidthControl) $clearHandlers(this._boundsWidthControl);
		if (this._boundsHeightControl) $clearHandlers(this._boundsHeightControl);
		if (this._constrainProportionsControl) $clearHandlers(this._constrainProportionsControl);
	},

	_enableCropHtmlElements: function(toEnable)
	{
		var elems = [this._cropXControl, this._cropYControl, this._boundsWidthControl, this._boundsHeightControl];

		for (var i = 0; i < elems.length; i++)
		{
			if (toEnable) elems[i].removeAttribute("disabled");
			else elems[i].setAttribute("disabled", "disabled");
		}
	},

	enableCrop: function(toEnable)
	{
		//Enable/disable all elements in the crop panel
		this._enableCropHtmlElements(toEnable);

		//Change button text
		this._updateDecoratedButton(this._toggleCrop.id, this._cropEnabled ? localization["DisableCrop"] : localization["EnableCrop"]);

		//Update the crop values for the
		var img = this._editableImage;
		if (img)
		{
			//Make sure the values in the crop text boxes are correct
			if (!toEnable) img.crop(null);
		}

		//Destroy the resizer if it existed, or else in some scenarios there are problems
		if (this._draggableResizer)
		{
			this._draggableResizer.dispose();
			this._draggableResizer = null;
			//HACK to prevent a problem with the MS AJAX leak prevention code in the RadWebControl base class
			if (this._imageEditorPane && typeof (this._imageEditorPane.control) != 'undefined')
			{
				this._imageEditorPane.control = undefined;
			}
		}

		//[Re]create the resizer
		if (!this._draggableResizer)
		{
			this._draggableResizer = $create(Telerik.Web.UI.Widgets.DraggableResizer, {}, null, null, this._imageEditorPane);
			var bounds = this._draggableResizer.getBounds();
			this._updateControllerCrop(bounds, true);
			this._draggableResizer.add_boundsChanged(Function.createDelegate(this, this._onCropDraggableChanged));
		}

		this._draggableResizer.setVisible(toEnable);
	},

	//=========================Update UI based on current Image settings =====================================//
	_updateControllerUI: function()
	{
		//Read all values from the image and set them back to the Dialog UI
		var img = this._editableImage;

		//Size
		var width = img.get_width();
		var height = img.get_height();
		//Set proportion value
		this._currentPixelProportion = width / height;

		this._updateControllerSize(width, height);

		//Flip
		var horiz = img.get_flipHorizontal();
		var vertical = img.get_flipHorizontal();
		this._updateControllerFlip(horiz, vertical);

		//Crop
		var bounds = img.get_cropBounds();
		this._updateControllerCrop(bounds);

		//Rotate
		var angle = img.get_rotationAngle();
		this._updateControllerRotate(angle);

		//Opacity
		this._updateControllerOpacity(100);

	},

	_updateControllerOpacity: function(opacity)
	{
		this._opacitySlider.set_value(opacity);
		this._opacityInput.value = opacity;
	},

	_updateControllerFlip: function(horiz, vertical)
	{
		if (horiz && vertical) this._flipBothControl.checked = "checked";
		else if (horiz) this._flipHorizontalControl.checked = "checked";
		else if (vertical) this._flipVerticalControl.checked = "checked";
		else this._flipNoneControl.checked = "checked";
	},

	_updateControllerRotate: function(angle)
	{
		switch (angle)
		{
			case 0: this._rotateNoneControl.checked = "checked"; break;
			case 1: this._rotate90Control.checked = "checked"; break;
			case 2: this._rotate180Control.checked = "checked"; break;
			case 3: this._rotate270Control.checked = "checked"; break;
		}
	},

	_updateControllerCrop: function(bounds, skipFixInIE)
	{
		if (!bounds) bounds = {};
		// TEMP: Remove this when we fix getLocation.
		else if ($telerik.isIE)
		{
			var positionedParent = this._imageEditorPane;
			// In case we want to clear the inputs, we should not add the scrollOffset.
			if (!skipFixInIE)
			{
				bounds.x += positionedParent.scrollLeft;
				bounds.y += positionedParent.scrollTop;
			}
		}

		this._cropXControl.value = isNaN(bounds.x) ? "" : bounds.x;
		this._cropYControl.value = isNaN(bounds.y) ? "" : bounds.y;
		this._boundsWidthControl.value = isNaN(bounds.width) ? "" : bounds.width;
		this._boundsHeightControl.value = isNaN(bounds.height) ? "" : bounds.height;
	},

	_updateDraggableCrop: function(bounds)
	{
		if ($telerik.isIE)
		{
			bounds.x -= 1;
			bounds.y -= 1;
			bounds.width += 2;
			bounds.height -= 14;
		}
		else if (!$telerik.isFirefox)
		{
			bounds.x -= 1;
			bounds.y -= 1;
			bounds.width += 2;
			bounds.height += 2;
		}
		if (this._draggableResizer) this._draggableResizer.setBounds(bounds);
	},

	_updateControllerSize: function(newWidth, newHeight)
	{
		var wSlider = this._widthSlider;
		var hSlider = this._heightSlider;
		var maxWidth = this._maxNumber * newWidth;
		var maxHeight = this._maxNumber * newHeight;

		wSlider.set_maximumValue(maxWidth);
		hSlider.set_maximumValue(maxHeight);

		wSlider.set_value(newWidth);
		hSlider.set_value(newHeight);
		this._currentWidthInput.value = newWidth;
		this._currentHeightInput.value = newHeight;
	},

	//===================================== Slider handlers ====================================================================//
	_onOpacitySliderChanged: function(sender, args)
	{
		var opacity = sender.get_value();
		//Update input
		this._opacityInput.value = opacity;
		//Update image
		this.get_editableImage().set_opacity(opacity);
	},

	_onSizeSliderChanged: function(slider)
	{
		if (this._avoidRecursion) return;

		var image = this.get_editableImage();
		var value = slider.get_value();

		var isWidthSlider = (slider == this._widthSlider);
		//Get sibling value
		var siblingValue = isWidthSlider ? image.get_height() : image.get_width();

		var keepRatio = this._constrainProportionsControl.checked;
		if (keepRatio)
		{
			var siblingSlider = isWidthSlider ? this._heightSlider : this._widthSlider;

			siblingValue = isWidthSlider ?
							Math.floor(value * (1 / this._currentPixelProportion)) :
							Math.floor(value * this._currentPixelProportion);

			this._avoidRecursion = true;
			siblingSlider.set_value(siblingValue);
			this._avoidRecursion = false;
		}

		var width = isWidthSlider ? value : siblingValue;
		var height = !isWidthSlider ? value : siblingValue;
		//Update image size
		image.setSize(width, height);

		//Select inputs, and set values to them
		var input = isWidthSlider ? this._currentWidthInput : this._currentHeightInput;
		input.value = value;

		var siblingInput = !isWidthSlider ? this._currentWidthInput : this._currentHeightInput;
		siblingInput.value = siblingValue;
	},

	//======================= Event handlers that are hooked to the Controller UI  ===================================================//
	_onConstrainProportionsClicked: function(e)
	{
		var image = this.get_editableImage();
		this._updateControllerSize(image.get_originalWidth(), image.get_originalHeight());
	},

	_onToggleCropClick: function(e)
	{
		this._cropEnabled = !this._cropEnabled;
		this.enableCrop(this._cropEnabled);
		//Do not propagate to body - MS AJAX has some handler attached to the form, which can screw things up
		return $telerik.cancelRawEvent(e);
	},

	//For swift response to the UI we will only upadte what changed in the UI, and not do a full update. Otherwise, when using SLIDER for example the operation will become very CPU intensive
	_onFlipControlChanged: function(e)
	{
		var img = this.get_editableImage();

		//Get radio values
		var radios = document.getElementsByName("flipRadio");
		for (var i = 0; radios.length > i; i++)
		{
			var radio = radios[i];
			if (radio.checked)
			{
				switch (i)
				{
					case 0: img.flipNone(); break;
					case 1: img.flipHorizontal(); break;
					case 2: img.flipVertical(); break;
					case 3: img.flipBoth(); break;
				}
				return;
			}
		}
	},

	_onRotateControlChanged: function(e)
	{
		var img = this.get_editableImage();

		//Get radio values
		var radios = document.getElementsByName("rotateRadio");
		for (var i = 0; radios.length > i; i++)
		{
			var radio = radios[i];
			if (radio.checked)
			{
				switch (i)
				{
					case 0: img.rotate(0); break;
					case 1: img.rotate(90); break;
					case 2: img.rotate(180); break;
					case 3: img.rotate(270); break;
				}
				return;
			}
		}
	},

	_onCropControlChanged: function()
	{
		var x = parseInt(this._cropXControl.value);
		var y = parseInt(this._cropYControl.value);
		var width = parseInt(this._boundsWidthControl.value);
		var height = parseInt(this._boundsHeightControl.value);
		var bounds = new Sys.UI.Bounds(isNaN(x) ? 0 : x, isNaN(y) ? 0 : y, isNaN(width) ? 0 : width, isNaN(height) ? 0 : height);

		//Update draggable [if a draggable exists]
		this._updateDraggableCrop(bounds);

		//Update image
		this.get_editableImage().crop(bounds);
	},

	_onCropDraggableChanged: function(sender, args)
	{
		var bounds = args.getBounds();
		//Update Crop control
		this._updateControllerCrop(bounds);
		//Update image
		this.get_editableImage().crop(bounds);
	},

	//======================================= MORE API ===================================================//

	//Reset to default state
	_resetImageEditor: function()
	{
		var src = this.get_src();

		//Disable crop prior to destorying content in iframe
		this._cropEnabled = false; //! or else the flag can kep an old value
		this.enableCrop(this._cropEnabled);

		//Destroy all content in the image div
		this._imageEditorPane.innerHTML = "";

		//Insert the image into the DIV
		var doc = this._imageEditorPane.ownerDocument;
		var image = doc.createElement("IMG");
		var randomId = "RadEditorRandom=" + (new Date() - 100);
		var imageSrc = encodeURI(src);
		imageSrc = imageSrc + (imageSrc.indexOf("?") > 0 ? "&" : "?") + randomId;
		image.src = imageSrc;

		image.onload = Function.createDelegate(this, function()
		{
			this._editableImage.initialize();
			this._updateControllerUI();
			image.onload = null;
		});

		this._imageEditorPane.appendChild(image);

		//Set the proposed thumbname in the name input
		var newName = this._name ? this._name : src.substring(src.lastIndexOf("/") + 1);
		var dotPos = newName.lastIndexOf(".");
		if (dotPos != -1)
		{
			$get("NewImageExt").innerHTML = newName.substring(dotPos);
			newName = newName.substring(0, dotPos);
		}
		newName += this.get_suffix();
		this.set_newImageName(newName);

		//disable opacity if not supported
		var imageExt = $get("NewImageExt").innerHTML;
		if (imageExt) imageExt = imageExt.toLowerCase();
		if (imageExt != ".gif" && imageExt != ".png" && imageExt != ".tiff")
		{
			this._opacitySlider.set_enabled(false);
		}
		else
		{
			this._opacitySlider.set_enabled(true);
		}

		//Set a new editable image [destroy old first]
		if (this._editableImage)
		{
			this._editableImage.dispose();
		}

		//Create editable image (browser dependent)

		this._editableImage = new Telerik.Web.UI.Widgets.EditableImage(image);
		/*$telerik.isIE ? new Telerik.Web.UI.Widgets.EditableImage(image)
		: new Telerik.Web.UI.Widgets.EditableImageMozilla(image);*/

		//Reset ratio checkbox when reseting image
		this._constrainProportionsControl.checked = true;

		//Set default values to all UI elements by examining the EditableImage props
		this._updateControllerUI();
	},

	_saveButtonClickHandler: function(e)
	{
		var separator = ":";

		var name = this.get_newImageName() + $get("NewImageExt").innerHTML;
		if (!name || name.indexOf(separator) != -1)
		{
			alert(localization["MessageCannotWriteToFolder"]);
			return;
		}

		var img = this.get_editableImage();
		var sb = new Sys.StringBuilder("");
		sb.append(img.get_width());
		sb.append(separator);
		sb.append(img.get_height());
		sb.append(separator);
		sb.append(img.get_rotationAngle());
		sb.append(separator);
		sb.append(img.get_flipHorizontal());
		sb.append(separator);
		sb.append(img.get_flipVertical());
		sb.append(separator);
		sb.append(img.get_opacity());
		sb.append(separator);
		sb.append(img.get_cropBounds().width);
		sb.append(separator);
		sb.append(img.get_cropBounds().height);
		sb.append(separator);
		sb.append(img.get_cropBounds().x);
		sb.append(separator);
		sb.append(img.get_cropBounds().y);
		sb.append(separator);
		sb.append(this._cropEnabled ? "true" : "false");
		sb.append(separator);
		sb.append(this._overrideExistingControl.checked ? "true" : "false");
		sb.append(separator);
		sb.append(name);

		var imageData = $get("imageData");
		imageData.value = sb.toString();
		this._imageSettingsPanel.ajaxRequest();
	},

	//================================== Properties ================================================//
	get_src: function()
	{
		//Get src from the hidden field
		return this._src;
	},

	set_src: function(src, path)
	{
		//Set path in the hidden field and if not available, use src
		this._src = src;
		if (!path) path = src;
		this._originalImageLocationControl.value = path;
	},

	get_newImageName: function()
	{
		return this._newImageNameControl.value;
	},

	set_newImageName: function(value)
	{
		this._newImageNameControl.value = value;
	},

	get_suffix: function()
	{
		var suffix = this._suffix;
		return suffix ? suffix : "";
	},

	set_suffix: function(suffix)
	{
		this._suffix = suffix;
	},

	get_editableImage: function()
	{
		return this._editableImage;
	}
}
Telerik.Web.UI.Widgets.ImageEditor.registerClass("Telerik.Web.UI.Widgets.ImageEditor", Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);

//======================== A DraggableResizer class that will be used for the cropping part =======================================//
Telerik.Web.UI.Widgets.DraggableResizer = function(element)
{
	Telerik.Web.UI.Widgets.DraggableResizer.initializeBase(this, [element]);
}

Telerik.Web.UI.Widgets.DraggableResizer.prototype =
{
	initialize: function()
	{
		Telerik.Web.UI.Widgets.DraggableResizer.callBaseMethod(this, "initialize");

		this._cropBounds = null;
		this._cropElement = null;
		this._createUI();
	},

	//Will be different in different browsers
	_createUI: function()
	{
		//Creating UI, attaching handlers
		var doc = this.get_element().ownerDocument;
		var tableElement = doc.createElement("TABLE");

		tableElement.className = "reDraggableResizer";
		tableElement.style.position = "absolute";
		tableElement.cellSpacing = 0;
		tableElement.cellPadding = 0;

		//Array of divs
		this._resizeDivs = [];

		for (var i = 0; i < 3; i++)
		{
			var row = tableElement.insertRow(-1);

			for (var j = 0; j < 3; j++)
			{
				var cell = row.insertCell(-1);
				cell.innerHTML = "&nbsp;";
				cell.align = "center";
				cell.vAlign = "middle";
				if (i == 1 && j == 1)//Middle cell
				{
					cell.style.width = "100%";
					cell.style.height = "100%";
				}
				else if (i != 1)//Handles
				{
					var div = doc.createElement("DIV");
					div.className = "resizerHandle";
					cell.appendChild(div);

					this._resizeDivs[this._resizeDivs.length] = div;
				}
			}
		}

		this._cropElement = tableElement;
		this.get_element().appendChild(this._cropElement);

		//!Store parent offset if it is a relatively positioned element!
		var isRelative = ("relative" == $telerik.getCurrentStyle(tableElement.parentNode, "position"));
		this._offsetLocation = (isRelative ? $telerik.getLocation(tableElement.parentNode) : null);

		//Set initial position
		this.setBounds({ x: 0, y: 0, width: 50, height: 50 });

		//Make resizeable
		this._makeResizeable(true);
	},

	_makeResizeable: function(bResize)
	{
		//Remove current resize extender
		if (this._resizeExtender)
		{
			this._resizeExtender.dispose();
			this._resizeExtender = null;
		}

		//Return of element must not be made resizable
		if (!bResize) return;

		//Maybe dispose was called on the window that was never created?
		if (!this._cropElement) return;

		//This is the initialization object that must be "filled" in and passed to the ResizeExtender

		var resizeDivs = this._resizeDivs;
		var hashTable =
		{
			nw: resizeDivs[0],
			n: resizeDivs[1],
			ne: resizeDivs[2],
			//w: resizeDivs[3],
			//e: resizeDivs[4],
			sw: resizeDivs[3],
			s: resizeDivs[4],
			se: resizeDivs[5],
			move: this._cropElement.rows[1].cells[1]
		};

		this._resizeExtender = new Telerik.Web.UI.ResizeExtender(this, this._cropElement, hashTable, this._cropElement);
	},

	_raiseResizeEvent: function()
	{
		var args = new Sys.EventArgs();
		var bounds = this.getBounds();
		args.getBounds = function()
		{
			return bounds;
		}
		this.raiseEvent("boundsChanged", args);
	},

	onResizing: function() { return this._raiseResizeEvent() },
	onResizeEnd: function() { return this._raiseResizeEvent() },
	onDragEnd: function() { return this._raiseResizeEvent() },

	dispose: function()
	{
		//Dispose handlers
		this._makeResizeable(false);
		if (this._cropElement.parentNode) this._cropElement.parentNode.removeChild(this._cropElement);
		Telerik.Web.UI.Widgets.DraggableResizer.callBaseMethod(this, "dispose");
	},

	setVisible: function(visible)
	{
		var crop = this._cropElement;
		crop.style.display = visible ? "" : "none";

		//NEW: if makign it visible - move it to parent left & top - because parent could have been scrolledif (visible)
		{
			var offset = $telerik.getScrollOffset(crop.parentNode);
			$telerik.setLocation(crop, offset);
		}
	},

	//====================================== Getters ==============================================//
	getBounds: function()
	{
		var bounds = $telerik.getBounds(this._cropElement);
		var newBounds = this._substractParentOffsetBounds(bounds);
		//Add the parent offset
		return newBounds;
	},

	_substractParentOffsetBounds: function(bounds)
	{
		if (this._offsetLocation)
		{
			bounds.x -= this._offsetLocation.x;
			bounds.y -= this._offsetLocation.y;
		}
		return bounds;
	},

	setBounds: function(bounds)
	{
		//When we SET the bounds, we should set those without considering the parent offset - as the 0,0 is indeed relative to parent.
		$telerik.setBounds(this._cropElement, bounds);
	},

	//Event handler
	add_boundsChanged: function(handler)
	{
		this.get_events().addHandler("boundsChanged", handler);
	},

	remove_boundsChanged: function(handler)
	{
		this.get_events().removeHandler("boundsChanged", handler);
	}

}
Telerik.Web.UI.Widgets.DraggableResizer.registerClass("Telerik.Web.UI.Widgets.DraggableResizer", Telerik.Web.UI.RadWebControl);


//======================== Abstraction that will present an image ready for manipulation =======================================//
Telerik.Web.UI.Widgets.EditableImage = function(image)
{
	this._image = image;
	this.initialize();
}

Telerik.Web.UI.Widgets.EditableImage.prototype =
{
	initialize: function()
	{
		this._cropBounds = null;
		this._rotationAngle = 0;
		this._opacity = 100;
		this._flipHorizontal = false;
		this._flipVertical = false;
		this._customInitialize();
		this.reset();
	},

	//Will be different in different browsers
	_customInitialize: function()
	{
		//Set all filters to the image (TODO: the matrix filter in the future too)
		this._image.style.filter = "flipH flipV progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=100) progid:DXImageTransform.Microsoft.Matrix(M11='1.0', sizingmethod='auto expand')";
	},

	dispose: function()
	{
	},

	get_originalWidth: function()
	{
		return this._originalWidth;
	},

	get_originalHeight: function()
	{
		return this._originalHeight;
	},

	//====================================== Getters ==============================================//
	get_width: function()
	{
		//Check for offsetWidth first - otherwise might get wrong result when image is rotated
		var img = this._image;
		var val = parseInt(img.offsetWidth ? img.offsetWidth : img.style.width);
		return isNaN(val) ? 0 : val;
	},

	get_height: function()
	{
		//Check for offsetHeight first - otherwise might get wrong result when image is rotated
		var img = this._image;
		var val = parseInt(img.offsetHeight ? img.offsetHeight : img.style.height);
		return isNaN(val) ? 0 : val;
	},

	get_cropBounds: function()
	{
		return this._cropBounds;
	},

	get_rotationAngle: function()
	{
		return this._rotationAngle;
	},

	get_flipHorizontal: function()
	{
		return this._flipHorizontal;
	},

	get_flipVertical: function()
	{
		return this._flipVertical;
	},

	get_opacity: function()
	{
		return this._opacity;
	},
	//====================================== Setters =============================================//

	//Destroy all settings
	reset: function()
	{
		this.setSize("", "");
		this.flipNone();
		this.crop(null);
		this.rotate(0);
		this.set_opacity(100);

		//Set the original width and height here
		this._originalWidth = this.get_width();
		this._originalHeight = this.get_height();
	},

	//Size Can be in percents too, so we will peform no checks on validity of input
	setSize: function(width, height)
	{
		var img = this._image;

		width = parseInt(width);
		width = isNaN(width) ? "" : width + "px";

		height = parseInt(height);
		height = isNaN(height) ? "" : height + "px";

		img.style.width = width;
		img.style.height = height;
	},

	//Flip
	flipHorizontal: function(toFlip)
	{
		this._flipHorizontal = (toFlip != false); // null is considered true

		//Logical error if this code is not here - calling the public API means[e.g. flipHORIZONTAL] means we only want it horizontal, so cancel vertical!
		this._flipVertical = false;

		this._updateFlipUI();
	},

	flipVertical: function(toFlip)
	{
		this._flipVertical = (toFlip != false); // null is considered true

		//Logical error if this code is not here
		this._flipHorizontal = false;

		this._updateFlipUI();
	},

	flipBoth: function()
	{
		this._flipHorizontal = true;
		this._flipVertical = true;
		this._updateFlipUI();
	},

	flipNone: function()
	{
		this.flipHorizontal(false);
		this.flipVertical(false);
	},

	//Crop
	crop: function(bounds)
	{
		//Cropping will probably have no visual representation (although we can make it to if we want by using CSS
		//For the time being it will only keep its bounds in a variable
		if (!bounds)
		{
			bounds = new Sys.UI.Bounds(0, 0, this.get_width(), this.get_height());
		}

		this._cropBounds = bounds;
	},

	rotate: function(angle)
	{
		this._rotationAngle = angle;
		this._updateRotationUI();
	},

	set_opacity: function(value)
	{
		this._opacity = value;
		this._updateOpacityUI();
	},


	//================================ Browser dependent methods ===================================================//
	_updateFlipUI: function()
	{
		var horiz = this._flipHorizontal;
		var vertical = this._flipVertical;

		var filters = this._image.filters;

		//Moz TEMP
		if (!filters) return;

		filters.item("flipH").enabled = horiz ? 1 : 0;
		filters.item("flipV").enabled = vertical ? 1 : 0;
	},

	_updateOpacityUI: function()
	{
		var image = this._image;
		var opacity = this._opacity;

		//If IE
		var filters = image.filters;
		if (filters)
		{
			var filter = filters.item("DXImageTransform.Microsoft.Alpha");
			if (filter)
			{
				filter.opacity = opacity;
			}
		}

		//else
		var mozillaOpacity = (opacity / 100);
		image.style.opacity = mozillaOpacity;
		image.style.mozOpacity = mozillaOpacity;
	},

	_updateRotationUI: function()
	{
		var image = this._image;

		//If IE
		var filters = image.filters;
		if (filters)
		{
			var filter = filters.item("DXImageTransform.Microsoft.Matrix");
			if (filter)
			{
				//deg input defines the requested angle of rotation.
				var deg = this._rotationAngle;
				var deg2radians = Math.PI * 2 / 360;

				var rad = deg * deg2radians;
				var costheta = Math.cos(rad);
				var sintheta = Math.sin(rad);
				filter.M11 = costheta;
				filter.M12 = -sintheta;
				filter.M21 = sintheta;
				filter.M22 = costheta;
			}
		}
	}
}

Telerik.Web.UI.Widgets.EditableImage.registerClass("Telerik.Web.UI.Widgets.EditableImage", null);
</script>

<%--
/*
//======================== Abstraction that will present an image ready for manipulation =======================================//
Telerik.Web.UI.Widgets.EditableImageMozilla = function(image)
{
	Telerik.Web.UI.Widgets.EditableImageMozilla.initializeBase(this, [image]);
}


//Since it occurs that there is no easy way to implement FLIP functionality in Moz?!!!?, even with Canvas, for time being we comment this implementation
Telerik.Web.UI.Widgets.EditableImageMozilla.prototype =
{
	initialize : function()
	{
		//	Call parent
		Telerik.Web.UI.Widgets.EditableImageMozilla.callBaseMethod(this, "initialize");

		this._canvas = document.createElement("canvas");
		this._supportsCanvas = (!!this._canvas.getContext);

		if (this._supportsCanvas)
		{
			var img = this._image;
			var canvas = this._canvas;
			canvas.width = img.offsetWidth;
			canvas.height = img.offsetHeight;

			var ctx = canvas.getContext("2d");

			ctx.globalAlpha = .5;
			ctx.drawImage(img, 0, 0, img.offsetWidth, img.offsetHeight);//1, 0, i, img.offsetWidth, 1);
			img.parentNode.insertBefore(canvas, img);
			img.style.display = "none";
		}
	},

	//Will be different in different browsers
	_customInitialize : function()
	{
	   //Set all filters to the image (TODO: the matrix filter in the future too)
	   //this._image.style.filter = "flipH flipV";
	},

	dispose : function()
	{

	},

	//====================================== Getters ==============================================//
	get_width : function()
	{
	  return this._canvas.width;
	},

	get_height : function()
	{
		return this._canvas.height;
	},


	//====================================== Setters =============================================//


	//Size Can be in percents too, so we will peform no checks on validity of input
	setSize : function(width, height)
	{
		var canvas = this._canvas;
		canvas.width = width;
		canvas.height = height;
	},


	//================================ Browser dependent methods ===================================================//
	_updateFlipUI : function()
	{
		var horiz  = this._flipHorizontal;
		var vertical = this._flipVertical;

		var canvas = this._canvas;
			var ctx = canvas.getContext("2d");


	   //ctx.rotate();
	  //ctx.drawImage(img, 0, 0, img.offsetWidth, img.offsetHeight);//1, 0, i, img.offsetWidth, 1);
	}
}


Telerik.Web.UI.Widgets.EditableImageMozilla.registerClass('Telerik.Web.UI.Widgets.EditableImageMozilla', Telerik.Web.UI.Widgets.EditableImage);
*/--%>

<style type="text/css">
	body
	{
		background: #f5f5f4;
	}

	fieldset
	{
	  margin: 1px;
	}

	/*NEW TEKI*/
	.reDraggableResizer
	{
		border: dashed 1px #bb0000;
		width: 100px;
		height:100px;
		line-height: 1px;
	}

	.reDraggableResizer .resizerHandle
	{
		background: #cc0000;
		width: 6px !important;
		height: 6px !important;
		font-size: 6px;
		line-height:6px;
	}

/* Image Editor Dialog */
</style>
<table id="dialogControl" cellpadding="0" cellspacing="0" class="reDialog ImageEditor">
	<tr>
		<td style="width: 470px; vertical-align: middle; text-align:center;">
				<div id="ImageEditorPane" style="position:relative;width: 454px; height: 454px; overflow: auto; border: solid 1px #828282; background-color: white; text-align: left;">&nbsp;</div>
		</td>
		<td style="padding-left: 4px; vertical-align: top;">
			<telerik:RadAjaxPanel ID="imageSettings" runat="server">
				<input type="hidden" id="imageData" name="imageData" />
			</telerik:RadAjaxPanel>
			<fieldset style="width: 322px">
				<legend><script type="text/javascript">document.write(localization["Opacity"]);</script></legend>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<label class="propertyLabel" style="width: 50px; text-align: left; padding-left: 4px;"
								for="opacityInput">
								<script type="text/javascript">document.write(localization["Opacity"]);</script>:</label>
						</td>
						<td>
							<div style="margin-top: 4px;">
								<telerik:RadSlider ID="opacitySlider" runat="server" Width="200" MinimumValue="0"
									MaximumValue="100" Value="100" SmallChange="1" />
							</div>
						</td>
						<td>
							<input id="opacityInput" value="100" type="text" readonly="readonly" style="width: 20px;
								text-align: right;" />
							%
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset style="width: 322px">
				<legend><script type="text/javascript">document.write(localization["Resize"]);</script></legend>
				<table border="0" cellpadding="0" cellspacing="0" class="FlipTable">
					<tr>
						<td>
							<label class="propertyLabel" style="width: 50px; text-align: left; padding-left: 4px;"
								for="currentWidthInput">
								<script type="text/javascript">document.write(localization["Width"]);</script>:</label>
						</td>
						<td>
							<div style="margin-top: 4px;">
								<telerik:RadSlider ID="widthSlider" runat="server" Width="200" MinimumValue="0"
									SmallChange="1" />
							</div>
						</td>
						<td>
							<input id="currentWidthInput" type="text" readonly="readonly" style="width: 30px;
								text-align: right;" />
							px
						</td>
					</tr>
					<tr>
						<td>
							<label class="propertyLabel" style="width: 50px; text-align: left; padding-left: 4px;"
								for="currentHeightInput">
								<script type="text/javascript">document.write(localization["Height"]);</script>:</label>
						</td>
						<td>
							<div style="margin-top: 4px;">
								<telerik:RadSlider ID="heightSlider" runat="server" Width="200" MinimumValue="0"
									SmallChange="1" />
							</div>
						</td>
						<td>
							<input id="currentHeightInput" type="text" readonly="readonly" style="width: 30px;
								text-align: right;" />
							px
						</td>
					</tr>
					<tr>
						<td colspan="3" style="padding-left: 8px;">
							<input type="checkbox" id="ConstrainProportionsCheckBox" checked="checked" style="border: 0" /><label
								for="ConstrainProportionsCheckBox"><script type="text/javascript">document.write(localization["ConstrainProportions"]);</script></label>
						</td>
					</tr>
				</table>
			</fieldset>

				<table cellpadding="0" cellspacing="0">
					<tr>
						<td style="vertical-align: top;">
							<fieldset style="width: 155px;">
								<legend>
									<script type="text/javascript">
										document.write(localization["Flip"]);
									</script>
								</legend>
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<input checked="checked" type="radio" name="flipRadio" id="FlipNone"/>
											<label for="FlipNone">
												<script type="text/javascript">
													document.write(localization["None"]);
												</script>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="flipRadio" id="FlipHorizontal" />
											<label for="FlipHorizontal">
												<script type="text/javascript">
													document.write(localization["FlipHorizontal"]);
												</script>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="flipRadio" id="FlipVertical" />
											<label for="FlipVertical">
												<script type="text/javascript">
													document.write(localization["FlipVertical"]);
												</script>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="flipRadio" id="FlipBoth" />
											<label for="FlipBoth">
												<script type="text/javascript">
													document.write(localization["FlipBoth"]);
												</script>
											</label>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
						<td style="vertical-align: top;">
							<fieldset style="width: 156px;">
								<legend>
									<script type="text/javascript">
										document.write(localization["Rotate"]);
									</script>
								</legend>
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<input checked="checked" type="radio" name="rotateRadio" id="RotateNone" />
											<label for="RotateNone">
												<script type="text/javascript">
													document.write(localization["None"]);
												</script>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="rotateRadio" id="Rotate90" />
											<label for="Rotate90">
												90&deg;
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="rotateRadio" id="Rotate180" />
											<label for="Rotate180">
												180&deg;
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" name="rotateRadio" id="Rotate270" />
											<label for="Rotate270">
												270&deg;
											</label>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>
				</table>

			<fieldset style="width: 322px;">
				<legend>
					<script type="text/javascript">
						document.write(localization["Crop"]);
					</script>
				</legend>
				<table cellpadding="0" cellspacing="0" style="width: 100%;">
					<tr>
						<td>
							<label for="CropX" style="margin-right: 4px;">
								x: <input disabled="disabled" type="text" id="CropX" style="width: 35px;" /> px
							</label>
						</td>
						<td>
							<label for="CropWidth"><script type="text/javascript">
								document.write(localization["Width"]);
							</script>:
							<input disabled="disabled" type="text" id="CropWidth" style="margin-left: 5px; width: 35px;" /> px</label>
						</td>
						<td rowspan="2"  style="vertical-align: middle;">
							<button id="ToggleCrop" title="Enable Crop">
								<script type="text/javascript">
									setInnerHtml("ToggleCrop", localization["EnableCrop"]);
								</script>
							</button>
						</td>
					</tr>
					<tr>
						<td>
							<label for="CropY" style="margin-right: 4px;">
								y: <input disabled="disabled" type="text" id="CropY" style="width: 35px;" /> px</label>
						</td>
						<td>
							<label for="CropHeight" style="margin-right: 10px;">
								<script type="text/javascript">
									document.write(localization["Height"]);
								</script>:
								<input disabled="disabled" type="text" id="CropHeight" style="width: 35px;" /> px
							</label>
						</td>
					</tr>
				</table>
			</fieldset>
			<table cellpadding="0" cellspacing="0" style="margin-top: 4px;">
				<tr>
					<td>
						<button type="button" id="ResetImageEditor" style="width: 329px;">
							<script type="text/javascript">
								setInnerHtml("ResetImageEditor", localization["RestoreImage"]);
							</script>
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="OriginalImageLocation" name="OriginalImageLocation" />
						<div style="padding: 4px 0">
							<label for="NewImageName">
								<script type="text/javascript">
									document.write(localization["SaveAs"]);
								</script>
							</label><br />
							<input type="text" id="NewImageName" name="NewImageName" style="margin-left: 4px; width: 260px;" /><span id="NewImageExt">&nbsp;</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="reInfoLabel" style="width: 315px;">
							<input checked="checked" type="checkbox" id="OverwriteExistingCheckBox" /><label for="OverwriteExistingCheckBox">
								<script type="text/javascript">document.write(localization["OverwriteExisting"]);</script></label>
						</div>
					</td>
				</tr>
			</table>
			<table cellpadding="0" cellspacing="0" style="width: 100%;">
				<tr>
					<td class="reBottomcell" style="padding-top: 20px;">
						<table border="0">
							<tr>
								<td style="padding-right: 4px;">
									<button type="button" id="saveThumbnail" style="width: 100px;">
										<script type="text/javascript">
											setInnerHtml("saveThumbnail", localization["Save"]);
										</script>
									</button>
								</td>
								<td>
									<button type="button" id="CancelButton" onclick="Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();" style="width: 100px;">
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