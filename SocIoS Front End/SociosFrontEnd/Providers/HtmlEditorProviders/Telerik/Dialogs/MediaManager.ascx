<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
	Type.registerNamespace("Telerik.Web.UI.Widgets");

	Telerik.Web.UI.Widgets.MediaPreviewer = function(element)
	{
		Telerik.Web.UI.Widgets.MediaPreviewer.initializeBase(this, [element]);
		this._currentItem = null;
		this._properties = null;

		this._tab = null;
		this._multiPage = null;
		this._tabClickDelegate = null;

		this._classIdCheckBox = null;
		this._classIDText = null;
		this._classIDLi = null;
		this._mediaWidth = null;
		this._mediaHeight = null;
		this._mediaAlign = null;
		this._mediaProperties = null;
		this._propertyValuePane = null;
		this._propertyValueDescription = null;
		this._propertyElementsWithHandlers = new Array();

		this._localization = {
			Description: "",
			AllowChangeDisplaySize: "This property specifies or retrieves a value indicating whether the display size can be changed.",
			AllowScan: "This property specifies or retrieves a value indicating whether scanning is enabled for files that support scanning (fast-forwarding and rewinding).",
			AnimationAtStart: "This property specifies or retrieves a value indicating whether animation runs before the first image displays.",
			AudioStream: "This property specifies or retrieves the stream number of the current audio stream.",
			AutoRewind: "This property specifies or retrieves a value indicating whether the Windows Media Player control automatically returns to the clip's starting point after the clip finishes playing or has otherwise stopped.",
			AutoSize: "This property specifies or retrieves a value indicating whether the Windows Media Player control automatically resizes to accommodate the current media item at the size specified by the DisplaySize property.",
			AutoStart: "This property specifies or retrieves a value indicating whether to start playing the clip automatically.",
			Balance: "This property specifies or retrieves a value indicating the stereo balance.",
			CCActive: "This property specifies or retrieves a value indicating whether closed captioning is on or off.",
			ClickToPlay: "This property specifies or retrieves a value indicating whether the user can toggle playback on and off by clicking the video image.",
			ColorKey: "This property specifies or retrieves the color key being used by the DVD playback.",
			CurrentAngle: "This property specifies or retrieves a number identifying the current camera angle.",
			CurrentAudioStream: "This property specifies or retrieves a value indicating the current audio stream.",
			CurrentCCService: "This property specifies or retrieves a value indicating the current closed captioning service.",
			CurrentMarker: "This property specifies or retrieves the current marker number.",
			CurrentPosition: "This property specifies or retrieves the clip's current position, in seconds.",
			CurrentSubpictureStream: "This property specifies or retrieves a value indicating the current subpicture stream.",
			CursorType: "This property specifies or retrieves a value indicating the current subpicture stream.",
			DefaultFrame: "This property specifies or retrieves a value representing the default target HTTP frame.",
			DisplayBackColor: "This property specifies or retrieves the background color of the display panel.",
			DisplayForeColor: "This property specifies or retrieves the foreground color of the display panel.",
			DisplayMode: "This property specifies or retrieves a value indicating whether the status bar displays the current position in seconds (Yes) or frames (No).",
			DisplaySize: "This property specifies or retrieves the size of the image display window.",
			EnableContextMenu: "This property specifies or retrieves a value indicating whether the context menu appears when the user clicks the right mouse button.",
			Enabled: "This property specifies or retrieves a value indicating whether the Windows Media Player control is enabled.",
			EnableFullScreenControls: "This property specifies or retrieves a value indicating whether Windows Media Player displays controls in full-screen mode.",
			EnablePositionControls: "This property specifies or retrieves a value indicating whether the position controls are enabled on the control bar.",
			EnableTracker: "This property specifies or retrieves a value indicating whether the trackbar control is enabled.",
			Hidden: "This property specifies or retrieves a value indicating whether the player is visible in the browser.",
			InvokeURLs: "This property specifies or retrieves a value indicating whether the Windows Media Player control automatically invokes URLs in a browser (URL flipping).",
			Language: "This property specifies or retrieves a value indicating the current locale used for national language support.",
			Mute: "This property specifies or retrieves the current mute state of the Windows Media Player control.",
			PlayCount: "This property specifies or retrieves the number of times a clip plays.",
			PreviewMode: "This property specifies or retrieves a value indicating whether Windows Media Player is in preview mode.",
			Rate: "This property specifies or retrieves the playback rate of the clip.",
			SelectionEnd: "This property specifies or retrieves the time within the current clip at which playback will stop. This property cannot be set or retrieved until the ReadyState property (read-only) has a value of 4.",
			SelectionStart: "This property specifies or retrieves the time within the current clip at which playback will begin.",
			SendErrorEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends error events.",
			SendKeyboardEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends keyboard events.",
			SendMouseClickEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends mouse click events.",
			SendMouseMoveEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends mouse move events.",
			SendOpenStateChangeEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends open state change events.",
			SendPlayStateChangeEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends play state change events.",
			SendWarningEvents: "This property specifies or retrieves a value indicating whether the Windows Media Player control sends warning events.",
			ShowAudioControls: "This property specifies or retrieves a value indicating whether the audio controls appear on the control bar.",
			ShowCaptioning: "This property specifies or retrieves a value indicating whether the closed caption area is visible and closed captioning is enabled.",
			ShowControls: "This property specifies or retrieves a value indicating whether the control bar is visible.",
			ShowDisplay: "This property specifies or retrieves a value indicating whether the display panel is visible.",
			ShowGotoBar: "This property specifies or retrieves a value indicating whether the Go To bar is visible.",
			ShowPositionControls: "This property specifies or retrieves a value indicating whether the position controls appear on the control bar.",
			ShowStatusBar: "This property specifies or retrieves a value indicating whether the status bar is visible.",
			ShowTracker: "This property specifies or retrieves a value indicating whether the trackbar is visible.",
			SubpictureOn: "This property specifies or retrieves a value indicating whether the subpicture is displayed.",
			TransparentAtStart: "This property specifies or retrieves a value indicating whether the Windows Media Player control is transparent before play begins and after play ends",
			VideoBorder3D: "This property specifies or retrieves a value indicating whether the three-dimensional video border effect is enabled.",
			VideoBorderColor: "This property specifies or retrieves the color of the video border.",
			VideoBorderWidth: "This property specifies or retrieves the width of the video border, in pixels.",
			Volume: "This property specifies or retrieves the volume, in hundredths of decibels.",
			Yes: "Yes",
			No: "No",
			None: "None",
			DefaultCaption1: "Default. Caption1",
			Caption2: "Caption2",
			Text1: "Text1",
			Text2: "Text2",
			ExtendedDataServices: "Extended Data Services (XDS)",
			Arrowhourglass: "Standard arrow and small hourglass",
			Standardarrow: "Standard arrow",
			Crosshair: "Crosshair",
			TextIbeam: "Text I-beam",
			SlashedCircle: "Slashed circle",
			Fourpointedarrow: "Four-pointed arrow",
			DoublepointedNESW: "Double-pointed arrow NE-SW",
			DoublepointedNS: "Double-pointed arrow N-S",
			DoublepointedNWSE: "Double-pointed arrow NW-SE",
			DoublepointedWE: "Double-pointed arrow pointing W-E",
			Verticalarrow: "Vertical arrow",
			Hourglass: "Hourglass",
			Handpointing: "Hand with pointing index finger",
			NoColor: "No Color",
			Black: "Black",
			Blue: "Blue",
			Green: "Green",
			Orange: "Orange",
			Red: "Red",
			White: "White",
			Yellow: "Yellow",
			Custom: "Custom",
			Samesize: "Same size as the source image",
			HalfSourceImage: "W and H are one-half of the source image",
			DoubleSourceImage: "Double the dimensions of the source image",
			EntireScreen: "Size of the entire screen",
			DesignTime: "Size specified at design time",
			SixteenthScreen: "One-sixteenth the size of the screen",
			QuarterScreen: "One-quarter the size of the screen",
			HalfScreen: "Half the size of the screen",
			NA: "",
			Note: "Note: ",
			ValidateNumber: "Please, enter only numeric values.",
			ValidateNumber10000: "Please, enter a value ranging from -10,000 to 10,000.",
			ValidateNumberHex: "Please, specify a hexadecimal value.",
			ValidateAudio: "Please, enter a value ranging from zero to seven indicating the current audio stream, or 0xFFFFFFFF if no stream is selected.",
			ValidateLCID: "Please, specify a numeric value that corresponds to an LCID identifying a locale for national language support.",
			ValidateNumber10: "Please, enter a value ranging from -10.00 to 10.00.",
			Nosubpicturestream: "There is no subpicture stream",
			Customh: "Custom - ",
			AlertValue: "Please, provide valid property value!"
		};
	}

	Telerik.Web.UI.Widgets.MediaPreviewer.prototype = {
		initialize: function()
		{
			Telerik.Web.UI.Widgets.MediaPreviewer.callBaseMethod(this, "initialize");
			this._initializeChildren();
			this._initializeChildEvents();
		},

		_initializeChildren: function()
		{
			this._tab = $find("mediaTabStrip");
			this._multiPage = $find("mediaMultiPage");

			this._classIdCheckBox = $get("ClassID");
			this._classIDText = $get("ClassIDText");
			this._classIDLi = $get("ClassIDLi");
			this._mediaWidth = $get("mediaWidth");
			this._mediaHeight = $get("mediaHeight");
			this._mediaAlign = $get("mediaAlign");
			this._mediaProperties = $get("mediaProperties");
			this._propertyValuePane = $get("propertyValuePane");
			this._propertyValueDescription = $get("propertyValueDescription");
		},

		_initializeChildEvents: function()
		{
			this._tabClickDelegate = Function.createDelegate(this, this._tabClickHandler);
			this._tab.add_tabSelecting(this._tabClickDelegate);
			$addHandlers(this._classIdCheckBox, { "click": this._classIdClickHandler }, this);
			$addHandlers(this._mediaProperties, { "change": this._propertyChangeHandler }, this);
		},

		_tabClickHandler: function(sender, args)
		{
			if (!this._currentItem)
			{
				args.set_cancel(true);
				return;
			}
			var buttonValue = args.get_tab().get_value();
			var previewElement = this._multiPage.findPageViewByID("previewPage").get_element();
			switch (buttonValue)
			{
				case "Properties":
					previewElement.innerHTML = "";
					break;
				case "Preview":
					previewElement.innerHTML = this._createMediaElement();
					break;
				default:
					break;
			}

		},

		_classIdClickHandler: function(e)
		{
			if (this._classIdCheckBox.checked)
			{
				this._classIDLi.style.display = "";
			}
			else
			{
				this._classIDLi.style.display = "none";
			}
		},

		_propertyChangeHandler: function(e)
		{
			this._clearPropertyElementsHandlers();
			this._propertyValuePane.innerHTML = "";
			this._propertyValuePane.style.display = "none";
			this._changeProperty(this._mediaProperties.value);
		},

		_getParams: function(element)
		{
			var params = {};
			if (element == "object")
			{
				//this is used by older versions of the WMP plug-in
				//params["Filename"] = this._currentItem.get_url();
				params["URL"] = this._currentItem.get_url();
			}
			else
			{
				params["src"] = this._currentItem.get_url();
				if (isNaN(parseInt(this._mediaWidth.value, 10)) || parseInt(this._mediaWidth.value, 10).toString() != this._mediaWidth.value)
				{
					this._mediaWidth.value = "150";
				}
				params["width"] = this._mediaWidth.value;
				if (isNaN(parseInt(this._mediaHeight.value, 10)) || parseInt(this._mediaHeight.value, 10).toString() != this._mediaHeight.value)
				{
					this._mediaHeight.value = "150";
				}
				params["height"] = this._mediaHeight.value;
				if (this._currentItem.get_extension() == ".qt")
				{
					params["type"] = "movie/quicktime";
					params["pluginspage"] = "http://www.apple.com/quicktime/download";
				}
				else
				{
					params["type"] = "application/x-mplayer2";
					params["pluginspage"] = "http://www.microsoft.com/Windows/MediaPlayer";
				}
			}
			if (this._mediaAlign.value && this._mediaAlign.value.toLowerCase() != "baseline")
				params["align"] = this._mediaAlign.value;
			var properties = this._getProperties();
			for (var property in properties)
			{
				var item = properties[property];
				if (item[1] != null)
				{
					params[property] = item[1];
				}
			}
			return params;
		},

		_getObjectAttributes: function()
		{
			var objectParams = {};
			if (this._classIdCheckBox.checked && this._classIDText.value && this._classIDText.value.length > 0)
			{
				objectParams["classid"] = this._classIDText.value;
			}
			else
			{
				objectParams["classid"] = "clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6";
			}

			if (isNaN(parseInt(this._mediaWidth.value, 10)) || parseInt(this._mediaWidth.value, 10).toString() != this._mediaWidth.value)
			{
				this._mediaWidth.value = "150";
			}
			objectParams["width"] = this._mediaWidth.value;
			if (isNaN(parseInt(this._mediaHeight.value, 10)) || parseInt(this._mediaHeight.value, 10).toString() != this._mediaHeight.value)
			{
				this._mediaHeight.value = "150";
			}
			objectParams["height"] = this._mediaHeight.value;

			if (this._mediaAlign.value && this._mediaAlign.value.toLowerCase() != "baseline")
			{
				objectParams["align"] = this._mediaAlign.value;
			}
			objectParams["type"] = "application/x-oleobject";

			return objectParams;

			//if (this._currentItem.extension == ".qt")
			//{
			//	objectParams["type"] = "movie/quicktime";
			//}
			//else
			//{
			//	objectParams["type"] = "application/x-mplayer2";
			//}
		},

		_createMediaElement: function()
		{
			var sb = new Sys.StringBuilder("");
			sb.append("<object");

			//set object attributes
			var objArguments = this._getObjectAttributes();
			for (var argument in objArguments)
			{
				sb.append(String.format(" {0}=\"{1}\"", argument, objArguments[argument]));
			}
			sb.append(">");

			//set object params
			var params = this._getParams("object");
			for (var member in params)
			{
				sb.append(String.format("<param name=\"{0}\" value=\"{1}\">", member, params[member]));
			}

			//set embed attributes
			sb.append("<embed");
			params = this._getParams("embed");
			for (var member in params)
			{
				sb.append(String.format(" {0}=\"{1}\"", member, params[member]));
			}
			sb.append("></embed>");


			sb.append("</object>");

			return sb.toString();
		},

		_setInitialValues: function()
		{
			this._classIDLi.style.display = "none";
			this._classIdCheckBox.checked = false;
			var previewElement = this._multiPage.findPageViewByID("previewPage").get_element();
			previewElement.innerHTML = "";

			this._propertyValuePane.innerHTML = "";
			this._propertyValuePane.style.display = "none";
			this._propertyValueDescription.innerHTML = this._localization.NA;
			this._clearPropertyElementsHandlers();

			this._classIDText.value = "";
			this._mediaWidth.value = "150";
			this._mediaHeight.value = "150";
			this._mediaAlign.selectedIndex = 0;
			this._mediaProperties.selectedIndex = 0;
		},

		setItem: function(item)
		{
			this._setInitialValues();

			if (item.get_type() == Telerik.Web.UI.FileExplorerItemType.Directory)
			{
				this._currentItem = null;
			}
			else
			{
				this._currentItem = item;
				this._tab.set_selectedIndex(1);
			}
		},

		getResult: function()
		{
			if (this._currentItem && this._currentItem.get_type() == Telerik.Web.UI.FileExplorerItemType.File)
			{
				return this._createMediaElement();
			}
			return null;
		},

		populateObjectProperties: function(selectedObject)
		{
			//WARNING: Currently tested only in IE7:
			if (selectedObject.object)
			{
				if (selectedObject.classid)
				{
					this._classIdCheckBox.click();
					this._classIDText.value = selectedObject.classid;
				}
				this._mediaWidth.value = (selectedObject.width) ? parseInt(selectedObject.width).toString() : "";
				this._mediaHeight.value = (selectedObject.height) ? parseInt(selectedObject.height).toString() : "";
				this._selectOptionByValue(this._mediaAlign, selectedObject.align, false, 0);
				//TODO:Populate the properties also!
			}
		},

		_getProperties: function()
		{
			if (!this._properties)
			{
				this._properties = {
					"AllowChangeDisplaySize": new Array(this._localization.AllowChangeDisplaySize, null, "radio", "boolean", "true"),
					"AllowScan": new Array(this._localization.AllowScan, null, "radio", "boolean", "true"),
					"AnimationAtStart": new Array(this._localization.AnimationAtStart, null, "radio", "boolean", "true"),
					"AudioStream": new Array(this._localization.AudioStream, null, "text-regexp", "^[0-9]*$", this._localization.ValidateNumber, ""),
					"AutoRewind": new Array(this._localization.AutoRewind, null, "radio", "boolean", "true"),
					"AutoSize": new Array(this._localization.AutoSize, null, "radio", "boolean", ""),
					"AutoStart": new Array(this._localization.AutoStart, null, "radio", "boolean", "true"),
					"Balance": new Array(this._localization.Balance, null, "text-range", "({text} >= -10000) && ({text} <= 10000)", this._localization.ValidateNumber10000, 0),
					"CCActive": new Array(this._localization.CCActive, null, "radio", "boolean", "false"),
					"ClickToPlay": new Array(this._localization.ClickToPlay, null, "radio", "boolean", "true"),
					"ColorKey": new Array(this._localization.ColorKey, null, "text", "", this._localization.ValidateNumberHex, ""),
					"CurrentAngle": new Array(this._localization.CurrentAngle, null, "select-range", 1, 9, 1),
					"CurrentAudioStream": new Array(this._localization.CurrentAudioStream, null, "text-range", "((({text} >= 0) && ({text} <= 7)) || ({text} == '0xFFFFFFFF'))", this._localization.ValidateAudio, 0),
					"CurrentCCService": new Array(this._localization.CurrentCCService, null, "select", new Array(0, 1, 2, 3, 4, 5), new Array(this._localization.None, this._localization.DefaultCaption1, this._localization.Caption2, this._localization.Text1, this._localization.Text2, this._localization.ExtendedDataServices), 0),
					"CurrentMarker": new Array(this._localization.CurrentMarker, null, "text-regexp", "^[0-9]*$", this._localization.ValidateNumber, 0),
					"CurrentPosition": new Array(this._localization.CurrentPosition, null, "text-regexp", "^[0-9]*$", this._localization.ValidateNumber, ""),
					"CurrentSubpictureStream": new Array(this._localization.CurrentSubpictureStream, null, "select-special", new Array(this._localization.Streamisvalid, "range", 0, 31), new Array(this._localization.Nosubpicturestream, "value", 63), 0),
					"CursorType": new Array(this._localization.CursorType, null, "select", new Array(32650, 32512, 32515, 32513, 32648, 32646, 32643, 32645, 32642, 32644, 32516, 32514, 1), new Array(this._localization.Arrowhourglass, this._localization.Standardarrow, this._localization.Crosshair, this._localization.TextIbeam, this._localization.SlashedCircle, this._localization.Fourpointedarrow, this._localization.DoublepointedNESW, this._localization.DoublepointedNS, this._localization.DoublepointedNWSE, this._localization.DoublepointedWE, this._localization.Verticalarrow, this._localization.Hourglass, this._localization.Handpointing), ""),
					"DefaultFrame": new Array(this._localization.DefaultFrame, null, "text", "", "", ""),
					"DisplayBackColor": new Array(this._localization.DisplayBackColor, null, "select-color", 0xFFFFFF),
					"DisplayForeColor": new Array(this._localization.DisplayForeColor, null, "select-color", 0xFFFFFF),
					"DisplayMode": new Array(this._localization.DisplayMode, null, "radio", "integer", 0),
					"DisplaySize": new Array(this._localization.DisplaySize, null, "select", new Array(0, 1, 2, 3, 4, 5, 6, 7), new Array(this._localization.Samesize, this._localization.HalfSourceImage, this._localization.DoubleSourceImage, this._localization.EntireScreen, this._localization.DesignTime, this._localization.SixteenthScreen, this._localization.QuarterScreen, this._localization.HalfScreen), ""),
					"EnableContextMenu": new Array(this._localization.EnableContextMenu, null, "radio", "boolean", "true"),
					"Enabled": new Array(this._localization.Enabled, null, "radio", "boolean", "true"),
					"EnableFullScreenControls": new Array(this._localization.EnableFullScreenControls, null, "radio", "boolean", "true"),
					"EnablePositionControls": new Array(this._localization.EnablePositionControls, null, "radio", "boolean", "true"),
					"EnableTracker": new Array(this._localization.EnableTracker, null, "radio", "boolean", "true"),
					"Hidden": new Array(this._localization.Hidden, null, "radio", "boolean", "false"),
					"InvokeURLs": new Array(this._localization.InvokeURLs, null, "radio", "boolean", "true"),
					"Language": new Array(this._localization.Language, null, "text-regexp", "^[0-9]*$", this._localization.ValidateLCID, ""),
					"Mute": new Array(this._localization.Mute, null, "radio", "boolean", "true"),
					"PlayCount": new Array(this._localization.PlayCount, null, "text-regexp", "^[0-9]*$", this._localization.ValidateNumber, 1),
					"PreviewMode": new Array(this._localization.PreviewMode, null, "radio", "boolean", "false"),
					"Rate": new Array(this._localization.Rate, null, "text-range", "({text} >= -10) && ({text} <= 10)", this._localization.ValidateNumber10, 1.0),
					"SelectionEnd": new Array(this._localization.SelectionEnd, null, "text-range", "((({text} >= Number.MIN_VALUE) && ({text} <= Number.MAX_VALUE)) || ({text} == ''))", this._localization.ValidateNumber, ""),
					"SelectionStart": new Array(this._localization.SelectionStart, null, "text-range", "({text} >= Number.MIN_VALUE) && ({text} <= Number.MAX_VALUE)", this._localization.ValidateNumber, 0),
					"SendErrorEvents": new Array(this._localization.SendErrorEvents, null, "radio", "boolean", "true"),
					"SendKeyboardEvents": new Array(this._localization.SendKeyboardEvents, null, "radio", "boolean", "false"),
					"SendMouseClickEvents": new Array(this._localization.SendMouseClickEvents, null, "radio", "boolean", "false"),
					"SendMouseMoveEvents": new Array(this._localization.SendMouseMoveEvents, null, "radio", "boolean", "false"),
					"SendOpenStateChangeEvents": new Array(this._localization.SendOpenStateChangeEvents, null, "radio", "boolean", "true"),
					"SendPlayStateChangeEvents": new Array(this._localization.SendPlayStateChangeEvents, null, "radio", "boolean", "true"),
					"SendWarningEvents": new Array(this._localization.SendWarningEvents, null, "radio", "boolean", "true"),
					"ShowAudioControls": new Array(this._localization.ShowAudioControls, null, "radio", "boolean", "true"),
					"ShowCaptioning": new Array(this._localization.ShowCaptioning, null, "radio", "boolean", "false"),
					"ShowControls": new Array(this._localization.ShowControls, null, "radio", "boolean", "true"),
					"ShowDisplay": new Array(this._localization.ShowDisplay, null, "radio", "boolean", "false"),
					"ShowGotoBar": new Array(this._localization.ShowGotoBar, null, "radio", "boolean", "false"),
					"ShowPositionControls": new Array(this._localization.ShowPositionControls, null, "radio", "boolean", "true"),
					"ShowStatusBar": new Array(this._localization.ShowStatusBar, null, "radio", "boolean", "false"),
					"ShowTracker": new Array(this._localization.ShowTracker, null, "radio", "boolean", "true"),
					"SubpictureOn": new Array(this._localization.SubpictureOn, null, "radio", "boolean", ""),
					"TransparentAtStart": new Array(this._localization.TransparentAtStart, null, "radio", "boolean", "false"),
					"VideoBorder3D": new Array(this._localization.VideoBorder3D, null, "radio", "boolean", "false"),
					"VideoBorderColor": new Array(this._localization.VideoBorderColor, null, "select-color", 0x000000),
					"VideoBorderWidth": new Array(this._localization.VideoBorderWidth, null, "text-regexp", "^[0-9]*$", this._localization.ValidateNumber, 0),
					"Volume": new Array(this._localization.Volume, null, "text-range", "({text} >= -10000) && ({text} <= 10000)", this._localization.ValidateNumber10000, -600)
				};

			}
			return this._properties;
		},

		_createText: function(textValue)
		{
			var textBox = document.createElement("INPUT");
			this._propertyElementsWithHandlers.push(textBox);
			$addHandlers(textBox, { "keydown": this._changeTextHandler, "blur": this._validateTextHandler }, this);

			textBox.id = "textProperty";
			textBox.type = "text";
			textBox.value = textValue;
			textBox.style.width = '140px';
			//textBox.className = "flatTextBox";
			return textBox;
		},

		_changeTextHandler: function(e)
		{
			var thisObject = this;
			var control = e.target;
			window.setTimeout(function()
			{
				thisObject._changeValue(control);
			}, 100);
			return true;
		},

		_validateTextHandler: function(e)
		{
			var control = e.target;

			var item = this._getProperties()[this._mediaProperties.value];
			var expression = item[3];
			var isRegExp = (item[2] == "text-regexp") ? true : false;

			try
			{
				if (isRegExp)
				{
					var re = new RegExp(expression, "gi");
					if (re.test(control.value))
					{
						return true;
					}
				}
				else if (expression == "")
				{
					return true;
				}
				else if (eval(expression.replace(/\{text\}/gi, control.value)))
				{
					return true;
				}
			} catch (e) { };
			alert(this._localization.AlertValue);
			control.focus();
			return false;
		},

		_createRadio: function(id, radioValue, defaultValue)
		{
			var radioBox;

			if ($telerik.isIE)
			{
				radioBox = document.createElement("<INPUT TYPE='radio' NAME='booleanGroup'" + ((radioValue == defaultValue.toString()) ? " CHECKED" : "") + ">");
			}
			else
			{
				radioBox = document.createElement("INPUT");
				radioBox.type = "radio";
				radioBox.name = "booleanGroup";
				if (radioValue == defaultValue.toString())
				{
					radioBox.setAttribute("checked", true);
				}
			}
			this._propertyElementsWithHandlers.push(radioBox);
			$addHandlers(radioBox, { "click": this._changeValueHandler }, this);

			radioBox.id = id;
			radioBox.value = radioValue;

			return radioBox;
		},

		_createLabel: function(controlID, labelText)
		{
			var label = document.createElement("LABEL");
			label.htmlFor = controlID;
			label.innerHTML = labelText;
			return label;
		},

		_convertColor: function(color)
		{
			color = parseInt(color);
			color = color.toString(16);
			if (color.length < 6)
			{
				var sTempString = "000000".substring(0, (6 - color.length));
				color = "#" + sTempString.concat(color).toUpperCase();
			}
			else
			{
				color = "#" + color.toUpperCase();
			}
			return color;
		},

		_selectOption: function(control, value)
		{
			var selectStatus = false;
			if ((value != null) && (value.toString() != ""))
			{
				var options = control.getElementsByTagName("OPTION");
				for (var i = 0; i < options.length; i++)
				{
					if (options[i].value.toString().toUpperCase() == value.toString().toUpperCase())
					{
						try
						{
							options[i].selected = true;
						}
						catch (exc) { }
						selectStatus = true;
						break;
					}
				}
			}
			else
			{
				control.selectedIndex = 0;
			}
			return selectStatus;
		},

		_changeValueHandler: function(e)
		{
			this._changeValue(e.target);
		},

		_changeColorHandler: function(e)
		{
			var control = e.target;

			if (control.value == "")
			{
				//TODO: Open ColorPicker.
			}
			this._changeValue(e.target);
		},

		_changeValue: function(control)
		{
			var item = this._getProperties()[this._mediaProperties.value];
			item[1] = control.value;
		},

		_changeProperty: function(propValue)
		{
			var item = this._getProperties()[propValue];
			if (propValue != "")
			{
				this._propertyValueDescription.innerHTML = this._localization.Description + item[0];
				switch (item[2])
				{
					case "radio":
						var defaultValue = ((item[1] == null) ? item[4] : item[1]);
						switch (item[3])
						{
							case "boolean":
								var values = new Array("true", "false");
								var texts = new Array(this._localization.Yes, this._localization.No);
								break;
							case "integer":
								var values = new Array(0, 1);
								var texts = new Array(this._localization.Yes, this._localization.No);
								break;
						}
						for (var i = 0; i < values.length; i++)
						{
							var div = document.createElement("DIV");
							div.appendChild(this._createRadio("booleanGroup" + i, values[i], defaultValue));
							div.appendChild(this._createLabel("booleanGroup" + i, texts[i]));
							this._propertyValuePane.appendChild(div);
						}
						break;
					case "select":
						var defaultValue = (item[1] == null) ? item[5] : item[1];
						var select = document.createElement("SELECT");
						this._propertyElementsWithHandlers.push(select);
						$addHandlers(select, { "change": this._changeValueHandler }, this);
						var values = item[3];
						var texts = item[4];
						for (var i = 0; i < values.length; i++)
						{
							var option = document.createElement("OPTION");
							option.innerHTML = texts[i];
							option.value = values[i];
							select.appendChild(option);
						}
						this._selectOption(select, defaultValue);
						this._propertyValuePane.appendChild(select);
						break;
					case "select-range":
						var defaultValue = ((item[1] == null) ? item[5] : item[1]);
						var select = document.createElement("SELECT");
						this._propertyElementsWithHandlers.push(select);
						$addHandlers(select, { "change": this._changeValueHandler }, this);
						for (var i = item[3]; i <= item[4]; i++)
						{
							var option = document.createElement("OPTION");
							option.innerHTML = i;
							option.value = i;
							select.appendChild(option);
						}
						this._selectOption(select, defaultValue);
						this._propertyValuePane.appendChild(select);
						break;
					case "select-special":
						var defaultValue = (item[1] == null) ? item[5] : item[1];
						var select = document.createElement("SELECT");
						this._propertyElementsWithHandlers.push(select);
						$addHandlers(select, { "change": this._changeValueHandler }, this);
						for (var i = 3; i < (item.length - 1); i++)
						{
							var optGroup = document.createElement("OPTGROUP");
							optGroup.label = item[i][0];
							select.appendChild(optGroup);
							switch (item[i][1])
							{
								case "range":
									for (var j = item[i][2]; j <= item[i][3]; j++)
									{
										var option = document.createElement("OPTION");
										option.innerHTML = j;
										option.value = j;
										optGroup.appendChild(option);
									}
									break;
								case "value":
									var option = document.createElement("OPTION");
									option.innerHTML = item[i][2];
									option.value = item[i][2];
									optGroup.appendChild(option);
									break;
							}
						}
						this._selectOption(select, defaultValue);
						this._propertyValuePane.appendChild(select);
						break;
					case "select-color":
						var defaultValue = ((item[1] == null) ? item[3] : item[1]);
						var select = document.createElement("SELECT");
						this._propertyElementsWithHandlers.push(select);
						$addHandlers(select, { "change": this._changeColorHandler }, this);
						select.style.width = "140px";
						//var values = new Array("000000", "0000FF", "008000", "FFA500", "FF0000", "FFFFFF", "FFFF00", "");
						//var texts = new Array(this._localization.Black, this._localization.Blue, this._localization.Green, this._localization.Orange, this._localization.Red, this._localization.White, this._localization.Yellow, this._localization.Custom);
						var values = new Array("000000", "0000FF", "008000", "FFA500", "FF0000", "FFFFFF", "FFFF00");
						var texts = new Array(this._localization.Black, this._localization.Blue, this._localization.Green, this._localization.Orange, this._localization.Red, this._localization.White, this._localization.Yellow);
						var options = new Array();
						for (var i = 0; i < values.length; i++)
						{
							var option = document.createElement("OPTION");
							if (values[i] == "")
							{
								option.value = "";
							}
							else
							{
								option.value = eval("0x" + values[i]);
								option.style.backgroundColor = "#" + values[i];
							}
							option.innerHTML = texts[i];
							select.appendChild(option);
							options[options.length] = option;
						}
						this._propertyValuePane.appendChild(select);
						if (!this._selectOption(select, parseInt(defaultValue)))
						{
							option = document.createElement("OPTION");
							color = this._convertColor(defaultValue);
							option.innerHTML = this._localization.Customh + color;
							option.value = defaultValue;
							option.style.backgroundColor = color;
							select.insertBefore(option, options[6]);
							select.selectedIndex = 6;
						}
						break;
					case "text":
						var defaultValue = ((item[1] == null) ? item[5] : item[1]);
						var textBox = this._createText(defaultValue);
						this._propertyValuePane.appendChild(textBox);
						if (item[4] != "")
						{
							this._propertyValueDescription.innerHTML += this._localization.Note + item[4];
						}
						break;
					case "text-regexp":
						var defaultValue = ((item[1] == null) ? item[5] : item[1]);
						var textBox = this._createText(defaultValue);
						this._propertyValuePane.appendChild(textBox);
						this._propertyValueDescription.innerHTML += this._localization.Note + item[4];
						break;
					case "text-range":
						var defaultValue = ((item[1] == null) ? item[5] : item[1]);
						var textBox = this._createText(defaultValue);
						this._propertyValuePane.appendChild(textBox);
						this._propertyValueDescription.innerHTML += this._localization.Note + item[4];
						break;
				}
				this._propertyValuePane.style.display = "block";
			}
			else
			{
				this._propertyValueDescription.innerHTML = this._localization.NA;
			}
		},

		_clearPropertyElementsHandlers: function()
		{
			var propertyElement = this._propertyElementsWithHandlers.pop();
			while (propertyElement)
			{
				$clearHandlers(propertyElement);
				propertyElement = this._propertyElementsWithHandlers.pop();
			}
		},

		dispose: function()
		{
			this._setInitialValues();
			this._tab.remove_tabSelecting(this._tabClickDelegate);
			this._tabClickDelegate = null;
			$clearHandlers(this._classIdCheckBox);
			$clearHandlers(this._mediaProperties);

			Telerik.Web.UI.Widgets.MediaPreviewer.callBaseMethod(this, "dispose");
		}
	}

	Telerik.Web.UI.Widgets.MediaPreviewer.registerClass("Telerik.Web.UI.Widgets.MediaPreviewer", Telerik.Web.UI.Widgets.FilePreviewer);
