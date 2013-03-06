<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">
	html, body, form
	{
		overflow: hidden;
	}
	.rade_dialog
	{
		table-layout: fixed;
		padding: 0;
		margin: 0;
		cursor: default;
		color: black;
	}
	
	.rade_dialog a
	{
		text-decoration: none;
		outline: none;
	}
	.rade_dialog legend
	{
		cursor: default;
	}
	.radECtrlButtonsList
	{
		float: right;
	}
	.rade_dialog ul, .rade_dialog ul li, .rade_dialog_toolbar ul, .radECtrlButtonsList ul, .rade_dialog_toolbar_text ul, .controlsList, .rade_dialog .styleBuilderNavigation ul, .rade_dialog .styleBuilderNavigation li
	{
		padding: 0;
		margin: 0;
		list-style: none !important;
	}
	.rade_dialog_toolbar ul li, .radECtrlButtonsList ul li, .rade_dialog_toolbar_text ul li
	{
		float: left;
	}
	.rade_dialog_toolbar
	{
		float: left;
		width: 100%;
	}
	.rade_dialog_toolbar a
	{
		margin: 10px;
	}
	.rade_dialog_toolbar a, .rade_dialog_toolbar a span
	{
		display: block;
		text-indent: -9999px;
		cursor: pointer;
		cursor: hand;
	}
	.radECtrlButtonsList
	{
		margin: 8px;
	}
	/* style builder dialog */.styleBuilderNavigation
	{
		width: 102px; /* hard-coded in the html ? */
		height: 432px; /* hard-coded in the html ? */
	}
	.styleBuilderNavigation a
	{
		display: block;
		padding-left: 4px;
		width: 96px;
		line-height: 20px;
		height: 20px;
		cursor: default;
		background-repeat: no-repeat;
	}
	/*.styleBuilderNavigation .styleBuilderFont
{
	background-position: 0 -152px;
}

.styleBuilderBackground
{
	background-position: 0 -172px;
}

.styleBuilderText
{
	background-position: 0 -192px;
}

.styleBuilderPosition
{
	background-position: 0 -212px;
}

.styleBuilderLayout
{
	background-position: 0 -232px;
}

.styleBuilderEdges
{
	background-position: 0 -252px;
}

.styleBuilderLists
{
	background-position: 0 -272px;
}

.styleBuilderOther
{
	background-position: 0 -292px;
}*/.paneSwitch
	{
		height: 400px;
		display: none;
	}
	.paneSwitch li
	{
		padding-bottom: 6px;
	}
	.paneSwitch
	{
		position: relative;
	}
	.paneSwitch select
	{
		vertical-align: middle;
	}
	.sampleText
	{
		background: white;
		clear: both;
		width: 402px;
		height: 43px;
		padding-top: 23px;
		text-align: center;
		font: normal 18px "Times New Roman" , Garamond, Serif;
		overflow: auto;
		float: none;
		margin-top: 6px;
		border-top: solid 1px #808080;
		border-right: solid 1px white;
		border-bottom: solid 1px white;
		border-left: solid 1px #808080;
		position: absolute;
		top: 330px;
	}
	.InnerSquare
	{
		width: 70px;
		height: 20px;
		background: #000080;
		margin: auto;
	}
	.FlowControlSquare .InnerSquare
	{
		margin: 3px;
		border: solid 1px black;
		width: 27px;
		height: 27px;
	}
	.rade_dialog input
	{
		vertical-align: middle;
	}
	.FlowControlSquare
	{
		width: 35px;
		height: 35px;
		background: white;
		border: solid 1px #808080;
		float: left;
		margin-right: 4px;
	}
	.ListsSample
	{
		text-align: left;
		padding: 0;
		font: normal 14px "Times New Roman" , Serif;
		height: 66px;
	}
	.ListsSample li
	{
		list-style-type: disc;
		margin-left: 16px;
	}
	.StyleBuilder .paneSwitch li
	{
		padding-bottom: 6px;
	}
	/* end of style builder dialog *//* preset inputs */.s_input
	{
		width: 46px;
		text-align: right;
	}
	.m_input
	{
		width: 126px;
	}
	.l_input
	{
		width: 226px;
	}
	.xl_input
	{
		width: 264px;
	}
	/* end of preset inputs *//*.StyleBuilder
{
	background: #d4d0c8;
}*/.StyleBuilder .rade_toolbar
	{
		background: none;
	}
	.rade_grip
	{
		display: none;
	}
	.StyleBuilder .dialogControl_fontFamily
	{
		background: none !important;
		border: solid 1px red;
	}
	.StyleBuilder td
	{
		padding: 6px;
	}
	.styleBuilderNavigation
	{
		/*background: #d4d0c8;*/
		border-top: solid 1px #808080;
		border-right: solid 1px white;
		border-bottom: solid 1px white;
		border-left: solid 1px #808080;
	}
	.styleBuilderNavigation a
	{
		border: solid 1px #d4d0c8; /*background-color: #d4d0c8;*/
		color: black;
	}
	.styleBuilderNavigation a:hover
	{
		border-top: solid 1px white;
		border-right: solid 1px #808080;
		border-bottom: solid 1px #808080;
		border-left: solid 1px white;
	}
	.styleBuilderNavigation a.selectedButton, .styleBuilderNavigation a:active, .styleBuilderNavigation a:focus
	{
		background-color: white;
		border: solid 1px white;
	}
	.grayStripe
	{
		background: #808080;
	}
	
	#bordersTableLayout td
	{
		vertical-align: top;
	}
</style>

