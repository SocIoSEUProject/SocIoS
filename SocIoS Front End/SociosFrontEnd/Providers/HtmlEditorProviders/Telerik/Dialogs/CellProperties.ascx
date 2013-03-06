<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");
Telerik.Web.UI.Widgets.CellProperties = function(element)
{
	Telerik.Web.UI.Widgets.CellProperties.initializeBase(this, [element]);

	this._cssClassSelector = null;
	this._cellAlignmentSelector = null;
	this._backgroundColorPicker = null;
	this._bgImageDialogCaller = null;
	this._cssText = "";

	this._columnWidthBox = null;
	this._columnHeightBox = null;

	this._columnWrapHolder = null;

	this._idHolder = null;

	this._editorObject = null;
	this._cellToModify = null;
	this._clientParameters = null;
	this._tablePreviewControl = null;
}

Telerik.Web.UI.Widgets.CellProperties.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.CellProperties.callBaseMethod(this, "initialize");
		this._initializeChildren();
	},

	_initializeChildren : function ()
	{
		this._cssClassSelector = $find("ClassSelectorCellCss");

		this._cellAlignmentSelector = $find("alignmentSelectorCellContent");
		this._backgroundColorPicker = $find("ColorPickerCellBackground");
		this._bgImageDialogCaller = $find("ImageCallerCellBackgroundImage");
		this._columnWidthBox = $find("SpinBoxCellWidth");
		this._columnHeightBox = $find("SpinBoxCellHeight");
		this._columnWrapHolder = $get("CellNoWrap");
		this._idHolder = $get("CellId");
		this._styleBuilder = $find("CellStyleBuilder");

		this._tablePreviewControl = new Telerik.Web.UI.Widgets.TablePreview();
		this._tablePreviewControl.set_previewHolder($get("CellProperties_PreviewTableHolder"));

		this._initializeChildEvents();
	},

	_initializeChildEvents : function()
	{
		//NEW: StyleBuilder
		this._styleBuilder.add_valueSelected(Function.createDelegate(this, this._styleBuilderClicked));
	},

	//NEW: StyleBuilder
	_styleBuilderClicked : function (oTool, args)
	{
		//Editor object is supplied to all dialogs in the dialog parameters
		var editor = this._clientParameters.editor;
		var callbackFunction = Function.createDelegate(this,function(sender, args)
		{
			//Returned link - TODO: Use args.get_value() when the dialog returm methods are changed to return proper args object
			var resulCell = args.get_value();
			this._cssText = resulCell.style.cssText;
			this._loadPropertyValues(resulCell);
		});

		//NEW: Use EditorCommandEventArgs
		var argument = new Telerik.Web.UI.EditorCommandEventArgs("StyleBuilder", null, this._cellToModify.cloneNode(true));

		Telerik.Web.UI.Editor.CommandList._getDialogArguments(argument, "*", editor, "StyleBuilder");
		argument.fontNames = editor.get_fontNames();
		editor.showDialog("StyleBuilder", argument, callbackFunction);
	},

	clientInit : function(clientParameters)
	{
		this._clientParameters = clientParameters;
		this._editorObject = this._clientParameters.editor;
		this._cssClasses = this._clientParameters.CellCssClasses;

		this._cellAlignmentSelector.setTagName("TD");

		this._bgImageDialogCaller.set_editor(this._editorObject);
		this._backgroundColorPicker.set_items(this._clientParameters.Colors);

		//localization
		this._cssClassSelector.set_showText(true);
		this._cssClassSelector.set_clearclasstext(localization["ClearClass"]);
		this._cssClassSelector.set_text(localization["ApplyClass"]);
		this._cssClassSelector.set_items(this._cssClasses);
		this._cssClassSelector.add_valueSelected(this._cssValueSelected);

	},

	_setCssPropertyValue : function(element, cssProperty, value, attribute)
	{
		if (!element || !cssProperty) return;
		if (attribute) element.removeAttribute(attribute);
		element.style[cssProperty] = value;
	},

	_cssValueSelected : function(oTool, args)
	{
		if (!oTool) return;
		var commandName = oTool.get_name();

		if("ApplyClass" == commandName)
		{
			var attribValue = oTool.get_selectedItem();
			oTool.updateValue(attribValue);
		}
	},
	set_cellToModify : function (value)
	{
		this._cellToModify = value;
		this._loadPropertyValues(this._cellToModify);
	},
	get_tablePreviewControl : function ()
	{
		return this._tablePreviewControl;
	},
	///////////////////////////////////// the fun starts here ///////////////

	_clear : function()
	{
		var EmptyCell = document.createElement('TD');
		EmptyCell.innerHTML = "&nbsp;";
		this._loadPropertyValues(EmptyCell);
	},

	_loadPropertyValues : function(cellToModify)
	{
		this._cellToModify = cellToModify;

		this._cssText = this._cellToModify.style.cssText;

		if (this._cellToModify.style.width == "")
		{
			this._columnWidthBox.set_value(this._cellToModify.width);
		}
		else
		{
			this._columnWidthBox.set_value(this._cellToModify.style.width);
		}
		if (this._cellToModify.style.height == "")
		{
			this._columnHeightBox.set_value(this._cellToModify.height);
		}
		else
		{
			this._columnHeightBox.set_value(this._cellToModify.style.height);
		}

		var oId = this._cellToModify.getAttribute("id"); //OPERA
		if (oId)
			this._idHolder.value = oId;
		else
			this._idHolder.value = "";

		var textAlign = this._cellToModify.style["textAlign"];
		var verticalAlign = this._cellToModify.style["verticalAlign"];
		var alignAttributeValue = this._cellToModify.getAttribute("align");
		var vAlignAttributeValue = this._cellToModify.getAttribute("vAlign");
		
		if((textAlign == "left" || textAlign == "center" || textAlign == "right") && (verticalAlign == "top" || verticalAlign == "middle" || verticalAlign == "bottom"))
			this._cellAlignmentSelector.updateValue(textAlign, verticalAlign);
	    else if(alignAttributeValue || vAlignAttributeValue)
		    this._cellAlignmentSelector.updateValue(alignAttributeValue, vAlignAttributeValue);
		else
			this._cellAlignmentSelector.updateValue(null, null);

		this._columnWrapHolder.checked = (this._cellToModify.style.whiteSpace == "nowrap") ? true : false;

		var backgroundColor = this._cellToModify.style.backgroundColor;
		this._backgroundColorPicker.set_color(backgroundColor);

		var cssClassVal = this._cellToModify.className;
		if (cssClassVal == null)
		{
			cssClassVal = "";
		}

		this._cssClassSelector.updateValue(cssClassVal);
		if (cssClassVal == "") this._cssClassSelector.set_selectedIndex(0);

		if (this._bgImageDialogCaller && this._cellToModify)
		{
			var imagePath = this._cellToModify.style.backgroundImage;
			imagePath = (!imagePath) ? "" : imagePath.substring(4, imagePath.length - 1);
			this._bgImageDialogCaller.set_value(imagePath);
		}

	},


	_updateMultiple : function(cells)
	{
		for (var i = 0; i < cells.length; i ++) {
			if (!this._update(cells[i])) {
				return false;
			}
		}
		return true;
	},

	//TEKI - Shortened this method 2 times + fixed a problem with setting width and height
	_update : function(cell)
	{
		if (typeof(cell) != 'undefined')
		{
			this._cellToModify = cell;
		}

		var oCell = this._cellToModify;
        if (!oCell) return false;
		
		oCell.style.cssText = this._cssText;

		//This must be set on top - before all else, because it is interfering with the style.width and style.height stuff
		if (oCell.style.cssText == '')
		{
			oCell.removeAttribute('style', false);
		}
		var theWidthValue = this._columnWidthBox.get_value();
		if (!this._isValueValid(theWidthValue))
		{
			return false;
		}


		oCell.removeAttribute("width", false);

		oCell.style.width = theWidthValue ? this._convertIntToPixel(theWidthValue) : "";//SAFARI - ConvertIntToPixel px

		var theHeightValue = this._columnHeightBox.get_value();
		if (!this._isValueValid(theHeightValue))
		{
			return false;
		}

		oCell.removeAttribute("height", false);
		oCell.style.height = theHeightValue ? this._convertIntToPixel(theHeightValue) : "";//SAFARI - px

		this._setAttribValue ("id", this._idHolder.value);

		this._setCssPropertyValue(oCell, "textAlign", this._cellAlignmentSelector.getAlign(), "align");
		this._setCssPropertyValue(oCell, "verticalAlign", this._cellAlignmentSelector.getVAlign(), "vAlign");

		if (oCell.style["backgroundColor"] != this._backgroundColorPicker.get_color())
		{
			this._setCssPropertyValue(oCell, "backgroundColor", this._backgroundColorPicker.get_color(), "bgColor");
		}

		var backgroundImage = this._bgImageDialogCaller.get_value();
		backgroundImage = (backgroundImage) ? "url(" + backgroundImage + ")" : "";
		this._setCssPropertyValue(oCell, "backgroundImage", backgroundImage, "background");

		var className = document.all? "className" : "class";
		this._setAttribValue (className, (this._cssClassSelector.get_value() != "") ? this._cssClassSelector.get_value() : null );

		var whiteSpaceValue = (this._columnWrapHolder.checked) ? "nowrap" : "";
		this._setCssPropertyValue(oCell, "whiteSpace", whiteSpaceValue, "noWrap");

		return true;
	},

	_isValueValid : function(value)
	{
		if (value == "") return true;
		var valueInt = parseInt(value, 10);
		if(!isNaN(valueInt))
		{
			//NEW support for all css units
			var isValidPercent = (valueInt + '%' == value);
			var isValidPixel = (valueInt + 'px' == value.toLowerCase());
			var isValidEm = (valueInt + 'em' == value.toLowerCase());
			var isValidEx = (valueInt + 'ex' == value.toLowerCase());
			var isValidIn = (valueInt + 'in' == value.toLowerCase());
			var isValidCm = (valueInt + 'cm' == value.toLowerCase());
			var isValidMm = (valueInt + 'mm' == value.toLowerCase());
			var isValidPt = (valueInt + 'pt' == value.toLowerCase());
			var isValidPc = (valueInt + 'pc' == value.toLowerCase());			
			var isValidNumber = (valueInt.toString() == value);

			if(isValidPercent || isValidPixel || isValidEm || isValidEx || isValidIn || isValidCm || isValidMm || isValidPt || isValidPc || isValidNumber)
			{
				return true;
			}
		}
		return false;
	},

	_convertIntToPixel : function(oVal)
	{
		var oNew = "" + oVal;

		if (oNew.indexOf("%") != -1)
		{
			return oNew;
		}
		else
		{
		    var arMatch = oNew.match(/(em|ex|px|in|cm|mm|pt|pc)$/); //NEW support for all css units
			oNew = parseInt(oNew);
			if (!isNaN(oNew))
			{
				oNew = (arMatch) ? oNew + arMatch[0] : oNew + "px"; //NEW support for all css units
				return oNew;
			}
		}
		return oVal;
	},

	/* TEKI new - optimize the code a bit through refactoring */
	_setAttribValue : function(attribName, oVal, forceVal)
	{
		if (oVal || (true == forceVal))//cellSpacing or cellPadding have by default 1 so we might want to set it to 0
		{
			this._cellToModify.setAttribute(attribName, oVal);
		}
		else
		{
			this._cellToModify.removeAttribute(attribName, false);
		}
	},

	/////////////////////////////////////////////////////////////////////////

	dispose : function()
	{
		this._clientParameters = null;
		this._cssClassSelector = null;
		this._cellAlignmentSelector = null;
		this._backgroundColorPicker = null;
		this._bgImageDialogCaller = null;

		this._columnWidthBox = null;
		this._columnHeightBox = null;

		this._columnWrapHolder = null;
		this._cellToModify = null;
		this._idHolder = null;

		this._editorObject = null;
		this._tablePreviewControl = null;

		Telerik.Web.UI.Widgets.CellProperties.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.CellProperties.registerClass('Telerik.Web.UI.Widgets.CellProperties', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>

<style type="text/css">
.tableWizardCellProperties td
{
	padding: 3px 0;
}
</style>
<table cellpadding="0" cellspacing="0" style="margin: 0 0 0 4px;">
	<tr>
		<td style="vertical-align: top;">
			<fieldset style="height: 398px;">
				<legend>
					<script type="text/javascript">document.write(localization["Preview"]);</script>
				</legend>
				<div id="CellProperties_PreviewTableHolder" style="overflow: auto; width: 385px;
					height: 381px;">
					<!---->
				</div>
			</fieldset>
		</td>
		<td style="vertical-align: top;">
			<fieldset style="height: 398px; width: 303px;">
				<legend>
					<script type="text/javascript">document.write(localization["Tab3HeaderText"]);</script>
				</legend>
				<table cellpadding="0" cellspacing="0" class="tableWizardCellProperties" style="margin: 40px 0 0 22px;">
					<tr>
						<td>
							<div class="propertyLabel" style="width: 90px;">
								<script type="text/javascript">document.write(localization["Height"]);</script>:
							</div>
						</td>
						<td>
							<tools:EditorSpinBox id="SpinBoxCellHeight" runat="server">
							</tools:EditorSpinBox>
							<script type="text/javascript">document.write(localization["PixelsOrPercents"]);</script>
						</td>
					</tr>
					<tr>
						<td>
							<div class="propertyLabel" style="width: 90px;">
								<script type="text/javascript">document.write(localization["Width"])</script>:
							</div>
						</td>
						<td>
							<tools:EditorSpinBox id="SpinBoxCellWidth" runat="server">
							</tools:EditorSpinBox>
							<script type="text/javascript">document.write(localization["PixelsOrPercents"]);</script>
						</td>
					</tr>
					<tr>
						<td>
							<div class="propertyLabel" style="width: 90px;">
								<script type="text/javascript">document.write(localization["ContentAlignment"]);</script>:
							</div>
						</td>
						<td>
							<tools:AlignmentSelector id="alignmentSelectorCellContent" runat="server">
							</tools:AlignmentSelector>
						</td>
					</tr>
					<tr>
						<td>
							<div class="propertyLabel" style="width: 90px;">
								<script type="text/javascript">document.write(localization["Background"]);</script>:
							</div>
						</td>
						<td>
							<tools:ColorPicker id="ColorPickerCellBackground" runat="server">
							</tools:ColorPicker>
						</td>
					</tr>
					<tr>
						<td style="padding: 3px 0;">
							<div class="propertyLabel" style="width: 90px;">
								<script type="text/javascript">document.write(localization["StyleBuilder"]);</script>
							</div>
						</td>
						<td style="padding: 3px 0;">
							<tools:StandardButton runat="server" id="CellStyleBuilder" ToolName="StyleBuilder" />
						</td>
					</tr>
					<tr>
						<td>
							<div class="propertyLabel" style="width: 90px;"><script type="text/javascript">document.write(localization["CssClass"]);</script>:</div>
						</td>
						<td>
							<tools:ApplyClassDropDown id="ClassSelectorCellCss" runat="server" Width="90px" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="cellbackImage" class="propertyLabel" style="width: 90px;">
								<script type="text/javascript">document.write(localization["BackgroundImage"]);</script>:
							</label>
						</td>
						<td>
							<tools:ImageDialogCaller id="ImageCallerCellBackgroundImage" runat="server">
							</tools:ImageDialogCaller>
						</td>
					</tr>
					<tr>
						<td>
							<label class="propertyLabel" for="CellId" style="width: 90px;"><script type="text/javascript">document.write(localization["Id"])</script>:</label>
						</td>
						<td>
							<input type="text" class="textinput" id="CellId" style="width: 100px;" />
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<input type="checkbox" id="CellNoWrap" style="border: 0;" />
							<label for="CellNoWrap"><script type="text/javascript">document.write(localization["NoTextWrapping"]);</script></label>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
</table>