</script>
<div id="MediaPreviewer" class="mediaPreviewer">
    <telerik:RadToolBar ID="EmptyToolbar" runat="Server" Height="26px" Width="100%"></telerik:RadToolBar>
	<telerik:RadMultiPage ID="mediaMultiPage" runat="server" Height="300px" SelectedIndex="0">
		<telerik:RadPageView ID="previewPage" runat="server">
			<div>
				&nbsp;</div>
		</telerik:RadPageView>
		<telerik:RadPageView ID="propertiesPage" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 267px; display: block; margin-top: 0; float: left;" class="reControlsLayout">
				<tr>
					<td class="reLabelCell">
					    <label for="ClassID" class="reDialogLabel">
					        <span style="text-align: right; width: 100px;">
                                <script type="text/javascript">
                                	document.write(localization["ClassID"]);
						        </script>
						    </span>
                        </label>
					</td>
					<td class="reControlCell">
					    <input type="checkbox" id="ClassID" />	
					</td>
				</tr>
				<tr id="ClassIDLi" style="display: none;">
					<td class="reLabelCell">
						<label for="ClassIDText" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
                                <script type="text/javascript">
                                	document.write(localization["ClassIDText"]);
							    </script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="ClassIDText" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="mediaWidth" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
                                <script type="text/javascript">
                                	document.write(localization["Width"]);
							    </script>
							</span>
                        </label>
					</td>
					<td class="reControlCell">
						<input type="text" id="mediaWidth" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="mediaHeight" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
                                <script type="text/javascript">
                                	document.write(localization["Height"]);
							    </script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="mediaHeight" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="mediaAlign" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
                                <script type="text/javascript">
                                	document.write(localization["Align"]);
							    </script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="mediaAlign" class="FlashManagerCombo">
							<option selected="selected" value="baseline">Baseline </option>
							<option value="bottom">Bottom </option>
							<option value="left">Left </option>
							<option value="middle">Middle </option>
							<option value="right">Right </option>
							<option value="texttop">TextTop </option>
							<option value="top">Top </option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="mediaProperties" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
                                <script type="text/javascript">
                                	document.write(localization["Properties"]);
							    </script>
							</span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="mediaProperties" class="FlashManagerCombo">
							<option selected="selected" value=""></option>
							<option value="AllowChangeDisplaySize">AllowChangeDisplaySize </option>
							<option value="AllowScan">AllowScan </option>
							<option value="AnimationAtStart">AnimationAtStart </option>
							<option value="AudioStream">AudioStream </option>
							<option value="AutoRewind">AutoRewind </option>
							<option value="AutoSize">AutoSize </option>
							<option value="AutoStart">AutoStart </option>
							<option value="Balance">Balance </option>
							<option value="CCActive">CCActive </option>
							<option value="ClickToPlay">ClickToPlay </option>
							<option value="ColorKey">ColorKey </option>
							<option value="CurrentAngle">CurrentAngle </option>
							<option value="CurrentAudioStream">CurrentAudioStream </option>
							<option value="CurrentCCService">CurrentCCService </option>
							<option value="CurrentMarker">CurrentMarker </option>
							<option value="CurrentPosition">CurrentPosition </option>
							<option value="CurrentSubpictureStream">CurrentSubpictureStream </option>
							<option value="CursorType">CursorType </option>
							<option value="DefaultFrame">DefaultFrame </option>
							<option value="DisplayBackColor">DisplayBackColor </option>
							<option value="DisplayForeColor">DisplayForeColor </option>
							<option value="DisplayMode">DisplayMode </option>
							<option value="DisplaySize">DisplaySize </option>
							<option value="EnableContextMenu">EnableContextMenu </option>
							<option value="Enabled">Enabled </option>
							<option value="EnableFullScreenControls">EnableFullScreenControls </option>
							<option value="EnablePositionControls">EnablePositionControls </option>
							<option value="EnableTracker">EnableTracker </option>
							<option value="Hidden">Hidden </option>
							<option value="InvokeURLs">InvokeURLs </option>
							<option value="Language">Language </option>
							<option value="Mute">Mute </option>
							<option value="PlayCount">PlayCount </option>
							<option value="PreviewMode">PreviewMode </option>
							<option value="Rate">Rate </option>
							<option value="SelectionEnd">SelectionEnd </option>
							<option value="SelectionStart">SelectionStart </option>
							<option value="SendErrorEvents">SendErrorEvents </option>
							<option value="SendKeyboardEvents">SendKeyboardEvents </option>
							<option value="SendMouseClickEvents">SendMouseClickEvents </option>
							<option value="SendMouseMoveEvents">SendMouseMoveEvents </option>
							<option value="SendOpenStateChangeEvents">SendOpenStateChangeEvents </option>
							<option value="SendPlayStateChangeEvents">SendPlayStateChangeEvents </option>
							<option value="SendWarningEvents">SendWarningEvents </option>
							<option value="ShowAudioControls">ShowAudioControls </option>
							<option value="ShowCaptioning">ShowCaptioning </option>
							<option value="ShowControls">ShowControls </option>
							<option value="ShowDisplay">ShowDisplay </option>
							<option value="ShowGotoBar">ShowGotoBar </option>
							<option value="ShowPositionControls">ShowPositionControls </option>
							<option value="ShowStatusBar">ShowStatusBar </option>
							<option value="ShowTracker">ShowTracker </option>
							<option value="SubpictureOn">SubpictureOn </option>
							<option value="TransparentAtStart">TransparentAtStart </option>
							<option value="VideoBorder3D">VideoBorder3D </option>
							<option value="VideoBorderColor">VideoBorderColor </option>
							<option value="VideoBorderWidth">VideoBorderWidth </option>
							<option value="Volume">Volume </option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						&nbsp;</td>
					<td class="reControlCell">
						<div id="propertyValueDescription" style="width: 140px;"></div>
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">&nbsp;</td>
					<td class="reControlCell">
						<div class="propertiesField" id="propertyValuePane" style="display: none;"></div>
					</td>
				</tr>
			</table>
		</telerik:RadPageView>
	</telerik:RadMultiPage>
	<telerik:RadTabStrip ID="mediaTabStrip" SelectedIndex="0" Orientation="HorizontalBottom" Width="100%" runat="server" 
		ShowBaseLine="true" MultiPageID="mediaMultiPage">
		<Tabs>
			<telerik:RadTab Text="Preview" Value="Preview" Selected="true" />
			<telerik:RadTab Text="Properties" Value="Properties" />
		</Tabs>
	</telerik:RadTabStrip>
</div>