<script type="text/javascript">
	Type.registerNamespace("Telerik.Web.UI.Widgets");

	Telerik.Web.UI.Widgets.StyleBuilder = function(element)
	{
		Telerik.Web.UI.Widgets.StyleBuilder.initializeBase(this, [element]);
		this._clientParameters = null;
		this._insertButton = null;
		this._htmlElement = null;
	}

	Telerik.Web.UI.Widgets.StyleBuilder.prototype = {
		initialize: function() {
			Telerik.Web.UI.Widgets.StyleBuilder.callBaseMethod(this, 'initialize');
			this.setupChildren();
		},

		dispose: function() {
			$clearHandlers(this._insertButton);
			this._insertButton = null;
			this._htmlElement = null;

			Telerik.Web.UI.Widgets.StyleBuilder.callBaseMethod(this, 'dispose');
		},

		clientInit: function(clientParameters) {
			this._clientParameters = clientParameters;
			this._htmlElement = clientParameters.get_value();

			var colorPicker = $find("color");
			colorPicker.set_items(this._clientParameters.Colors);
			colorPicker.set_color("");

			var colorPickerBorderTop = $find("colorPickerBorderTop");
			colorPickerBorderTop.set_items(this._clientParameters.Colors);
			colorPickerBorderTop.set_color("");

			var colorPickerBorderRight = $find("colorPickerBorderRight");
			colorPickerBorderRight.set_items(this._clientParameters.Colors);
			colorPickerBorderRight.set_color("");
			colorPickerBorderRight.set_enabled(false);

			var colorPickerBorderBottom = $find("colorPickerBorderBottom");
			colorPickerBorderBottom.set_items(this._clientParameters.Colors);
			colorPickerBorderBottom.set_color("");
			colorPickerBorderBottom.set_enabled(false);

			var colorPickerBorderLeft = $find("colorPickerBorderLeft");
			colorPickerBorderLeft.set_items(this._clientParameters.Colors);
			colorPickerBorderLeft.set_color("");
			colorPickerBorderLeft.set_enabled(false);
			
			var backgroundColorPicker = $find("backgroundColor");
			backgroundColorPicker.set_items(this._clientParameters.Colors);
			backgroundColorPicker.set_color("");

			$find("fontFamily").set_items(this._clientParameters.fontNames);
			$find("fontFamily").set_activeIndex(-1);
			$find("backgroundImageCaller").set_editor(this._clientParameters.editor);
			$find("imageBullet").set_editor(this._clientParameters.editor);

			for (var item in this._htmlElement.style) {
				var dialogControl = $find(item);
				if (dialogControl) {
					if (this._htmlElement.style[item] != "")
						dialogControl.set_value(this._htmlElement.style[item]);
					else if (dialogControl.clear_value)
						dialogControl.clear_value();
				}
			}

			//setting border control separetely
			var borderContorl = $find("StyleBuilderBorderControl1");
			borderContorl.set_value(this._htmlElement);

			showTab('psFont');
		},

		setupChildren: function() {
			this._insertButton = $get("InsertButton");
			$addHandlers(this._insertButton, { "click": this._insertClickHandler }, this);
			var fontStyleArray = ["Normal", "Italic", "Oblique"];
			var fontVariantArray = ["Normal", "Small-Caps"];

			var elem = $find("fontStyle");
			elem.set_items(fontStyleArray);
			elem = $find("fontVariant");
			elem.set_items(fontVariantArray);
		},

		_insertClickHandler: function() {
			if (this._htmlElement) {
				for (var item in this._htmlElement.style) {
					var dialogControl = $find(item);
					if (dialogControl) {
						if (dialogControl.get_value) {
							var pomDebugger = dialogControl.get_value();
							if (pomDebugger != "") this._htmlElement.style[item] = dialogControl.get_value();
						}
					}
				}
				
				//new border control separetely
				var borderContorl = $find("StyleBuilderBorderControl1");
				borderContorl.get_value(this._htmlElement);
			}
			//NEW
			var arguments = new Telerik.Web.UI.EditorCommandEventArgs("StyleBuilder", null, this._htmlElement);
			Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close(arguments);
		}
	}

	Telerik.Web.UI.Widgets.StyleBuilder.registerClass('Telerik.Web.UI.Widgets.StyleBuilder', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);

	//================== Add client control definitions here===============================================//
	/////////////////////////////////////////////////////////////////////////////////////////
	// EditorTextDecorationControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorTextDecorationControl = function(element)
	{
		Telerik.Web.UI.EditorTextDecorationControl.initializeBase(this, [element]);
		this._selectedItem = false;
	}

	Telerik.Web.UI.EditorTextDecorationControl.prototype =
{
	initialize: function()
	{
		var checks = this.get_element().getElementsByTagName("input");
		for (var i = 0; i < checks.length; i++)
		{
			this._initializeCheckBox(checks[i]);
		}
	},


	dispose: function()
	{
		//Dispose of event handlers
		var checks = this.get_element().getElementsByTagName("input");
		for (var i = 0; i < checks.length; i++)
		{
			$clearHandlers(checks[i]);
		}

		Telerik.Web.UI.EditorTextDecorationControl.callBaseMethod(this, 'dispose');
	},

	get_selectedItem: function()
	{
		return this._selectedItem;
	},

	set_value: function(value)
	{
		var items = this.get_element().getElementsByTagName('input');
		var decs = new Array("none", "underline", "line-through", "overline");

		for (var i = 0; i < 4; i++)
		{
			if (value.indexOf(decs[i]) != -1)
			{
				items[i].checked = 1;
			} else
			{
				items[i].checked = 0;
			}
		}

	},

	get_value: function()
	{
		var decs = new Array("none", "underline", "line-through", "overline");
		var items = this.get_element().getElementsByTagName('input');

		var returnValue = "";
		for (var i = 0; i < 4; i++)
		{
			if (items[i].checked)
			{
				returnValue += decs[i] + " ";
			}
		}

		return returnValue;
	},

	clear_value: function()
	{
		var items = this.get_element().getElementsByTagName('input');
		for (var i = 0; i < 4; i++)
		{
			items[i].checked = false;
		}
	},

	_initializeCheckBox: function(input)
	{
		$addHandler(input, "click", Function.createDelegate(this, function(e)
		{
			this._selectedItem = !this._selectedItem; //SAFARI is just pathetic with its handling of checkboxes.

			//input.checked = this._selectedItem; 

			var items = this.get_element().getElementsByTagName('input');
			this._selectedItem = input.checked;


			var isFirst = (input == this.get_element().getElementsByTagName("input")[0]);

			if (isFirst)
			{
				for (var i = 1; i < 4; i++)
				{
					if (items[0].checked)
					{
						items[i].checked = 0;
					}
					//this._selectedItem = !this._selectedItem;
				}
			}
			else
			{
				this._selectedItem = input.checked;
				items[0].checked = 0;
			}

			this.raiseEvent("valueSelected");
		})

        );
		this._inputElement = input;
	}
}
	Telerik.Web.UI.EditorTextDecorationControl.registerClass('Telerik.Web.UI.EditorTextDecorationControl', Telerik.Web.UI.EditorButton);



	/////////////////////////////////////////////////////////////////////////////////////////
	// EditorFontWeightControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorFontWeightControl = function(element)
	{
		Telerik.Web.UI.EditorFontWeightControl.initializeBase(this, [element]);
		//this._selectedItem = false;
	}

	Telerik.Web.UI.EditorFontWeightControl.prototype =
{
	initialize: function()
	{
		var wrapper = this.get_element();
		var radios = wrapper.getElementsByTagName('input');
		var selects = wrapper.getElementsByTagName('select');

		for (var i = 0; i < radios.length; i++)
		{
			this._initializeControl(radios[i]);

		}

	},


	dispose: function()
	{
		//Dispose of event handlers
		var radios = this.get_element().getElementsByTagName("input");
		for (var i = 0; i < radios.length; i++)
		{
			$clearHandlers(radios[i]);
		}

		Telerik.Web.UI.EditorFontWeightControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var selects = this.get_element().getElementsByTagName('select');
		var checks = this.get_element().getElementsByTagName('input');

		if ((value == "normal") || (value == "bold"))
		{
			selects[0].value = value;
			checks[0].checked = "checked";
			selects[0].disabled = "";
			selects[1].disabled = "disabled";

		}
		else
		{
			selects[1].value = value;
			selects[0].disabled = "disabled";
			selects[1].disabled = "";
			checks[1].checked = "checked";
		}

	},

	clear_value: function()
	{
		this.set_value("");
	},

	get_value: function()
	{
		//        var decs = new Array("none", "underline","line-through","overline");
		var radios = this.get_element().getElementsByTagName('input');
		var selects = this.get_element().getElementsByTagName('select');

		var returnValue = "";
		for (var i = 0; i < radios.length; i++)
		{
			if (radios[i].checked)
			{
				returnValue = selects[i].value;
			}
		}

		return returnValue;
	},

	_initializeControl: function(input)
	{
		var selects = this.get_element().getElementsByTagName('select');

		$addHandler(input, "click", Function.createDelegate(this, function(e)
		{
			// this._selectedItem = !this._selectedItem;//SAFARI is just pathetic with its handling of checkboxes.
			selects[0].disabled = "disabled";
			selects[1].disabled = "disabled";

			if (input == this.get_element().getElementsByTagName("input")[0])
			{
				selects[0].disabled = "";
			}
			else
			{
				selects[1].disabled = "";
			}

			this.raiseEvent("valueSelected");
		})

        );
		this._inputElement = input;
	}
}
	Telerik.Web.UI.EditorFontWeightControl.registerClass('Telerik.Web.UI.EditorFontWeightControl', Telerik.Web.UI.EditorButton);


	/////////////////////////////////////////////////////////////////////////////////////////
	// EditorFontSizeControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorFontSizeControl = function(element)
	{
		Telerik.Web.UI.EditorFontSizeControl.initializeBase(this, [element]);
		this._radios = [];
		this._selects = [];
		this._size = null;
	}

	Telerik.Web.UI.EditorFontSizeControl.prototype =
{

	initialize: function()
	{
		var radios = this.get_element().getElementsByTagName('input');
		var selects = this.get_element().getElementsByTagName('select');

		for (var i = 0; i < 3; i++)
		{
			if (i == 1) continue;
			this._radios.push(radios[i]);
		}

		for (var i = 0; i < 2; i++)
		{
			this._selects.push(selects[i]);
		}

		this._initializeControl();


	},


	dispose: function()
	{
		//Dispose of event handlers
		for (var i = 0; i < this._radios.length; i++)
			$clearHandlers(this._radios[i]);
		for (var i = 0; i < this._selects.length; i++)
			$clearHandlers(this._selects[i]);

		Telerik.Web.UI.EditorFontSizeControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		if ((value == "larger") || (value == "smaller"))
		{
			this._selects[0].disabled = "disabled";
			this.get_element().getElementsByTagName('input')[1].disabled = "disabled";
			this._selects[1].disabled = "";
			this._selects[1].value = value;
		}
		else
		{
			this._selects[0].disabled = "";
			this.get_element().getElementsByTagName('input')[1].disabled = "";
			this._selects[1].disabled = "disabled";
			var measures = new Array("px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%");
			var unit = "";
			for (var i = 0; i < measures.length; i++)
			{
				if (value.indexOf(measures[i]) != -1)
				{
					unit = measures[i];
					value = value.replace(unit, "");
				}
			}
			this.get_element().getElementsByTagName('input')[1].value = value;
			this._selects[0].value = unit;
		}

	},

	clear_value: function()
	{
		this.set_value("");
	},

	get_value: function()
	{
		var returnValue = "";
		if (this._radios[0].checked)
		{
			if (this.get_element().getElementsByTagName('input')[1].value)
				returnValue = this.get_element().getElementsByTagName('input')[1].value + this._selects[0].value;
		}
		else
		{
			returnValue = this._selects[1].value;
		}
		return returnValue;
	},

	_initializeControl: function()
	{

		// alert(this._radios[1].checked);
		//       var selects = this.get_element().getElementsByTagName('select');
		//       
		$addHandler(this._radios[0], "click", Function.createDelegate(this, function(e)
		{
			this._selects[0].disabled = "";
			this._selects[1].disabled = "disabled";
			this.get_element().getElementsByTagName('input')[1].disabled = "";
		})

        );

		$addHandler(this._radios[1], "click", Function.createDelegate(this, function(e)
		{
			this._selects[0].disabled = "disabled";
			this._selects[1].disabled = "";
			this.get_element().getElementsByTagName('input')[1].disabled = "disabled";
		})

        );
		//        this._inputElement = input;
	}
}
	Telerik.Web.UI.EditorFontSizeControl.registerClass('Telerik.Web.UI.EditorFontSizeControl', Telerik.Web.UI.EditorButton);


	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorTextTransformControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorTextTransformControl = function(element)
	{
		Telerik.Web.UI.EditorTextTransformControl.initializeBase(this, [element]);
		this._select = this.get_element().getElementsByTagName('select')[0];
	}

	Telerik.Web.UI.EditorTextTransformControl.prototype =
{

	initialize: function()
	{

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		Telerik.Web.UI.EditorTextTransformControl.callBaseMethod(this, 'dispose');
	},


	clear_value: function()
	{
		this.set_value("");
	},

	set_value: function(value)
	{
		this._select.value = value;
	},

	get_value: function()
	{
		var returnValue = this._select.value;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorTextTransformControl.registerClass('Telerik.Web.UI.EditorTextTransformControl', Telerik.Web.UI.EditorButton);


	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorBackgroundControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorBackgroundControl = function(element)
	{
		Telerik.Web.UI.EditorBackgroundControl.initializeBase(this, [element]);
		this._elements = [];
	}

	Telerik.Web.UI.EditorBackgroundControl.prototype =
{
	initialize: function()
	{
		Telerik.Web.UI.EditorBackgroundControl.callBaseMethod(this, 'initialize');
		this._elements[0] = this.get_element().getElementsByTagName('select')[0]; //backgroundRepeat
		this._elements[1] = this.get_element().getElementsByTagName('select')[1]; //backgroundAttachment
	},

	dispose: function()
	{
		$clearHandlers(this._elements[0]);
		$clearHandlers(this._elements[1]);
		Telerik.Web.UI.EditorBackgroundControl.callBaseMethod(this, 'dispose');
	},

	set_value: function(value)
	{
		var aRepeat = ["repeat-x", "repeat-y", "repeat", "no-repeat"];
		var aAttachment = ["scroll", "fixed"];

		for (var i = 0; i < aRepeat.length; i++)
		{
			if (value.indexOf(aRepeat[i]) != -1)
			{
				this._elements[0].value = aRepeat[i];
			}
		}
		for (var i = 0; i < aAttachment.length; i++)
		{
			if (value.indexOf(aAttachment[i]) != -1)
			{
				this._elements[1].value = aAttachment[i];
			}
		}
	},

	clear_value: function()
	{
		$find("backgroundImageCaller").set_value("");
		this._elements[0].value = "";
		this._elements[1].value = "";
	},

	get_value: function()
	{
		var outArray = [];
		var imageValue = $find("backgroundImageCaller").get_value();
		if (imageValue)
			outArray.push('url(' + imageValue + ')');
		outArray.push(this._elements[0].value);
		outArray.push(this._elements[1].value);
		//trim is an MS AJAX function extension
		var returnValue = outArray.join(' ').trim();
		return returnValue;
	}
}
	Telerik.Web.UI.EditorBackgroundControl.registerClass('Telerik.Web.UI.EditorBackgroundControl', Telerik.Web.UI.EditorButton);

	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorBackgroundPositionControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorBackgroundPositionControl = function(element)
	{
		Telerik.Web.UI.EditorBackgroundPositionControl.initializeBase(this, [element]);
		this._inputs = [];
		this._selects = [];
		this._selects[0] = this.get_element().getElementsByTagName('select')[0];
		this._selects[1] = this.get_element().getElementsByTagName('select')[2];
		this._selects[2] = this.get_element().getElementsByTagName('select')[1];
		this._selects[3] = this.get_element().getElementsByTagName('select')[3];
		this._inputs[0] = this.get_element().getElementsByTagName('input')[0];
		this._inputs[1] = this.get_element().getElementsByTagName('input')[1];

	}

	Telerik.Web.UI.EditorBackgroundPositionControl.prototype =
{
	initialize: function()
	{
		$addHandler(this._selects[0], "change", Function.createDelegate(this, function(e)
		{
			var selectedIndex = this._selects[0].selectedIndex;
			if (this._selects[0].options[selectedIndex].innerHTML == "Custom")
			{
				this._inputs[0].disabled = "";
				this._inputs[0].focus();
				this._selects[2].disabled = "";
			}
			else
			{
				this._inputs[0].disabled = "disabled";
				this._selects[2].disabled = "disabled";

			}
		})

        );

		$addHandler(this._selects[1], "change", Function.createDelegate(this, function(e)
		{
			var selectedIndex = this._selects[1].selectedIndex;
			if (this._selects[1].options[selectedIndex].innerHTML == "Custom")
			{
				this._inputs[1].disabled = "";
				this._selects[3].disabled = "";
				this._inputs[1].focus();
			}
			else
			{
				this._inputs[1].disabled = "disabled";
				this._selects[3].disabled = "disabled";

			}
		})

        );


	},


	dispose: function()
	{
		for (var i = 0; i < this._selects.length; i++)
			$clearHandlers(this._selects[i]);
		for (var i = 0; i < this._inputs.length; i++)
			$clearHandlers(this._inputs[i]);

		Telerik.Web.UI.EditorBackgroundPositionControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var aHorizontal = ["left", "center", "right"];
		var aVertical = ["top", "center", "bottom"];
		var aMeasures = ["px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%"];
		var aValue = value.split(" ");

		for (var i = 0; i < aHorizontal.length; i++)
		{
			if (aValue[0].indexOf(aHorizontal[i]) != -1)
			{
				this._selects[0].value = aValue[0];
			}
			if (aValue[1].indexOf(aVertical[i]) != -1)
			{
				this._selects[1].value = aValue[1];
			}
		}

		for (var i = 0; i < aMeasures.length; i++)
		{
			if (aValue[0].indexOf(aMeasures[i]) != -1)
			{
				this._inputs[0].value = aValue[0].replace(aMeasures[i], '');
				this._selects[2].value = aMeasures[i];
				this._selects[0].selectedIndex = 5;
				this._inputs[0].disabled = "";
				this._selects[2].disabled = "";

			}
			if (aValue[1].indexOf(aMeasures[i]) != -1)
			{
				this._inputs[1].value = aValue[1].replace(aMeasures[i], '');
				this._selects[3].value = aMeasures[i];
				this._selects[1].selectedIndex = 5;
				this._inputs[1].disabled = "";
				this._selects[3].disabled = "";
			}
		}

	},

	clear_value: function()
	{
		this._selects[0].value = "";
		this._selects[1].value = "";
		this._inputs[0].value = "";
		this._inputs[1].value = "";
	},

	get_value: function()
	{
		var returnValue = "";
		if (this._selects[0].value != "")
		{
			returnValue += this._selects[0].value + " ";
		}
		else
		{
			if (this._inputs[0].value)
				returnValue += this._inputs[0].value + this._selects[2].value + " ";
		}

		if (this._selects[1].value != "")
		{
			returnValue += this._selects[1].value;
		}
		else
		{
			if (this._inputs[1].value)
				returnValue += this._inputs[1].value + this._selects[3].value;
		}

		return returnValue;
	}
}
	Telerik.Web.UI.EditorBackgroundPositionControl.registerClass('Telerik.Web.UI.EditorBackgroundPositionControl', Telerik.Web.UI.EditorButton);


	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorTextAlignControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorTextAlignControl = function(element)
	{
		Telerik.Web.UI.EditorTextAlignControl.initializeBase(this, [element]);
		this._select = this.get_element().getElementsByTagName('select')[0];
	}

	Telerik.Web.UI.EditorTextAlignControl.prototype =
{

	initialize: function()
	{

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		Telerik.Web.UI.EditorTextAlignControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		this._select.value = value;
	},

	clear_value: function()
	{
		this.set_value("");
	},

	get_value: function()
	{
		var returnValue = this._select.value;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorTextAlignControl.registerClass('Telerik.Web.UI.EditorTextAlignControl', Telerik.Web.UI.EditorButton);


	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorVerticalAlignControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorVerticalAlignControl = function(element)
	{
		Telerik.Web.UI.EditorVerticalAlignControl.initializeBase(this, [element]);
		this._select = this.get_element().getElementsByTagName('select')[0];
	}

	Telerik.Web.UI.EditorVerticalAlignControl.prototype =
{

	initialize: function()
	{

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		Telerik.Web.UI.EditorVerticalAlignControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		this._select.value = value;
	},

	clear_value: function()
	{
		this.set_value("");
	},

	get_value: function()
	{
		var returnValue = this._select.value;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorVerticalAlignControl.registerClass('Telerik.Web.UI.EditorVerticalAlignControl', Telerik.Web.UI.EditorButton);



	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorLetterSpacingControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorLetterSpacingControl = function(element)
	{
		Telerik.Web.UI.EditorLetterSpacingControl.initializeBase(this, [element]);

	}

	Telerik.Web.UI.EditorLetterSpacingControl.prototype =
{

	initialize: function()
	{
		this._select = this.get_element().getElementsByTagName('select')[0];
		this._measure = this.get_element().getElementsByTagName('select')[1];
		this._input = this.get_element().getElementsByTagName('input')[0];

		$addHandler(this._select, "change", Function.createDelegate(this, function(e)
		{
			var selectedIndex = this._select.selectedIndex;
			if (this._select.options[selectedIndex].innerHTML == "Custom")
			{
				this._measure.disabled = "";
				this._input.disabled = "";
			}
			else
			{
				this._measure.disabled = "disabled";
				this._input.disabled = "disabled";
			}
		})

        );

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		$clearHandlers(this._measure);
		$clearHandlers(this._input);

		Telerik.Web.UI.EditorLetterSpacingControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var aMeasures = ["px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%"];
		if (value.indexOf('normal') != -1)
		{
			this._select.value = 'normal';
			this._measure.disabled = "disabled";
			this._input.disabled = "disabled";

		}
		else
		{
			for (var i = 0; i < aMeasures.length; i++)
			{
				if (value.indexOf(aMeasures[i]) != -1)
				{
					this._measure.disabled = "";
					this._input.disabled = "";
					this._measure.value = aMeasures[i];
					this._input.value = value.replace(aMeasures[i], '');
				}
			}
		}



		this._select.value = value;
	},

	clear_value: function()
	{
		this._select.value = "";
		this._input.value = "";
	},

	get_value: function()
	{
		var returnValue = "";

		if (this._select.value == "normal")
		{
			returnValue = "normal";
		}
		else
		{
			if (this._input.value)
				returnValue = this._input.value + this._measure.value;
		}

		return returnValue;
	}
}
	Telerik.Web.UI.EditorLetterSpacingControl.registerClass('Telerik.Web.UI.EditorLetterSpacingControl', Telerik.Web.UI.EditorButton);



	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorLineHeightControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorLineHeightControl = function(element)
	{
		Telerik.Web.UI.EditorLineHeightControl.initializeBase(this, [element]);

	}

	Telerik.Web.UI.EditorLineHeightControl.prototype =
{

	initialize: function()
	{
		this._select = this.get_element().getElementsByTagName('select')[0];
		this._measure = this.get_element().getElementsByTagName('select')[1];
		this._input = this.get_element().getElementsByTagName('input')[0];



		$addHandler(this._select, "change", Function.createDelegate(this, function(e)
		{
			var selectedIndex = this._select.selectedIndex;
			if (this._select.options[selectedIndex].innerHTML == "Custom")
			{
				this._measure.disabled = "";
				this._input.disabled = "";
			}
			else
			{
				this._measure.disabled = "disabled";
				this._input.disabled = "disabled";
			}
		})

        );

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		$clearHandlers(this._measure);
		$clearHandlers(this._input);

		Telerik.Web.UI.EditorLineHeightControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var aMeasures = ["px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%"];
		if (value.indexOf('normal') != -1)
		{
			this._select.value = 'normal';
			this._measure.disabled = "disabled";
			this._input.disabled = "disabled";

		}
		else
		{
			for (var i = 0; i < aMeasures.length; i++)
			{
				if (value.indexOf(aMeasures[i]) != -1)
				{
					this._measure.disabled = "";
					this._input.disabled = "";
					this._measure.value = aMeasures[i];
					this._input.value = value.replace(aMeasures[i], '');
				}
			}
		}



		this._select.value = value;
	},

	clear_value: function()
	{
		this._select.value = "";
		this._input.value = "";
	},

	get_value: function()
	{
		var returnValue = "";

		if (this._select.value == "normal")
		{
			returnValue = "normal";
		}
		else
		{
			if (this._input.value)
				returnValue = this._input.value + this._measure.value;
		}

		return returnValue;
	}
}
	Telerik.Web.UI.EditorLineHeightControl.registerClass('Telerik.Web.UI.EditorLineHeightControl', Telerik.Web.UI.EditorButton);



	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorTextIndentControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorTextIndentControl = function(element)
	{
		Telerik.Web.UI.EditorTextIndentControl.initializeBase(this, [element]);
		this._input = this.get_element().getElementsByTagName('input')[0];
		this._select = this.get_element().getElementsByTagName('select')[0];
	}

	Telerik.Web.UI.EditorTextIndentControl.prototype =
{

	initialize: function()
	{

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		$clearHandlers(this._input);
		Telerik.Web.UI.EditorTextIndentControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var aMeasures = ["px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%"];

		for (var i = 0; i < aMeasures.length; i++)
		{
			if (value.indexOf(aMeasures[i]) != -1)
			{
				this._select.value = aMeasures[i];
				this._input.value = value.replace(aMeasures[i], '');
			}
		}

	},

	clear_value: function()
	{
		this._select.value = "";
		this._input.value = "";
	},

	get_value: function()
	{
		var returnValue = "";
		if (this._input.value)
			returnValue = this._input.value + this._select.value;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorTextIndentControl.registerClass('Telerik.Web.UI.EditorTextIndentControl', Telerik.Web.UI.EditorButton);



	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorSimpleComboControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorSimpleComboControl = function(element)
	{
		Telerik.Web.UI.EditorSimpleComboControl.initializeBase(this, [element]);
	}

	Telerik.Web.UI.EditorSimpleComboControl.prototype =
{

	initialize: function()
	{
		this._select = this.get_element().getElementsByTagName('select')[0];

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		Telerik.Web.UI.EditorSimpleComboControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		this._select.value = value;
	},

	clear_value: function()
	{
		this._select.value = "";
	},

	get_value: function()
	{
		var returnValue = this._select.value;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorSimpleComboControl.registerClass('Telerik.Web.UI.EditorSimpleComboControl', Telerik.Web.UI.EditorButton);




	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorClipControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorClipControl = function(element)
	{
		Telerik.Web.UI.EditorClipControl.initializeBase(this, [element]);

	}

	Telerik.Web.UI.EditorClipControl.prototype =
{

	initialize: function()
	{
		this._select = [];
		this._input = [];
		this._select[0] = this.get_element().getElementsByTagName('select')[0];
		this._select[1] = this.get_element().getElementsByTagName('select')[3];
		this._select[2] = this.get_element().getElementsByTagName('select')[1];
		this._select[3] = this.get_element().getElementsByTagName('select')[2];
		this._input[0] = this.get_element().getElementsByTagName('input')[0];
		this._input[1] = this.get_element().getElementsByTagName('input')[3];
		this._input[2] = this.get_element().getElementsByTagName('input')[1];
		this._input[3] = this.get_element().getElementsByTagName('input')[2];


		$addHandler(this._input[0], "keyup", Function.createDelegate(this, function(e)
		{
			if (this._select[0].selectedIndex == 0)
			{
				this._select[0].selectedIndex = 1;
			}

		})

            );

		$addHandler(this._input[1], "keyup", Function.createDelegate(this, function(e)
		{
			if (this._select[1].selectedIndex == 0)
			{
				this._select[1].selectedIndex = 1;
			}

		})

            );

		$addHandler(this._input[2], "keyup", Function.createDelegate(this, function(e)
		{
			if (this._select[2].selectedIndex == 0)
			{
				this._select[2].selectedIndex = 1;
			}

		})

            );

		$addHandler(this._input[3], "keyup", Function.createDelegate(this, function(e)
		{
			if (this._select[3].selectedIndex == 0)
			{
				this._select[3].selectedIndex = 1;
			}

		})

            );

	},


	dispose: function()
	{
		for (var j = 0; j < this._select.length; j++)
			$clearHandlers(this._select[j]);
		Telerik.Web.UI.EditorClipControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var newValue = value.replace("rect( ", "");
		newValue = newValue.replace(" )", "");
		newValue = newValue.replace("rect(", "");
		newValue = newValue.replace(")", "");

		var aValue = newValue.split(" ");

		var aMeasures = ["px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%"];

		for (var j = 0; j < aValue.length; j++)
		{
			for (var i = 0; i < aMeasures.length; i++)
			{
				if (aValue[j].indexOf(aMeasures[i]) != -1)
				{
					this._select[j].value = aMeasures[i];
					this._input[j].value = aValue[j].replace(aMeasures[i], '');
				}
			}
		}


	},

	get_value: function()
	{
		var returnValue = "";
		var boolApply = false;

		for (var i = 0; i < this._input.length; i++)
		{
			if (this._input[i].value != "")
			{
				boolApply = true;
			}
		}

		if (boolApply == true)
		{
			var strApply = "rect( ";
			for (var i = 0; i < this._input.length; i++)
			{
				var inp = this._input[i].value;
				var sel = this._select[i].value;
				if (inp == "")
				{
					inp = "auto";
					sel = "";
				}
				strApply += inp + sel + " ";
			}
			strApply += ")";

		}
		if (strApply) returnValue = strApply;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorClipControl.registerClass('Telerik.Web.UI.EditorClipControl', Telerik.Web.UI.EditorButton);



	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorSimpleTextComboControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorSimpleTextComboControl = function(element)
	{
		Telerik.Web.UI.EditorSimpleTextComboControl.initializeBase(this, [element]);
	}

	Telerik.Web.UI.EditorSimpleTextComboControl.prototype =
{

	initialize: function()
	{
		this._input = this.get_element().getElementsByTagName('input')[0];
		this._select = this.get_element().getElementsByTagName('select')[0];

	},


	dispose: function()
	{
		$clearHandlers(this._select);
		$clearHandlers(this._input);
		Telerik.Web.UI.EditorSimpleTextComboControl.callBaseMethod(this, 'dispose');
	},


	set_value: function(value)
	{
		var aMeasures = ["px", "pc", "pt", "mm", "cm", "in", "em", "ex", "%"];

		for (var i = 0; i < aMeasures.length; i++)
		{
			if (value.indexOf(aMeasures[i]) != -1)
			{
				this._select.value = aMeasures[i];
				this._input.value = value.replace(aMeasures[i], '');
			}
		}

	},

	clear_value: function()
	{
		this._select.value = "";
		this._input.value = "";
	},

	get_value: function()
	{
		var returnValue = "";
		if (this._input.value)
			returnValue = this._input.value + this._select.value;
		return returnValue;
	}
}
	Telerik.Web.UI.EditorSimpleTextComboControl.registerClass('Telerik.Web.UI.EditorSimpleTextComboControl', Telerik.Web.UI.EditorButton);



	///////////////////////////////////////////////////////////////////////////////////////////
	// EditorListStyleImageControl 
	///////////////////////////////////////////////////////////////////////////////////////////
	Telerik.Web.UI.EditorListStyleImageControl = function(element)
	{
		Telerik.Web.UI.EditorListStyleImageControl.initializeBase(this, [element]);
	}

	Telerik.Web.UI.EditorListStyleImageControl.prototype =
{
	initialize: function()
	{
		Telerik.Web.UI.EditorListStyleImageControl.callBaseMethod(this, 'initialize');
	},

	dispose: function()
	{
		Telerik.Web.UI.EditorListStyleImageControl.callBaseMethod(this, 'dispose');
	},

	set_value: function(value)
	{
		$find("imageBullet").set_value(value);
	},

	clear_value: function()
	{
		this.set_value("");
	},

	get_value: function()
	{
		var returnValue = $find("imageBullet").get_value();
		if (returnValue)
			returnValue = 'url(' + returnValue + ')';
		return returnValue;
	}
}
	Telerik.Web.UI.EditorListStyleImageControl.registerClass('Telerik.Web.UI.EditorListStyleImageControl', Telerik.Web.UI.EditorButton);


///////////////////////////////////////////////////////////////////////////////////////////
// StyleBuilderBorderControl
///////////////////////////////////////////////////////////////////////////////////////////
Telerik.Web.UI.StyleBuilderBorderControl = function(element) {
	Telerik.Web.UI.StyleBuilderBorderControl.initializeBase(this, [element]);

	this._borderStyleAll;
	this._borderWidthAll;
	this._borderColorAll;

	this._borderStyleTop;
	this._borderWidthTop;
	this._borderWidthValueTop;
	this._borderWidthUnitTop;
	this._borderColorTop;

	this._borderStyleRight;
	this._borderWidthRight;
	this._borderWidthValueRight;
	this._borderWidthUnitRight;
	this._borderColorRight;

	this._borderStyleBottom;
	this._borderWidthBottom;
	this._borderWidthValueBottom;
	this._borderWidthUnitBottom;
	this._borderColorBottom;

	this._borderStyleLeft;
	this._borderWidthLeft;
	this._borderWidthValueLeft;
	this._borderWidthUnitLeft;
	this._borderColorLeft;
	this._chkBorderCollapse;
	this._divBorderCollapse;
}
Telerik.Web.UI.StyleBuilderBorderControl.prototype =
{
	initialize: function() {
		Telerik.Web.UI.StyleBuilderBorderControl.callBaseMethod(this, 'initialize');

		this._initializeChildren();

		$addHandlers(this._borderStyleAll, { "click": this._borderStyleAllHandler }, this);
		$addHandlers(this._borderWidthAll, { "click": this._borderWidthAllHandler }, this);
		$addHandlers(this._borderColorAll, { "click": this._borderColorAllHandler }, this);
		$addHandlers(this._borderStyleTop, { "change": this._borderStyleTopHandler }, this);
		$addHandlers(this._borderWidthTop, { "change": this._borderWidthTopHandler }, this);
		$addHandlers(this._borderWidthValueTop, { "keyup": this._borderWidthValueTopHandler }, this);
		$addHandlers(this._borderWidthUnitTop, { "change": this._borderWidthUnitTopHandler }, this);
		$addHandlers(this._borderWidthRight, { "change": this._borderWidthRightHandler }, this);
		$addHandlers(this._borderWidthBottom, { "change": this._borderWidthBottomHandler }, this);
		$addHandlers(this._borderWidthLeft, { "change": this._borderWidthLeftHandler }, this);
	},

	_initializeChildren: function() {
		this._borderStyleAll = $get("chkBorderStyleAll");
		this._borderWidthAll = $get("chkBorderWidthAll");
		this._borderColorAll = $get("chkBorderColorAll");

		this._borderStyleTop = $get("selBorderStyleTop");
		this._borderWidthTop = $get("selBorderWidthTop");
		this._borderWidthValueTop = $get("txtBorderWidthValueTop");
		this._borderWidthUnitTop = $get("selBorderWidthUnitTop");
		this._borderColorTop = $find("colorPickerBorderTop");

		this._borderStyleRight = $get("selBorderStyleRight");
		this._borderWidthRight = $get("selBorderWidthRigth");
		this._borderWidthValueRight = $get("txtBorderWidthValueRight");
		this._borderWidthUnitRight = $get("selBorderWidthUnitRight");
		this._borderColorRight = $find("colorPickerBorderRight");

		this._borderStyleBottom = $get("selBorderStyleBottom");
		this._borderWidthBottom = $get("selBorderWidthBottom");
		this._borderWidthValueBottom = $get("txtBorderWidthValueBottom");
		this._borderWidthUnitBottom = $get("selBorderWidthUnitBottom");
		this._borderColorBottom = $find("colorPickerBorderBottom");

		this._borderStyleLeft = $get("selBorderStyleLeft");
		this._borderWidthLeft = $get("selBorderWidthLeft");
		this._borderWidthValueLeft = $get("txtBorderWidthValueLeft");
		this._borderWidthUnitLeft = $get("selBorderWidthUnitLeft");
		this._borderColorLeft = $find("colorPickerBorderLeft");

		this._borderColorTop.add_valueSelected(Function.createDelegate(this, function(e) {
			if (this._borderColorAll.checked) {
				var value = this._borderColorTop.get_value();
				this._borderColorRight.set_value(value);
				this._borderColorBottom.set_value(value);
				this._borderColorLeft.set_value(value);
			}
		}));
		
		this._chkBorderCollapse = $get("chkBorderCollapse");
		this._divBorderCollapse = $get("divBorderCollapse");
	},

	set_borderColorTop: function(value) {
		this._borderColorTop = value;
	},

	get_borderColorTop: function() {
		return this._borderColorTop;
	},

	set_borderColorRight: function(value) {
		this._borderColorRight = value;
	},

	get_borderColorRight: function() {
		return this._borderColorRight;
	},

	set_borderColorBottom: function(value) {
		this._borderColorBottom = value;
	},

	get_borderColorBottom: function() {
		return this._borderColorBottom;
	},

	set_borderColorLeft: function(value) {
		this._borderColorLeft = value;
	},

	get_borderColorLeft: function() {
		return this._borderColorLeft;
	},

	_borderStyleAllHandler: function(e) {
		if (!this._borderStyleAll.checked) {
			this._borderStyleRight.disabled = "";
			this._borderStyleBottom.disabled = "";
			this._borderStyleLeft.disabled = "";
		}
		else {
			this._borderStyleRight.disabled = "disabled";
			this._borderStyleBottom.disabled = "disabled";
			this._borderStyleLeft.disabled = "disabled";

			var value = this._borderStyleTop.value;
			this._borderStyleRight.value = value;
			this._borderStyleBottom.value = value;
			this._borderStyleLeft.value = value;
		}
	},

	_borderWidthAllHandler: function(e) {
		if (!this._borderWidthAll.checked) {
			this._borderWidthRight.disabled = "";
			this._borderWidthBottom.disabled = "";
			this._borderWidthLeft.disabled = "";

			if (this._borderWidthRight.value == "custom") {
				this._borderWidthValueRight.disabled = "";
				this._borderWidthUnitRight.disabled = "";
			} else {
				this._borderWidthValueRight.disabled = "disabled";
				this._borderWidthUnitRight.disabled = "disabled";
			}

			if (this._borderWidthBottom.value == "custom") {
				this._borderWidthValueBottom.disabled = "";
				this._borderWidthUnitBottom.disabled = "";
			} else {
				this._borderWidthValueBottom.disabled = "disabled";
				this._borderWidthUnitBottom.disabled = "disabled";
			}

			if (this._borderWidthRight.value == "custom") {
				this._borderWidthValueLeft.disabled = "";
				this._borderWidthUnitLeft.disabled = "";
			} else {
				this._borderWidthValueLeft.disabled = "disabled";
				this._borderWidthUnitLeft.disabled = "disabled";
			}
		}
		else {
			this._borderWidthRight.disabled = "disabled";
			this._borderWidthBottom.disabled = "disabled";
			this._borderWidthLeft.disabled = "disabled";

			this._borderWidthValueRight.disabled = "disabled";
			this._borderWidthValueBottom.disabled = "disabled";
			this._borderWidthValueLeft.disabled = "disabled";

			this._borderWidthUnitRight.disabled = "disabled";
			this._borderWidthUnitBottom.disabled = "disabled";
			this._borderWidthUnitLeft.disabled = "disabled";

			var value = this._borderWidthTop.value;
			this._borderWidthRight.value = value;
			this._borderWidthBottom.value = value;
			this._borderWidthLeft.value = value;

			var widthValue = this._borderWidthValueTop.value;
			this._borderWidthValueRight.value = widthValue;
			this._borderWidthValueBottom.value = widthValue;
			this._borderWidthValueLeft.value = widthValue;

			var unitValue = this._borderWidthUnitTop.value;
			this._borderWidthUnitRight.value = unitValue;
			this._borderWidthUnitBottom.value = unitValue;
			this._borderWidthUnitLeft.value = unitValue;
		}
	},

	_borderColorAllHandler: function(e) {
		if (!this._borderColorTop) this._borderColorTop = $find("colorPickerBorderTop");
		if (!this._borderColorRight) this._borderColorRight = $find("colorPickerBorderRight");
		if (!this._borderColorBottom) this._borderColorBottom = $find("colorPickerBorderBottom");
		if (!this._borderColorLeft) this._borderColorLeft = $find("colorPickerBorderLeft");

		if (!this._borderColorAll.checked) {
			this._borderColorRight.set_enabled(true);
			this._borderColorBottom.set_enabled(true);
			this._borderColorLeft.set_enabled(true);
		}
		else {
			this._borderColorRight.set_enabled(false);
			this._borderColorBottom.set_enabled(false);
			this._borderColorLeft.set_enabled(false);

			var value = this._borderColorTop.get_value();
			this._borderColorRight.set_value(value);
			this._borderColorBottom.set_value(value);
			this._borderColorLeft.set_value(value);
		}
	},

	_borderStyleTopHandler: function(e) {
		if (this._borderStyleAll.checked) {
			var value = this._borderStyleTop.value;
			this._borderStyleRight.value = value;
			this._borderStyleBottom.value = value;
			this._borderStyleLeft.value = value;
		}
	},

	_borderWidthTopHandler: function(e) {
		var value = this._borderWidthTop.value;
		if (value == "custom") {
			this._borderWidthValueTop.disabled = "";
			this._borderWidthUnitTop.disabled = "";
		} else {
			this._borderWidthValueTop.disabled = "disabled";
			this._borderWidthUnitTop.disabled = "disabled";
			this._borderWidthValueTop.value = "";
			this._borderWidthUnitTop.value = "px";
			if (this._borderWidthAll.checked) {
				this._borderWidthValueRight.value = "";
				this._borderWidthUnitRight.value = "px";
				this._borderWidthValueBottom.value = "";
				this._borderWidthUnitBottom.value = "px";
				this._borderWidthValueLeft.value = "";
				this._borderWidthUnitLeft.value = "px";
			}
		}

		if (this._borderWidthAll.checked) {
			this._borderWidthRight.value = value;
			this._borderWidthBottom.value = value;
			this._borderWidthLeft.value = value;
		}
	},

	_borderWidthValueTopHandler: function(e) {
		if (this._borderWidthAll.checked) {
			var value = this._borderWidthValueTop.value;
			this._borderWidthValueRight.value = value;
			this._borderWidthValueBottom.value = value;
			this._borderWidthValueLeft.value = value;
		}
	},

	_borderWidthUnitTopHandler: function(e) {
		if (this._borderWidthAll.checked) {
			var value = this._borderWidthUnitTop.value;
			this._borderWidthUnitRight.value = value;
			this._borderWidthUnitBottom.value = value;
			this._borderWidthUnitLeft.value = value;
		}
	},

	_borderWidthRightHandler: function(e) {
		var value = this._borderWidthRight.value;
		if (value == "custom" && !this._borderWidthAll.checked) {
			this._borderWidthValueRight.disabled = "";
			this._borderWidthUnitRight.disabled = "";
		} else {
			this._borderWidthValueRight.disabled = "disabled";
			this._borderWidthUnitRight.disabled = "disabled";
			this._borderWidthValueRight.value = "";
			this._borderWidthUnitRight.value = "px";
		}
	},

	_borderWidthBottomHandler: function(e) {
		var value = this._borderWidthBottom.value;
		if (value == "custom" && !this._borderWidthAll.checked) {
			this._borderWidthValueBottom.disabled = "";
			this._borderWidthUnitBottom.disabled = "";
		} else {
			this._borderWidthValueBottom.disabled = "disabled";
			this._borderWidthUnitBottom.disabled = "disabled";
			this._borderWidthValueBottom.value = "";
			this._borderWidthUnitBottom.value = "px";
		}
	},

	_borderWidthLeftHandler: function(e) {
		var value = this._borderWidthLeft.value;
		if (value == "custom" && !this._borderWidthAll.checked) {
			this._borderWidthValueLeft.disabled = "";
			this._borderWidthUnitLeft.disabled = "";
		} else {
			this._borderWidthValueLeft.disabled = "disabled";
			this._borderWidthUnitLeft.disabled = "disabled";
			this._borderWidthValueLeft.value = "";
			this._borderWidthUnitLeft.value = "px";
		}
	},

	clearControl: function() {
		this._borderStyleAll.checked = "checked";
		this._borderWidthAll.checked = "checked";
		this._borderColorAll.checked = "checked";

		this._borderStyleTop.value = "";
		this._borderWidthTop.value = "";
		this._borderWidthValueTop.value = "";
		this._borderWidthUnitTop.value = "";
		this._borderColorTop.value = "";

		this._borderStyleRight.value = "";
		this._borderStyleRight.disabled = "disabled";
		this._borderWidthRight.value = "";
		this._borderWidthRight.disabled = "disabled";
		this._borderWidthValueRight.value = "";
		this._borderWidthValueRight.disabled = "disabled";
		this._borderWidthUnitRight.value = "";
		this._borderWidthUnitRight.disabled = "disabled";
		this._borderColorRight.value = "";
		this._borderColorRight.set_enabled(false);

		this._borderStyleBottom.value = "";
		this._borderStyleBottom.disabled = "disabled";
		this._borderWidthBottom.value = "";
		this._borderWidthBottom.disabled = "disabled";
		this._borderWidthValueBottom.value = "";
		this._borderWidthValueBottom.disabled = "disabled";
		this._borderWidthUnitBottom.value = "";
		this._borderWidthUnitBottom.disabled = "disabled";
		this._borderColorBottom.value = "";
		this._borderColorBottom.set_enabled(false);

		this._borderStyleLeft.value = "";
		this._borderStyleLeft.disabled = "disabled";
		this._borderWidthLeft.value = "";
		this._borderWidthLeft.disabled = "disabled";
		this._borderWidthValueLeft.value = "";
		this._borderWidthValueLeft.disabled = "disabled";
		this._borderWidthUnitLeft.value = "";
		this._borderWidthUnitLeft.disabled = "disabled";
		this._borderColorLeft.value = "";
		this._borderColorLeft.set_enabled(false);
	},

	set_BorderStyle: function(element) 
	{
		if (!element) return;
		bStyleAllChecked = true;
		var value = element.style["borderTopStyle"];
		if (value != element.style["borderRightStyle"] || value != element.style["borderBottomStyle"] || value != element.style["borderLeftStyle"])
			bStyleAllChecked = false;

		if (bStyleAllChecked) {
			this._borderStyleAll.checked = "checked";
			this._borderStyleTop.value = value;
			this._borderStyleRight.value = value;
			this._borderStyleRight.disabled = "disabled";
			this._borderStyleBottom.value = value;
			this._borderStyleBottom.disabled = "disabled";
			this._borderStyleLeft.value = value;
			this._borderStyleLeft.disabled = "disabled";
		} else {
			this._borderStyleAll.checked = "";
			this._borderStyleTop.value = value;
			this._borderStyleRight.value = element.style["borderRightStyle"];
			this._borderStyleRight.disabled = "";
			this._borderStyleBottom.value = element.style["borderBottomStyle"];
			this._borderStyleBottom.disabled = "";
			this._borderStyleLeft.value = element.style["borderLeftStyle"];
			this._borderStyleLeft.disabled = "";
		}
	},
	
	set_WidthTool: function(WidthType, WidthValue, WidthUnit, value)
	{
		var customWidth = "";
		if (value && value != "thin" && value != "medium" && value != "thick")
		{
			customWidth = value;
			value = "custom"
		}

		WidthType.value = value;
		if (customWidth)
		{
			var numValue = parseInt(customWidth);
			var unitValue = customWidth.replace(/[0-9]*/, "");
			if (!unitValue) unitValue = "px";
			
			WidthValue.disabled = "";
			WidthUnit.disabled = "";
		}
		else
		{
			unitValue = "px";
			numValue = "";
		}
		WidthValue.value = numValue;
		WidthUnit.value = unitValue;
	},
	
	set_BorderWidth: function(element)
	{
		if (!element) return;
		var value = element.style["borderTopWidth"];
		bWidthAllChecked = true;
		if (value != element.style["borderRightWidth"] || value != element.style["borderBottomWidth"] || value != element.style["borderLeftWidth"])
			bWidthAllChecked = false;
		
		if (bWidthAllChecked)
		{
			this._borderWidthAll.checked = "checked";
			this._borderWidthRight.disabled = "disabled";
			this._borderWidthValueRight.disabled = "disabled";
			this._borderWidthUnitRight.disabled = "disabled";
			this._borderWidthBottom.disabled = "disabled";
			this._borderWidthValueBottom.disabled = "disabled";
			this._borderWidthUnitBottom.disabled = "disabled";
			this._borderWidthLeft.disabled = "disabled";
			this._borderWidthValueLeft.disabled = "disabled";
			this._borderWidthUnitLeft.disabled = "disabled";
			customWidth = "";
			
			if (value)
			{
				if (value != "thin" && value != "medium" && value != "thick")
				{
					customWidth = value;
					value = "custom";
				}
			}
			
			
			this._borderWidthTop.value = value;
			this._borderWidthRight.value = value;
			this._borderWidthBottom.value = value;
			this._borderWidthLeft.value = value;
			
			if (customWidth)
			{
				var numValue = parseInt(customWidth);
				var unitValue = customWidth.replace(/[0-9]*/, "");
				if (!unitValue) unitValue = "px";

				this._borderWidthValueTop.value = numValue;
				this._borderWidthValueRight.value = numValue;
				this._borderWidthValueBottom.value = numValue;
				this._borderWidthValueLeft.value = numValue;
				
				this._borderWidthValueTop.disabled = "";
				this._borderWidthUnitTop.disabled = "";
			}
			else
			{
				unitValue = "px";
				this._borderWidthValueTop.value = "";
				this._borderWidthValueRight.value = "";
				this._borderWidthValueBottom.value = "";
				this._borderWidthValueLeft.value = "";
			}
			
			this._borderWidthUnitTop.value = unitValue;
			this._borderWidthUnitRight.value = unitValue;
			this._borderWidthUnitBottom.value = unitValue;
			this._borderWidthUnitLeft.value = unitValue;
			
		}
		else
		{
			this._borderWidthAll.checked = "";
			this._borderWidthRight.disabled = "";
			this._borderWidthBottom.disabled = "";
			this._borderWidthLeft.disabled = "";
			
			this.set_WidthTool(this._borderWidthTop, this._borderWidthValueTop, this._borderWidthUnitTop, value);
			this.set_WidthTool(this._borderWidthRight, this._borderWidthValueRight, this._borderWidthUnitRight, element.style["borderRightWidth"]);
			this.set_WidthTool(this._borderWidthBottom, this._borderWidthValueBottom, this._borderWidthUnitBottom, element.style["borderBottomWidth"]);
			this.set_WidthTool(this._borderWidthLeft, this._borderWidthValueLeft, this._borderWidthUnitLeft, element.style["borderLeftWidth"]);
		}
	},

	set_BorderColor: function(element)
	{
		if (!element) return;
		var value = element.style["borderTopColor"];
		bColorAllChecked = true;
		if (value != element.style["borderRightColor"] || value != element.style["borderBottomColor"] || value != element.style["borderLeftColor"])
			bColorAllChecked = false;
			
		if (bColorAllChecked)
		{
			this._borderColorAll.checked = "checked";
			this._borderColorTop.set_value(value);
			this._borderColorRight.set_value(value);
			this._borderColorRight.set_enabled(false);
			this._borderColorBottom.set_value(value);
			this._borderColorBottom.set_enabled(false);
			this._borderColorLeft.set_value(value);
			this._borderColorLeft.set_enabled(false);
		}
		else
		{
			this._borderColorAll.checked = "";
			this._borderColorTop.set_value(value);
			this._borderColorRight.set_value(element.style["borderRightColor"]);
			this._borderColorRight.set_enabled(true);
			this._borderColorBottom.set_value(element.style["borderBottomColor"]);
			this._borderColorBottom.set_enabled(true);
			this._borderColorLeft.set_value(element.style["borderLeftColor"]);
			this._borderColorLeft.set_enabled(true);
		}
	},

	set_value: function(element)
	{
		if (!element)
		{
			this.clearControl;
			return;
		}
		if (element.tagName == "TABLE")
		{
			this._divBorderCollapse.style.display = "";
			this._chkBorderCollapse.checked = (element.style.borderCollapse == "collapse") ? "checked" : "";
		}
		else
		{
			this._divBorderCollapse.style.display = "none";
			this._chkBorderCollapse.checked = "";
		}
		//border style
		this.set_BorderStyle(element);
		//border width
		this.set_BorderWidth(element);
		//color
		this.set_BorderColor(element);
	},
	
	get_borderToolValue: function(element, Style, WidthType, WidthValue, WidthUnit, Color, position)
	{
		//border style
		var styleValue = Style.value;
		element.style["border" + position + "Style"] = styleValue;
		
		//border width
		var widthTypeValue = WidthType.value;
		var width = "";
		if (widthTypeValue == "thin" || widthTypeValue == "medium" || widthTypeValue == "thick")
		{
			width = widthTypeValue;
		}
		else if (widthTypeValue == "custom")
		{
			var numValue = WidthValue.value;
			if (numValue) width = numValue + WidthUnit.value;
		}
		element.style["border" + position + "Width"] = width;
		
		//border color
		var color = Color.get_value();
		element.style["border" + position + "Color"] = color;
	},
	
	get_value: function(element)
	{
		if (!element) return;
		element.style["border"] = "";
		this.get_borderToolValue(element, this._borderStyleTop, this._borderWidthTop, this._borderWidthValueTop, this._borderWidthUnitTop, this._borderColorTop, "Top");
		this.get_borderToolValue(element, this._borderStyleRight, this._borderWidthRight, this._borderWidthValueRight, this._borderWidthUnitRight, this._borderColorRight, "Right");
		this.get_borderToolValue(element, this._borderStyleBottom, this._borderWidthBottom, this._borderWidthValueBottom, this._borderWidthUnitBottom, this._borderColorBottom, "Bottom");
		this.get_borderToolValue(element, this._borderStyleLeft, this._borderWidthLeft, this._borderWidthValueLeft, this._borderWidthUnitLeft, this._borderColorLeft, "Left");
		
		if (element.tagName == "TABLE")
		{
			element.style["borderCollapse"] = (this._chkBorderCollapse.checked) ? "collapse" : "";
		}
	}
}

Telerik.Web.UI.StyleBuilderBorderControl.registerClass('Telerik.Web.UI.StyleBuilderBorderControl', Telerik.Web.UI.EditorButton);
</script>

<script type="text/javascript">
	function showTab(TabId)
	{
		var psArray = new Array("psFont", "psBackground", "psText", "psLayout", "psEdges", "psLists", "psBorders");

		for (var i = 0; i < psArray.length; i++)
		{
			document.getElementById(psArray[i]).style.display = 'none';
			var cName = psArray[i].replace('ps', 'styleBuilder');
			document.getElementById(psArray[i] + "Button").className = cName;
		}

		document.getElementById(TabId).style.display = 'block';
		document.getElementById(TabId + "Button").className += " selectedButton";
	}
</script>

<style type="text/css">
	.rade_toolbar.Default li
	{
		background-image: none !important;
	}
	.sampleText
	{
		display: none !important;
	}
	.Default.rade_dropDownBody
	{
		margin-top: -10px;
	}
</style>
<table cellpadding="0" cellspacing="0" class="rade_dialog Default StyleBuilder" style="width: 530px;
	height: 430px;">
	<tr>
		<td style="width: 102px;">
			<div class="styleBuilderNavigation">
				<ul>
					<li><a href="javascript:showTab('psFont');" id="psFontButton" title="Font" class="styleBuilderFont"
						onmouseup="this.blur();">Font</a></li>
					<li><a href="javascript:showTab('psBackground');" id="psBackgroundButton" title="Background"
						onmouseup="this.blur();" class="styleBuilderBackground">Background</a></li>
					<li><a href="javascript:showTab('psText');" id="psTextButton" title="Text" onmouseup="this.blur();"
						class="styleBuilderText">Text</a></li>
					<li><a href="javascript:showTab('psLayout');" id="psLayoutButton" title="Layout"
						onmouseup="this.blur();" class="styleBuilderLayout">Layout</a></li>
					<li><a href="javascript:showTab('psEdges');" id="psEdgesButton" title="Edges" onmouseup="this.blur();"
						class="styleBuilderEdges">Edges</a></li>
					<li><a href="javascript:showTab('psBorders');" id="psBordersButton" title="Edges" onmouseup="this.blur();"
						class="styleBuilderEdges">Border</a></li>
					<li><a href="javascript:showTab('psLists');" id="psListsButton" title="Lists" onmouseup="this.blur();"
						class="styleBuilderLists">Lists</a></li>
				</ul>
			</div>
		</td>
		<td id="tabs">
			<!-- FONT PANE -->
			<div class="paneSwitch" id="psFont" style="display: block;">
				<fieldset>
					<legend>Font name</legend>
					<div style="padding-right: 81px; float: left; padding-top: 6px;">
						Family:</div>
					<div style="float: left;">
						<tools:StandardDropDown ID="fontFamily" runat="server"></tools:StandardDropDown>
					</div>
				</fieldset>
				<fieldset>
					<legend>Font attributes</legend>
					<div style="float: left; width: 120px;">
						<span>Color:</span>
						<div>
							<tools:ColorPicker ID="color" runat="server"></tools:ColorPicker>
							<!-- DO NOT REMOVE THE WRAPPING DIV, JUST ITS STYLE ATTRIBUTE (style="color: red; font-weight: bold;") -->
						</div>
					</div>
					<div style="float: left;">
						<span>Italics:</span>
						<tools:StandardDropDown ID="fontStyle" runat="server"></tools:StandardDropDown>
					</div>
					<div style="float: left; margin-left: 4px;">
						<span>Small caps:</span>
						<tools:StandardDropDown ID="fontVariant" runat="server"></tools:StandardDropDown>
					</div>
				</fieldset>
				<fieldset style="width: 180px; float: left; height: 119px;">
					<legend>Size</legend>
					<ul id="fontSize">
						<li>
							<input type="radio" name="fnSize" id="specific" checked="checked" style="border: 0;" /><label
								for="specific">Specific:</label>
							<input type="text" id="length" style="width: 20px; margin-left: 5px;" class="s_input" />
							<select id="unit">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li>
							<input type="radio" name="fnSize" id="relative" style="border: 0;" /><label for="relative">Relative:</label>
							<select id="relativeUnit" style="width: 77px; margin-left: 4px;" disabled="disabled">
								<option selected="selected" value=""></option>
								<option value="">&lt;not set&gt;</option>
								<option value="smaller">smaller</option>
								<option value="larger">larger</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset style="height: 119px;">
					<legend>Effects</legend>
					<ul id="textDecoration">
						<li>
							<input type="checkbox" id="fxNone" style="border: 0;" style="border: 0;" /><label
								for="fxNone">None</label></li>
						<li>
							<input type="checkbox" id="fxUnderline" style="border: 0;" /><label for="fxUnderline">Underline</label></li>
						<li>
							<input type="checkbox" id="fxStrikethrough" style="border: 0;" /><label for="fxStrikethrough">Strikethrough</label></li>
						<li>
							<input type="checkbox" id="fxOverline" style="border: 0;" /><label for="fxOverline">Overline</label></li>
					</ul>
				</fieldset>
				<fieldset style="clear: both; width: 180px; float: left; height: 69px;">
					<legend>Bold</legend>
					<ul id="fontWeight">
						<li>
							<input type="radio" id="nfBoldAbs" name="fnBold" checked="checked" style="border: 0;" /><label
								for="nfBoldAbs">Absolute:</label>
							<select id="fnBoldAbsCombo" style="width: 77px;">
								<option selected="selected" value=""></option>
								<option value="">&lt;not set&gt;</option>
								<option value="normal">Normal</option>
								<option value="bold">Bold</option>
							</select>
						</li>
						<li>
							<input type="radio" id="nfBoldRel" name="fnBold" style="border: 0;" /><label for="nfBoldRel">Relative:</label>
							<select id="fnBoldRelCombo" style="width: 77px; margin-left: 4px;" disabled="disabled">
								<option selected="selected" value=""></option>
								<option value="">&lt;not set&gt;</option>
								<option value="lighter">Lighter</option>
								<option value="bolder">Bolder</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset style="height: 69px;" id="textTransform">
					<legend>Capitalization</legend>
					<select id="Capitalization" style="width: 176px;">
						<option selected="selected" value=""></option>
						<option value="">&lt;not set&gt;</option>
						<option value="none">None</option>
						<option value="capitalize">Capitalize</option>
						<option value="uppercase">Uppercase</option>
						<option value="lowercase">Lowercase</option>
					</select>
				</fieldset>
				<div class="sampleText" id="sbSampleText">
					Sample Text</div>
			</div>
			<!-- / FONT PANE -->
			<!-- BACKGROUND PANE -->
			<div class="paneSwitch" id="psBackground">
				<fieldset>
					<legend>Background color</legend>
					<ul>
						<li>
							<div style="float: left; padding-top: 8px;">
								Color:</div>
							<div style="float: left; margin-left: 4px;">
								<tools:ColorPicker ID="backgroundColor" runat="server"></tools:ColorPicker>
							</div>
						</li>
						<li style="clear: both;">
							<input type="checkbox" id="transparent" style="border: 0;" /><label for="transparent">Transparent</label></li>
					</ul>
				</fieldset>
				<fieldset>
					<legend>Background image</legend>
					<ul id="background">
						<li>
							<div style="display: block; float: left; width: 112px; text-overflow: ellipsis; overflow: hidden;
								padding-top: 8px;">
								Image:</div>
							<div style="float: left;">
								<tools:ImageDialogCaller ID="backgroundImageCaller" runat="server" />
							</div>
						</li>
						<li style="clear: both; padding-left: 62px; padding-top: 4px;">
							<label for="backgroundRepeat">
								Tiling:</label>
							<!-- background-repeat -->
							<select id="backgroundRepeat" style="width: 268px; margin-left: 18px;">
								<option selected="selected" value=""></option>
								<option value="">&lt;not set&gt;</option>
								<option value="repeat-x">Tile in horizontal direction</option>
								<option value="repeat-y">Tile in vertical direction</option>
								<option value="repeat">Tile in both directions</option>
								<option value="no-repeat">Do not tile</option>
							</select>
						</li>
						<li style="clear: both; padding-left: 62px;">
							<label for="backgroundAttachment">
								Scrolling:</label>
							<!-- background-attachment -->
							<select id="backgroundAttachment" style="width: 268px;">
								<option selected="selected" value=""></option>
								<option value="">&lt;not set&gt;</option>
								<option value="scroll">Scrolling background</option>
								<option value="fixed">Fixed background</option>
							</select>
						</li>
					</ul>
					<fieldset style="margin-left: 54px;clear: both;">
						<legend>Position</legend>
						<!-- background-position -->
						<ul id="backgroundPosition">
							<li>
								<label for="positionHorizontal" style="padding-right: 76px;">
									Horizontal:</label>
								<select id="positionHorizontal" class="s_input" style="width: 70px">
									<option selected="selected" value=""></option>
									<option value="">&lt;not set&gt;</option>
									<option value="left">Left</option>
									<option value="center">Center</option>
									<option value="right">Right</option>
									<option value="">Custom</option>
								</select>
								<input type="text" class="s_input" value="" disabled="disabled" />
								<select id="positionHorizontalUnit" class="s_input" disabled="disabled">
									<option selected="selected" value=""></option>
									<option value="px">px</option>
									<option value="pc">pc</option>
									<option value="pt">pt</option>
									<option value="mm">mm</option>
									<option value="cm">cm</option>
									<option value="in">in</option>
									<option value="em">em</option>
									<option value="ex">ex</option>
									<option value="%">%</option>
								</select>
							</li>
							<li>
								<label for="positionVertical" style="padding-right: 91px;">
									Vertical:</label>
								<select id="positionVertical" class="s_input" style="width: 70px">
									<option selected="selected" value=""></option>
									<option value="">&lt;not set&gt;</option>
									<option value="top">Top</option>
									<option value="center">Center</option>
									<option value="bottom">Bottom</option>
									<option value="">Custom</option>
								</select>
								<input type="text" value="" class="s_input" disabled="disabled" />
								<select id="positionVerticalUnit" class="s_input" disabled="disabled">
									<option selected="selected" value=""></option>
									<option value="px">px</option>
									<option value="pc">pc</option>
									<option value="pt">pt</option>
									<option value="mm">mm</option>
									<option value="cm">cm</option>
									<option value="in">in</option>
									<option value="em">em</option>
									<option value="ex">ex</option>
									<option value="%">%</option>
								</select>
							</li>
						</ul>
					</fieldset>
				</fieldset>
				<ul>
					<li>
						<input type="checkbox" id="DoNotUseBgrImage" style="border: 0;" /><label for="DoNotUseBgrImage">Do
							not use background image</label></li>
				</ul>
				<div class="sampleText">
					Sample Text</div>
			</div>
			<!-- / BACKGROUND PANE -->
			<!-- TEXT PANE -->
			<div class="paneSwitch" id="psText">
				<fieldset>
					<legend>Alignment</legend>
					<ul>
						<li id="textAlign">
							<label for="AlignmentHorizontal" style="padding-right: 20px;">
								Horizontal:</label>
							<select id="AlignmentHorizontal" style="width: 230px;">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="left">Left</option>
								<option value="center">Centered</option>
								<option value="right">Right</option>
								<option value="justify">Justified</option>
							</select>
						</li>
						<li id="verticalAlign">
							<label for="AlignmentVertical" style="padding-right: 35px;">
								Vertical:</label>
							<select id="AlignmentVertical" style="width: 230px;">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="baseline">Baseline</option>
								<option value="sub">Sub</option>
								<option value="super">Super</option>
								<option value="top">Top</option>
								<option value="text-top">Text-top</option>
								<option value="middle">Middle</option>
								<option value="bottom">Bottom</option>
								<option value="text-bottom">text-bottom</option>
							</select>
						</li>
						<li>
							<label for="Justification" style="padding-right: 10px;">
								Justification:</label>
							<select id="Justification" style="width: 230px;">
								<option selected="selected"></option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset>
					<legend>Spacing between</legend>
					<ul>
						<li id="letterSpacing">
							<label for="Letters" style="padding-right: 37px;">
								Letters:</label>
							<select id="Letters" class="m_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="normal">Normal</option>
								<option value="">Custom</option>
							</select>
							<input type="text" class="s_input" disabled="disabled" />
							<select class="s_input" disabled="disabled">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="lineHeight">
							<label for="Lines" style="padding-right: 44px;">
								Lines:</label>
							<select id="Lines" class="m_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="normal">Normal</option>
								<option value="">Custom</option>
							</select>
							<input type="text" class="s_input" />
							<select class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset>
					<legend>Text flow</legend>
					<ul>
						<li id="textIndent">
							<label for="" style="padding-right: 44px;">
								Indentation:</label>
							<input type="text" class="s_input" />
							<select class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="direction">
							<label for="" style="padding-right: 33px;">
								Text direction:</label>
							<select style="width: 200px;">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="ltr">Left to right</option>
								<option value="rtl">Right to left</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<div class="sampleText">
					Sample Text</div>
			</div>
			<!-- / TEXT PANE -->
			<!-- FLOW PANE -->
			<div class="paneSwitch" id="psLayout">
				<fieldset>
					<legend>Flow control</legend>
					<ul>
						<li id="visibility">
							<div class="FlowControlSquare">
								<!-- / -->
							</div>
							<label for="FlowControlVisibility">
								Visibility:</label>
							<div style="float: none;">
								<!-- / -->
							</div>
							<select id="FlowControlVisibility" class="xl_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="hidden">Hidden</option>
								<option value="visible">Visible</option>
								<option value="collapse">Collapse</option>
							</select>
						</li>
						<li id="display">
							<div class="FlowControlSquare">
								<!-- / -->
							</div>
							<label for="FlowControlDisplay">
								Display:</label>
							<div style="float: none;">
								<!-- / -->
							</div>
							<select id="FlowControlDisplay" class="xl_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="none">Do not display</option>
								<option value="block">As a block element</option>
								<option value="inline">As an inflow element</option>
							</select>
						</li>
						<li id="float">
							<div class="FlowControlSquare">
								<!-- / -->
							</div>
							<label for="AllowTextToFlow">
								Allow text to flow:</label>
							<div style="float: none;">
								<!-- / -->
							</div>
							<select id="AllowTextToFlow" class="xl_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="none">Don't allow text on slides</option>
								<option value="right">To the left</option>
								<option value="left">To the right</option>
							</select>
						</li>
						<li id="clear">
							<div class="FlowControlSquare">
								<!-- / -->
							</div>
							<label for="AllowFloatingObjects">
								Allow floating objects:</label>
							<div style="float: none;">
								<!-- / -->
							</div>
							<select id="SelectClear" class="xl_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="none">On either side</option>
								<option value="left">Only on right</option>
								<option value="right">Only on left</option>
								<option value="both">Do not allow</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset>
					<legend>Content</legend>
					<ul>
						<li id="overflow">
							<label for="ContentOverflow" style="padding-right: 60px;">
								Overflow:</label>
							<select class="xl_input" id="ContentOverflow">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="auto">Use scrollbars if needed</option>
								<option value="scroll">Always use scrolbars</option>
								<option value="visible">Content is not clipped</option>
								<option value="hidden">Content is clipped</option>
							</select>
						</li>
					</ul>
					<fieldset>
						<legend>Clipping</legend>
						<ul id="clip">
							<li style="float: left;">
								<label for="">
									Top:</label>
								<input type="text" class="s_input" />
								<select class="s_input">
									<option selected="selected" value=""></option>
									<option value="px">px</option>
									<option value="pc">pc</option>
									<option value="pt">pt</option>
									<option value="mm">mm</option>
									<option value="cm">cm</option>
									<option value="in">in</option>
									<option value="em">em</option>
									<option value="ex">ex</option>
									<option value="%">%</option>
								</select>
							</li>
							<li>
								<label for="" style="padding-right: 1px; padding-left: 20px;">
									Bottom:</label>
								<input type="text" class="s_input" />
								<select class="s_input">
									<option selected="selected" value=""></option>
									<option value="px">px</option>
									<option value="pc">pc</option>
									<option value="pt">pt</option>
									<option value="mm">mm</option>
									<option value="cm">cm</option>
									<option value="in">in</option>
									<option value="em">em</option>
									<option value="ex">ex</option>
									<option value="%">%</option>
								</select>
							</li>
							<li style="float: left;">
								<label for="" style="padding-right: 1px;">
									Left:</label>
								<input type="text" class="s_input" />
								<select class="s_input">
									<option selected="selected" value=""></option>
									<option value="px">px</option>
									<option value="pc">pc</option>
									<option value="pt">pt</option>
									<option value="mm">mm</option>
									<option value="cm">cm</option>
									<option value="in">in</option>
									<option value="em">em</option>
									<option value="ex">ex</option>
									<option value="%">%</option>
								</select>
							</li>
							<li>
								<label for="" style="padding-right: 11px; padding-left: 20px;">
									Right:</label>
								<input type="text" class="s_input" />
								<select class="s_input">
									<option selected="selected" value=""></option>
									<option value="px">px</option>
									<option value="pc">pc</option>
									<option value="pt">pt</option>
									<option value="mm">mm</option>
									<option value="cm">cm</option>
									<option value="in">in</option>
									<option value="em">em</option>
									<option value="ex">ex</option>
									<option value="%">%</option>
								</select>
							</li>
						</ul>
					</fieldset>
					<fieldset style="display: none;">
						<legend>Printing page breaks</legend>
						<ul>
							<li>
								<label for="Before" style="padding-right: 63px;">
									Before:</label>
								<select id="Before" class="xl_input">
									<option selected="selected"></option>
								</select>
							</li>
							<li>
								<label for="After" style="padding-right: 75px;">
									After:</label>
								<select id="After" class="m_input">
									<option selected="selected"></option>
								</select>
							</li>
						</ul>
					</fieldset>
				</fieldset>
			</div>
			<!-- / FLOW PANE -->
			<!-- EDGES PANE -->
			<div class="paneSwitch" id="psEdges">
				<fieldset style="float: left; width: 190px; margin-right: 4px;">
					<legend>Margins</legend>
					<ul>
						<li id="marginTop">
							<label for="" style="padding-right: 45px;">
								Top:</label>
							<input type="text" id="Text1" class="s_input" />
							<select id="Select1" class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="marginBottom">
							<label for="" style="padding-right: 27px;">
								Bottom:</label>
							<input type="text" id="Text2" class="s_input" />
							<select id="Select2" class="s_input">
								<option selected="selected"></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="marginLeft">
							<label for="" style="padding-right: 46px;">
								Left:</label>
							<input type="text" id="Text3" class="s_input" />
							<select id="Select3" class="s_input">
								<option selected="selected"></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="marginRight">
							<label for="" style="padding-right: 37px;">
								Right:</label>
							<input type="text" id="Text4" class="s_input" />
							<select id="Select4" class="s_input">
								<option selected="selected"></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset style="margin-bottom: 8px;">
					<legend>Padding</legend>
					<ul>
						<li id="paddingTop">
							<label for="" style="padding-right: 45px;">
								Top:</label>
							<input type="text" id="Text5" class="s_input" />
							<select id="Select5" class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="paddingBottom">
							<label for="" style="padding-right: 27px;">
								Bottom:</label>
							<input type="text" id="Text6" class="s_input" />
							<select id="Select6" class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="paddingLeft">
							<label for="" style="padding-right: 46px;">
								Left:</label>
							<input type="text" id="Text7" class="s_input" />
							<select id="Select7" class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
						<li id="paddingRight">
							<label for="" style="padding-right: 37px;">
								Right:</label>
							<input type="text" id="Text8" class="s_input" />
							<select id="Select8" class="s_input">
								<option selected="selected" value=""></option>
								<option value="px">px</option>
								<option value="pc">pc</option>
								<option value="pt">pt</option>
								<option value="mm">mm</option>
								<option value="cm">cm</option>
								<option value="in">in</option>
								<option value="em">em</option>
								<option value="ex">ex</option>
								<option value="%">%</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<div class="sampleText">
					<div class="InnerSquare">
						<!-- / -->
					</div>
				</div>
			</div>
			<!-- / EDGES PANE -->
			<!-- BORDER PANE -->
			<div class="paneSwitch" id="psBorders">
				<fieldset style="padding: 6px;margin-right: 6px;">
					<ul id="StyleBuilderBorderControl1">
						<li>
							<table id="bordersTableLayout1" cellpadding="0" cellspacing="0" border="0" width="340" style="table-layout: fixed;">
								<tr>
									<td style="width: 40px;"></td>
									<td style="width: 100px;">
										border-style:<br />
										<input type="checkbox" id="chkBorderStyleAll" checked="checked" /> Same for all
									</td>
									<td style="width: 100px;">
										border-width:<br />
										<input type="checkbox" id="chkBorderWidthAll" checked="checked" /> Same for all
									</td>
									<td style="width: 100px;">
										border-color:<br />
										<input type="checkbox" id="chkBorderColorAll" checked="checked" /> Same for all
									</td>
								</tr>
							</table>
							<table id="bordersTableLayout" cellpadding="0" cellspacing="0" border="0" width="320" style="table-layout: fixed;">
								<tr>
									<td style="width: 35px;text-align: right;">top:</td>
									<td style="width: 95px;">
										<select id="selBorderStyleTop" style="width: 97px;">
											<option value="" selected="selected"></option>
											<option value="none">None</option>
											<option value="dotted">Dotted</option>
											<option value="dashed">Dashed</option>
											<option value="solid">Solid Line</option>
											<option value="double">Double Line</option>
											<option value="groove">Groove</option>
											<option value="ridge">Ridge</option>
											<option value="inset">Inset</option>
											<option value="outset">Outset</option>
										</select>
									</td>
									<td style="width: 170px;">
										<select id="selBorderWidthTop">
											<option value="" selected="selected"></option>
											<option value="thin">Thin</option>
											<option value="medium">Medium</option>
											<option value="thick">Thick</option>
											<option value="custom">Custom</option>
										</select>
										<input id="txtBorderWidthValueTop" type="text" disabled="disabled" style="width: 25px;"/>
										<select id="selBorderWidthUnitTop" disabled="disabled" style="width: 48px;" >
											<option value="px">px</option>
											<option value="pc">pc</option>
											<option value="pt">pt</option>
											<option value="mm">mm</option>
											<option value="cm">cm</option>
											<option value="in">in</option>
											<option value="em">em</option>
											<option value="ex">ex</option>
											<option value="%">%</option>
										</select>
									</td>
									<td style="width: 30px;">
										<tools:ColorPicker ID="colorPickerBorderTop" runat="server"></tools:ColorPicker>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">right:</td>
									<td>
										<select id="selBorderStyleRight" disabled="disabled" style="width: 97px;">
											<option value="" selected="selected"></option>
											<option value="none">None</option>
											<option value="dotted">Dotted</option>
											<option value="dashed">Dashed</option>
											<option value="solid">Solid Line</option>
											<option value="double">Double Line</option>
											<option value="groove">Groove</option>
											<option value="ridge">Ridge</option>
											<option value="inset">Inset</option>
											<option value="outset">Outset</option>
										</select>
									</td>
									<td>
										<select id="selBorderWidthRigth" disabled="disabled">
											<option value="" selected="selected"></option>
											<option value="thin">Thin</option>
											<option value="medium">Medium</option>
											<option value="thick">Thick</option>
											<option value="custom">Custom</option>
										</select>
										<input id="txtBorderWidthValueRight" type="text" disabled="disabled" style="width: 25px;" disabled="disabled"/>
										<select id="selBorderWidthUnitRight" disabled="disabled" style="width: 48px;" disabled="disabled">
											<option value="px">px</option>
											<option value="pc">pc</option>
											<option value="pt">pt</option>
											<option value="mm">mm</option>
											<option value="cm">cm</option>
											<option value="in">in</option>
											<option value="em">em</option>
											<option value="ex">ex</option>
											<option value="%">%</option>
											</select>
									</td>
									<td>
										<tools:ColorPicker ID="colorPickerBorderRight" runat="server" Enabled="false" ></tools:ColorPicker>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">bottom:</td>
									<td>
										<select id="selBorderStyleBottom" disabled="disabled" style="width: 97px;">
											<option value="" selected="selected"></option>
											<option value="none">None</option>
											<option value="dotted">Dotted</option>
											<option value="dashed">Dashed</option>
											<option value="solid">Solid Line</option>
											<option value="double">Double Line</option>
											<option value="groove">Groove</option>
											<option value="ridge">Ridge</option>
											<option value="inset">Inset</option>
											<option value="outset">Outset</option>
										</select>
									</td>
									<td>
										<select id="selBorderWidthBottom" disabled="disabled">
											<option value="" selected="selected"></option>
											<option value="thin">Thin</option>
											<option value="medium">Medium</option>
											<option value="thick">Thick</option>
											<option value="custom">Custom</option>
										</select>
										<input id="txtBorderWidthValueBottom" type="text" disabled="disabled" style="width: 25px;" disabled="disabled" />
										<select id="selBorderWidthUnitBottom" disabled="disabled" style="width: 48px;" disabled="disabled" >
											<option value="px">px</option>
											<option value="pc">pc</option>
											<option value="pt">pt</option>
											<option value="mm">mm</option>
											<option value="cm">cm</option>
											<option value="in">in</option>
											<option value="em">em</option>
											<option value="ex">ex</option>
											<option value="%">%</option>
											</select>
									</td>
									<td>
										<tools:ColorPicker ID="colorPickerBorderBottom" runat="server" Enabled="false"></tools:ColorPicker>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">left:</td>
									<td>
										<select id="selBorderStyleLeft" disabled="disabled" style="width: 97px;">
											<option value="" selected="selected"></option>
											<option value="none">None</option>
											<option value="dotted">Dotted</option>
											<option value="dashed">Dashed</option>
											<option value="solid">Solid Line</option>
											<option value="double">Double Line</option>
											<option value="groove">Groove</option>
											<option value="ridge">Ridge</option>
											<option value="inset">Inset</option>
											<option value="outset">Outset</option>
										</select>
									</td>
									<td>
										<select id="selBorderWidthLeft" disabled="disabled">
											<option value="" selected="selected"></option>
											<option value="thin">Thin</option>
											<option value="medium">Medium</option>
											<option value="thick">Thick</option>
											<option value="custom">Custom</option>
										</select>
										<input id="txtBorderWidthValueLeft" type="text" disabled="disabled" style="width: 25px;" />
										<select id="selBorderWidthUnitLeft" disabled="disabled" style="width: 48px;">
											<option value="px">px</option>
											<option value="pc">pc</option>
											<option value="pt">pt</option>
											<option value="mm">mm</option>
											<option value="cm">cm</option>
											<option value="in">in</option>
											<option value="em">em</option>
											<option value="ex">ex</option>
											<option value="%">%</option>
										</select>
									</td>
									<td>
										<tools:ColorPicker ID="colorPickerBorderLeft" runat="server" Enabled="false" ></tools:ColorPicker>
									</td>
								</tr>
							</table>
							<div id="divBorderCollapse" style="margin-left:50px;display: none;">
								<input type="checkbox" id="chkBorderCollapse" /> collapse border
							</div>
						</li>
					</ul>
				</fieldset>
			</div>
			<!-- / BORDER PANE -->
			<!-- LISTS PANE -->
			<div class="paneSwitch" id="psLists">
				<fieldset>
					<ul>
						<li id="_listBulleted">
							<label for="Lists" style="padding-right: 58px;">
								Lists:</label>
							<select id="Lists" class="xl_input">
								<option selected="selected"></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="bulleted">Bulleted</option>
								<option value="none">Unbulleted</option>
							</select>
						</li>
					</ul>
				</fieldset>
				<fieldset>
					<legend>Bullets</legend>
					<ul>
						<li id="listStyleType">
							<label for="Select11" style="padding-right: 60px;">
								Style:</label>
							<select id="Select11" class="xl_input" disabled="disabled">
								<option selected="selected" value=""></option>
								<option value="none">&lt;Not Set&gt;</option>
								<option value="circle">Circle</option>
								<option value="disc">Disk</option>
								<option value="square">Square</option>
								<option value="decimal">1, 2, 3, 4 ...</option>
								<option value="lower-roman">Lowercase i, ii, iii, iv ...</option>
								<option value="upper-roman">Uppercase I, II, III, IV ...</option>
								<option value="lower-alpha">Lowercase a, b, c, d ...</option>
								<option value="upper-alpha">Uppercase A, B, C, D ...</option>
							</select>
						</li>
						<li id="listStylePosition">
							<label for="Select12" style="padding-right: 41px;">
								Position:</label>
							<select id="Select12" class="xl_input" disabled="disabled">
								<option selected="selected" value=""></option>
								<option value="">&lt;Not Set&gt;</option>
								<option value="outside">Outside (Text is indented in)</option>
								<option value="inside">Inside (text is not indented)</option>
							</select>
						</li>
						<li>
							<input type="checkbox" id="chkEnableCustom" disabled="disabled" style="border: 0;" /><label
								for="chkEnableCustom">Custom bullet</label>
							<ul id="listStyleImage">
								<li>
									<div style="display: block; float: left; width: 90px; text-overflow: ellipsis; overflow: hidden;
										padding-top: 8px;">
										<input type="radio" name="CustomBullet" id="optCustom" disabled="disabled" checked="checked"
											style="border: 0;" /><label for="optCustom">Image</label>
									</div>
									<div style="float: left;">
										<tools:ImageDialogCaller ID="imageBullet" runat="server" />
									</div>
								</li>
								<li style="clear: both;">
									<input type="radio" name="CustomBullet" id="optNone" disabled="disabled" style="border: 0;" /><label
										for="optNone">None</label></li>
							</ul>
						</li>
					</ul>
				</fieldset>
				<div class="sampleText ListsSample">
					<ul>
						<li>List Item 1, Line 1</li>
						<li>List Item 2, Line 2</li>
						<li>List Item 3, Line 3</li>
						<li>List Item 4, Line 4</li>
						<li>List Item 5, Line 5</li>
						<li>List Item 6, Line 6</li>
					</ul>
				</div>
			</div>
			<!-- / LISTS PANE -->
			<div class="radECtrlButtonsList">
				<button type="button" id="InsertButton" style="width: 100px;">

					<script type="text/javascript">
						setInnerHtml("InsertButton", localization["OK"]);
					</script>

				</button>
				<button type="button" id="CancelButton" onclick="Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close()"
					style="width: 100px;">

					<script type="text/javascript">
						setInnerHtml("CancelButton", localization["Cancel"]);
					</script>

				</button>
			</div>
		</td>
	</tr>
</table>

<script type="text/javascript">
	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorTextDecorationControl,
            {
            	"name": "textDecoration"
            }, null, null, $get("textDecoration"));
	});
	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorFontWeightControl,
            {
            	"name": "fontWeight"
            }, null, null, $get("fontWeight"));
	});
	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorFontSizeControl,
            {
            	"name": "fontSize"
            }, null, null, $get("fontSize"));
	});
	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorTextTransformControl,
            {
            	"name": "textTransform"
            }, null, null, $get("textTransform"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorBackgroundControl,
        {
        	"name": "background"
        }, null, null, $get("background"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorBackgroundPositionControl,
        {
        	"name": "backgroundPosition"
        }, null, null, $get("backgroundPosition"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorTextAlignControl,
        {
        	"name": "textAlign"
        }, null, null, $get("textAlign"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorVerticalAlignControl,
        {
        	"name": "verticalAlign"
        }, null, null, $get("verticalAlign"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorLetterSpacingControl,
        {
        	"name": "letterSpacing"
        }, null, null, $get("letterSpacing"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorLineHeightControl,
        {
        	"name": "lineHeight"
        }, null, null, $get("lineHeight"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorTextIndentControl,
        {
        	"name": "textIndent"
        }, null, null, $get("textIndent"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "direction"
        }, null, null, $get("direction"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "visibility"
        }, null, null, $get("visibility"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "display"
        }, null, null, $get("display"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "float"
        }, null, null, $get("float"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "clear"
        }, null, null, $get("clear"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "overflow"
        }, null, null, $get("overflow"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorClipControl,
        {
        	"name": "clip"
        }, null, null, $get("clip"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "marginTop"
        }, null, null, $get("marginTop"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "marginRight"
        }, null, null, $get("marginRight"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "marginBottom"
        }, null, null, $get("marginBottom"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "marginLeft"
        }, null, null, $get("marginLeft"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "paddingTop"
        }, null, null, $get("paddingTop"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "paddingRight"
        }, null, null, $get("paddingRight"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "paddingBottom"
        }, null, null, $get("paddingBottom"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleTextComboControl,
        {
        	"name": "paddingLeft"
        }, null, null, $get("paddingLeft"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "listStyleType"
        }, null, null, $get("listStyleType"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorSimpleComboControl,
        {
        	"name": "listStylePosition"
        }, null, null, $get("listStylePosition"));
	});

	Sys.Application.add_init(function()
	{
		$create(Telerik.Web.UI.EditorListStyleImageControl,
        {
        	"name": "listStyleImage"
        }, null, null, $get("listStyleImage"));
       });

	Sys.Application.add_init(function() {
		$create(Telerik.Web.UI.StyleBuilderBorderControl,
		{
			"name": "StyleBuilderBorderControl1"
		}, null, { "borderColorTop": "colorPickerBorderTop", "borderColorRight": "colorPickerBorderRight", "borderColorBottom": "colorPickerBorderBottom", "borderColorLeft": "colorPickerBorderLeft" }, $get("StyleBuilderBorderControl1"));
	});
</script>

<script type="text/javascript">
	var oSel = document.getElementById('_listBulleted').getElementsByTagName('select')[0];
	var oListType = document.getElementById('listStyleType').getElementsByTagName('select')[0];
	var oListPos = document.getElementById('listStylePosition').getElementsByTagName('select')[0];
	var oCustomCheck = document.getElementById('chkEnableCustom');
	var optNone = document.getElementById('optNone');
	var optCustom = document.getElementById('optCustom');
	var oUL = document.getElementById('listStyleImage').getElementsByTagName('input');
	
	oSel.onchange = function()
	{
		if ((oSel.value == "") || (oSel.value == "none"))
		{
			oListType.selectedIndex = 1;
			oListType.disabled = "disabled";
			oListPos.disabled = "disabled";
			oCustomCheck.disabled = "disabled";
		}
		else if (oSel.value == "bulleted")
		{
			oListType.disabled = "";
			oListPos.disabled = "";
			oCustomCheck.disabled = "";
		}
	}

	oCustomCheck.onclick = function()
	{
		if (oCustomCheck.checked)
		{
			for (var i = 0; i < oUL.length; i++)
			{
				oUL[i].disabled = "";
			}
		}
		else
		{
			for (var i = 0; i < oUL.length; i++)
			{
				oUL[i].disabled = "disabled";
			}
		}
	}

	optNone.onclick = function()
	{
		oUL[1].disabled = "disabled";
	}

	optCustom.onclick = function()
	{
		oUL[1].disabled = "";
	}

</script>