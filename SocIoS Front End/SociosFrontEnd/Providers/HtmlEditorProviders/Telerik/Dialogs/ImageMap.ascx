<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript">
//<!--
//TEKI: HACK - Cause the ImageMap dialog to reload in order to avoid the problems with cached version
//When the dialog is reworked, it will be made to work fine with caching

//note: this will not work in Safari in Debug mode (call stack exceeded). Switch compilation debug off to fix.

var wnd = Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference();
if (wnd.BrowserWindow && wnd.add_show)
{
	var fnInParentContext = new wnd.BrowserWindow.Function("sender", "args",
						"var handler = sender.get_contentFrame().contentWindow.fnInParentContext;" +
						"if (handler) sender.remove_show(handler);sender.reload();");
	wnd.add_show(fnInParentContext);
}


Type.registerNamespace("Telerik.Web.UI.Editor.DialogControls");
Telerik.Web.UI.Editor.DialogControls.ImageMapDialog = function(element)
{
	Telerik.Web.UI.Editor.DialogControls.ImageMapDialog.initializeBase(this, [element]);
	this._clientParameters = null;
	this._imageCaller = null;
}

var CIRCLESHAPE_BCKG_COLOR_NOT_SELECTED = '#33CCFF';
var CIRCLESHAPE_BCKG_COLOR_SELECTED		= '#33FFFF';
var AREA_SHAPE_CONSTANTS =
{
	DEFAULT_SHAPE_TYPE : "RECT",
	RECTANGLE_TYPE	: "RECT",
	CIRCLE_TYPE		: "CIRCLE",
	POLYGON_TYPE	: "POLY"
}

var IMAGE_MAP_DIALOG_CONTROL = null;

Telerik.Web.UI.Editor.DialogControls.ImageMapDialog.prototype =
{
	clientInit: function(clientParameters) 
	{
		this._clientParameters = clientParameters;

		var frame = $get("ImageMap_ImageMapFrame");
		this._window = frame.contentWindow;
		this._document = frame.contentWindow.document;

		//The global self reference used in all classes and global functions
		IMAGE_MAP_DIALOG_CONTROL = this;

		var textArea = $get("ImageMap_ImageMapHtml");
		this._document.open();
		this._document.write('<html><head></head><body style = "margin:0px 0px 0px 0px;font:11px Arial; color:red;background-color:white;" oncontextmenu="return false" unselectable="on">' + textArea.value + '</body></html>');
		this._document.close();

		//this.initializeImageMap(clientParameters, this);
		//Due to dialog caching, we need to introduce a small timeout.
		//Otherwise, the second time when the dialog is shown, its clientInit function is called before the dialog is actually visible.
		//This causes the RectangleShape.prototype.AreCoordsValid to return false, as image offsetWidth and offsetHeight are 0,
		//and thus it falsely assumes that the areas are outside of the image, thus not displaying them at all.
		//TODO: In fact, perhaps removing the check AreCoordsValid is perhaps the best way to go, as it is not needed really!
		window.setTimeout(Function.createDelegate(this, function() 
		{
			this.initializeImageMap(clientParameters, this);
		}), 100);

	},

	initializeImageMap: function(clientParameters) 
	{
		this.initializeImageDialogCaller(clientParameters);
		if (clientParameters.ImageSrc) 
		{
			var image = this.insertImageForMap();
			image.src = clientParameters.ImageSrc;

			if (clientParameters.ImageWidth) 
			{
				image.style.width = clientParameters.ImageWidth;
			}
			if (clientParameters.ImageHeight) 
			{
				image.style.height = clientParameters.ImageHeight;
			}

			this._imageCaller.set_value(clientParameters.ImageSrc);
			this.setDummyLayerOverImage(image);

			imageMap = new ImageMap(image);

			if (clientParameters.ImageMapHTML) 
			{
				imageMap.Initialize(clientParameters.ImageMapHTML);
			}

			this.showAreaControls();
		}
		else 
		{
			var element = this._document.createElement('CENTER');
			element.id = 'mappedImageText';
			element.innerHTML = this.get_string('SelectImage');
			this._document.body.appendChild(element);
		}

		RectangleShape.prototype.ContainerTitle = this.get_string('ShapeAlt');
		CircleShape.prototype.ContainerTitle = this.get_string('ShapeAlt');

		if (imageMap && imageMap.GetAreasNumber() > 0) 
		{
			this.ShowMapProps();
		}
		else 
		{
			RemoveAllAreas();
		}
	},

	CloseAreaPropsDlg: function() 
	{
		this._removeAreaButton.disabled = true;
		this._removeAllAreasButton.disabled = true;
		this._updateAreaButton.disabled = true;

		this.Area_Fields.area_link.disabled = true;
		this.Area_Fields.area_link.value = "";
		this.Area_Fields.area_target.disabled = true;
		this.Area_Fields.area_target.value = "";
		this.Area_Fields.area_comment.disabled = true;
		this.Area_Fields.area_comment.value = "";

		this.Rect_Fields.rect_x.disabled = true;
		this.Rect_Fields.rect_x.value = "";
		this.Rect_Fields.rect_y.disabled = true;
		this.Rect_Fields.rect_y.value = "";
		this.Rect_Fields.rect_width.disabled = true;
		this.Rect_Fields.rect_width.value = "";
		this.Rect_Fields.rect_height.disabled = true;
		this.Rect_Fields.rect_height.value = "";

		if (CurrentArea) 
		{
			CurrentArea.DeSelect();
		}
	},

	ShowRectPropsDlg: function(RectProps) 
	{
		this.Rect_Fields.rect_x.disabled = false;
		this.Rect_Fields.rect_x.value = RectProps.x;

		this.Rect_Fields.rect_y.disabled = false;
		this.Rect_Fields.rect_y.value = RectProps.y;

		this.Rect_Fields.rect_width.disabled = false;
		this.Rect_Fields.rect_width.value = RectProps.width;

		if (CurrentArea.Shape.Type == AREA_SHAPE_CONSTANTS.RECTANGLE_TYPE) 
		{
			this.Rect_Fields.rect_height.disabled = false;
			this.Rect_Fields.rect_height.value = RectProps.height;
		}
		else if (CurrentArea.Shape.Type == AREA_SHAPE_CONSTANTS.CIRCLE_TYPE) 
		{
			this.Rect_Fields.rect_height.disabled = true;
			this.Rect_Fields.rect_height.value = RectProps.width;
		}
	},

	ShowAreaPropsDlg: function(properties) 
	{
		this._removeAreaButton.disabled = false;
		this._removeAllAreasButton.disabled = false;
		this._updateAreaButton.disabled = false;

		this.Area_Fields.area_link.disabled = false;
		this.Area_Fields.area_link.value = properties.Link ? properties.Link : 'http://';
		this.Area_Fields.area_target.disabled = false;
		this.Area_Fields.area_target.value = properties.Target;
		this.Area_Fields.area_comment.disabled = false;
		this.Area_Fields.area_comment.value = properties.Comment;

		this.ShowMapProps();
	},

	getSelectedShapeType: function() 
	{
		for (var i = 0; i < this._shapeTypeRadioButtons.length; i++) 
		{
			if (this._shapeTypeRadioButtons[i].checked) 
			{
				return this._shapeTypeRadioButtons[i].value;
			}
		}
		return AREA_SHAPE_CONSTANTS.DEFAULT_SHAPE_TYPE;
	},

	insertNewMapArea: function(x, y, width, height) 
	{
		var type = this.getSelectedShapeType();
		if (type != AREA_SHAPE_CONSTANTS.CIRCLE_TYPE && type != AREA_SHAPE_CONSTANTS.RECTANGLE_TYPE) 
		{
			type = AREA_SHAPE_CONSTANTS.DEFAULT_TYPE;
		}

		if (typeof (x) === "undefined") 
		{	//set default values if the parameters are omitted
			var image = this._document.getElementById("mappedImage");
			if (!image) 
			{
				//no image selected, do nothing
				return;
			}
			if (image.offsetWidth < 40 || image.offsetHeight < 40) 
			{
				x = 0; y = 0; width = 1; height = 1;
			}
			else 
			{
				x = 10; y = 10; width = 20; height = 20;
			}
		}

		if (this._document.body.scrollLeft > 0 || this._document.body.scrollTop > 0) 
		{
			x += this._document.body.scrollLeft;
			y += this._document.body.scrollTop;
		}
		else 
		{
			this._document.body.scrollLeft = 0;
			this._document.body.scrollTop = 0;
		}

		this.focusImageMap();

		var area = imageMap.AddNewArea(type, x, y, width, height);
		if (area != null) 
		{
			area.Shape.OnSelect();
		}
		return area;
	},

	focusImageMap: function() 
	{
		try { this._document.body.focus(); } catch (e) { }
	},

	_addAreaButtonClickHandler: function() 
	{
		this.insertNewMapArea();
	},

	_removeAreaButtonClickHandler: function() 
	{
		if (window.confirm(localization["AlertDeleteArea"])) 
		{
			RemoveArea();
		}
	},

	_removeAllAreasButtonClickHandler: function() 
	{
		if (window.confirm(localization["AlertDeleteAllAreas"])) 
		{
			RemoveAllAreas();
		}
	},

	_updateAreaButtonClickHandler: function() 
	{
		if (this._updateAreaButton.disabled) 
		{
			return true;
		}
		if (!this.UpdateRectPropsDlg()) 
		{
			return;
		}

		var AreaProps = {
			Link: this.Area_Fields.area_link.value,
			Comment: this.Area_Fields.area_comment.value,
			Target: this.Area_Fields.area_target.value
		};
		UpdateAreaProps(AreaProps);
	},

	_okButtonClickHandler: function() 
	{
		this.returnNewImageMap();
	},

	_cancelButtonClickHandler: function() 
	{
		this.closeDialog();
	},


	setupChildren: function() 
	{
		this._addAreaButton = $get("ImageMap_NewArea");
		$addHandlers(this._addAreaButton, { "click": this._addAreaButtonClickHandler }, this);

		this._removeAreaButton = $get("ImageMap_RemoveArea");
		$addHandlers(this._removeAreaButton, { "click": this._removeAreaButtonClickHandler }, this);

		this._removeAllAreasButton = $get("ImageMap_RemoveAllAreas");
		$addHandlers(this._removeAllAreasButton, { "click": this._removeAllAreasButtonClickHandler }, this);

		this._updateAreaButton = $get("ImageMap_UpdateArea");
		$addHandlers(this._updateAreaButton, { "click": this._updateAreaButtonClickHandler }, this);

		this._okButton = $get("ImageMap_OK");
		$addHandlers(this._okButton, { "click": this._okButtonClickHandler }, this);

		this._cancelButton = $get("ImageMap_Cancel");
		$addHandlers(this._cancelButton, { "click": this._cancelButtonClickHandler }, this);

		this.Area_Fields = {};
		this.Area_Fields.area_link = $get("ImageMap_AreaURL");
		this.Area_Fields.area_target = $get("ImageMap_AreaTarget");
		this.Area_Fields.area_comment = $get("ImageMap_AreaComment");

		this.Rect_Fields = {};
		this.Rect_Fields.rect_x = $get("ImageMap_AreaLeft");
		this.Rect_Fields.rect_y = $get("ImageMap_AreaTop");
		this.Rect_Fields.rect_width = $get("ImageMap_AreaWidth");
		this.Rect_Fields.rect_height = $get("ImageMap_AreaHeight");

		this._shapeTypeRadioButtons = [];
		this._shapeTypeRadioButtons[0] = $get("ImageMap_Rect");
		this._shapeTypeRadioButtons[0].value = AREA_SHAPE_CONSTANTS.RECTANGLE_TYPE;

		this._shapeTypeRadioButtons[1] = $get("ImageMap_Circle");
		this._shapeTypeRadioButtons[1].value = AREA_SHAPE_CONSTANTS.CIRCLE_TYPE;
		this._shapeTypeRadioButtons[1].disabled = !this.circleShapeSupported();

	},

	initialize: function() 
	{
		Telerik.Web.UI.Editor.DialogControls.ImageMapDialog.callBaseMethod(this, 'initialize');
		this.setupChildren();
	},

	dispose: function() 
	{
		this._imageCaller = null;
		Telerik.Web.UI.Editor.DialogControls.ImageMapDialog.callBaseMethod(this, 'dispose');
		$clearHandlers(this._addAreaButton);
		$clearHandlers(this._removeAreaButton);
		$clearHandlers(this._removeAllAreasButton);
		$clearHandlers(this._updateAreaButton);
	},

	get_string: function(key) 
	{
		return key;
	},

	initializeImageDialogCaller: function(clientParameters) 
	{
		var ChangeImageSrc = function(sender) 
		{
			var src = sender.get_value();
			if (src) 
			{
				var imageTextElement = IMAGE_MAP_DIALOG_CONTROL._document.getElementById('mappedImageText');
				if (imageTextElement != null) 
				{	// remove the text that asks user to upload image
					imageTextElement.parentNode.removeChild(imageTextElement);
				}

				var imageElement = IMAGE_MAP_DIALOG_CONTROL._document.getElementById('mappedImage');
				if (imageElement == null) 
				{
					imageElement = IMAGE_MAP_DIALOG_CONTROL.insertImageForMap();
					imageMap = new ImageMap(imageElement);
				}
				imageElement.src = src;

				IMAGE_MAP_DIALOG_CONTROL.setDummyLayerOverImage(imageElement);
				IMAGE_MAP_DIALOG_CONTROL.showAreaControls();
			}
		}
		this._imageCaller = $find("ImageCaller");
		var imgButton = this._imageCaller.get_pushButton();
		if (imgButton && imgButton.title)
		{
			var localizedTitle = localization[imgButton.title];
			if (localizedTitle)
			{
				imgButton.title = localizedTitle;
			}
		}
		this._imageCaller.set_editor(clientParameters.editor);
		this._imageCaller.add_valueSelected(ChangeImageSrc);
	},

	showAreaControls: function() 
	{
		$get("area_controls").style.display = "block";
	},

	HideMapProps: function() 
	{
		//lini: don't hide the area, since it breaks the dialog layout
		//$get("map_props").style.display = "none";
	},

	ShowMapProps: function() 
	{
		$get("map_props").style.display = "";
	},

	insertImageForMap: function() 
	{
		var imageElement = this._document.createElement('IMG');
		imageElement.id = 'mappedImage';
		imageElement.setAttribute('unselectable', 'on');

		//Destroy all old content that could have been chached
		var imgs = this._document.getElementsByTagName("img");
		while (imgs.length > 0) 
		{
			imgs[0].parentNode.removeChild(imgs[0]);
		}

		this._document.body.appendChild(imageElement);

		return imageElement;
	},

	setDummyLayerOverImage: function(oImage) 
	{
		var oRect = RadEditorNamespace.Utils.GetRect(oImage);

		var oDummy = this._document.getElementById("dummy");
		oDummy.style.left = oRect.left;
		oDummy.style.top = oRect.top;
		oDummy.style.width = oRect.width;
		oDummy.style.height = oRect.height;

		$telerik.addExternalHandler(this._document, 'keydown', CheckKeyDown);
		$telerik.addExternalHandler(oDummy, 'mousedown', ImageMapper_OnMouseDown);
	},


	createAreaShapeByType: function(type) 
	{
		var shapeTypeConstructors = {};
		shapeTypeConstructors[AREA_SHAPE_CONSTANTS.RECTANGLE_TYPE] = RectangleShape;
		shapeTypeConstructors[AREA_SHAPE_CONSTANTS.POLYGON_TYPE] = PolygonShape;
		shapeTypeConstructors[AREA_SHAPE_CONSTANTS.CIRCLE_TYPE] = CircleShape;

		if (!shapeTypeConstructors[type]) 
		{
			type = AREA_SHAPE_CONSTANTS.DEFAULT_SHAPE_TYPE;
		}
		//TODO: Evaluate if this block is needed, because the dialog should
		// never try to create circle shapes if they are not supported.
		if (type == AREA_SHAPE_CONSTANTS.CIRCLE_TYPE && !this.circleShapeSupported()) 
		{
			return null;
		}
		return new shapeTypeConstructors[type]();
	},

	circleShapeSupported: function() 
	{
		//TODO Use the common browser detection code here
		if (!document.all) 
		{
			var canvas = document.createElement('canvas');
			if (!canvas.getContext) 
			{
				return false;
			}
		}
		return true;
	},

	UpdateRectPropsDlg: function() 
	{

		var RectProps =
		{
			x: this.Rect_Fields.rect_x.value,
			y: this.Rect_Fields.rect_y.value,
			width: this.Rect_Fields.rect_width.value,
			height: this.Rect_Fields.rect_height.value
		};
		var result = !UpdateRectProps(RectProps);
		if (result) 
		{
			alert(localization["AlertInvalidProperties"]);
			ShowRectProps();
			return false;
		}

		return true;
	},

	UpdateAreaPropsDlg: function() 
	{
		if (this._updateAreaButton.getAttribute("disabled", 2)) return true;

		if (!this.UpdateRectPropsDlg()) 
		{
			return false;
		}

		var AreaProps = {
			Link: this.Area_Fields.area_link.value,
			Comment: this.Area_Fields.area_comment.value,
			Target: this.Area_Fields.area_target.value
		};

		UpdateAreaProps(AreaProps);
		return true;
	},

	returnNewImageMap: function() 
	{
		var imageSrc = this.getMapImageSrc();
		if (imageSrc) 
		{
			if (this.UpdateAreaPropsDlg()) 
			{
				var args =
				{
					"MapHtml": imageMap.GetHTML(),
					"ImageSrc": imageSrc
				}
				this.closeDialog(args);
			}
		}
		else 
		{
			this.closeDialog();
		}
	},

	closeDialog: function(args) 
	{
		Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close(args);
	},

	getMapImageSrc: function() 
	{
		var mappedImage = this._document.getElementById('mappedImage');
		if (mappedImage != null) 
		{
			return mappedImage.getAttribute("src", 2);
		}
		return null;
	}
}
Telerik.Web.UI.Editor.DialogControls.ImageMapDialog.registerClass('Telerik.Web.UI.Editor.DialogControls.ImageMapDialog', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);



/*********** IMAGE MAP ****************/

function ImageMap (ImageElement) {

	/**
 	 *
	 * Collection ofMapArea objects included in this ImageMap
	 *
	 * @type Array
	 */

	this.AreaCollection = [];

	// counter to assign map area id
	this.AreaIDCnt = 0;

	this.Name   = "ImageMap1";

	// the image to which the map will be applied
	this.Image = ImageElement;
}

/**
 *
 * Initialize all map properties and objects from the input map html
 *
 * @param MapHTML HTMLString in format:
				<map name="map">
					<area shape="rect" coords="93,126,197,177" href="#rect" target="_top" alt="react">
					<area shape="circle" coords="125,217,24" href="#oval" target="_blank" alt="oval">
					<area shape="poly" coords="336,224,395,281,452,226" href="#">
					<area shape="poly" coords="262,124,252,161,212,161,243,187,233,225,264,200,296,223,284,186,311,160,275,160" href="#">
					<area shape="poly" coords="147,253,93,293,113,360,181,362,202,295" href="#">
					<area shape="poly" coords="217,261,282,260,282,240,327,273,282,306,282,284,218,284" href="#">
				</map>

 *
 *
 * @type bool
 *
 * @return true on success initialization, false otherwise
 *
 */
ImageMap.prototype.Initialize = function (MapHTML) {

	if (MapHTML) {
		if (!this._InitFromHTMLString(MapHTML)) {
			return false;
		}
	}

	// ...
	return true;
}

/**
 *
 * @see Initialize
 * @private
 */
ImageMap.prototype._InitFromHTMLString = function (MapHTML) {

	var container = IMAGE_MAP_DIALOG_CONTROL._document.createElement('SPAN');
	container.innerHTML = MapHTML;

	var maps = container.getElementsByTagName('MAP');

	if (maps.length != 1)
	{
		return false; // "only" and "at least one" map area is allowed
	}

	var map		= maps[0];
	this.Name	= map.getAttribute('name');

	// populate the AreaCollection inside the map
	var areaCollection = map.getElementsByTagName('area');
	for (var i=0; i<areaCollection.length; i++ ) {

		var area = new MapArea(this.Image);
		area.ID = this.AreaIDCnt;

		if (!area.Initialize(areaCollection[i])) continue;

		if (this.AddArea(area))
		{
			area.Draw();
		}
	}


	return true;
}


/**
 *
 * Add new area to the collection of AreaCollection in the map
 *
 * @param MapArea Object
 * @type Bool
 * @return  true if the area has been added, false otherwise
 *
 */
ImageMap.prototype.AddArea = function (MapArea) {

	if (!this.IsAreaValid(MapArea)) {
		return false;
	}

	this.AreaCollection.push(MapArea);
	this.AreaIDCnt ++;

	return true;
}

ImageMap.prototype.AddNewArea = function (ShapeType, x, y, width, height) {

	var area = new MapArea(this.Image);
	area.ID = this.AreaIDCnt;

	if (!area.CreateDefaultShape(ShapeType, x, y, width, height)) {
		return null;
	}

	this.AddArea(area);
	area.Draw();
	return area;

}


ImageMap.prototype.GetAreaById = function (AreaID) {
	return this.AreaCollection[AreaID];
}

ImageMap.prototype.RemoveArea = function (AreaID) {
	var area = this.GetAreaById(AreaID);

	if (area != null) {
		area.Dispose();
	}
	this.AreaCollection[AreaID] = null;
}

ImageMap.prototype.IsAreaOverlaps = function (MapArea) {
	return false;
}

ImageMap.prototype.IsAreaValid = function (MapArea) {
	return !this.IsAreaOverlaps(MapArea);
}


ImageMap.prototype.GetHTML = function () {
	var _HTML = '';

	_HTML += '<map';

	_HTML += ' name="#'  + this.Name.replace('"','&#34;') + '"';

	_HTML += '>';

	for (var i=0; i<this.AreaCollection.length; i++) {
		if (this.AreaCollection[i] != null) {
			_HTML += this.AreaCollection[i].GetHTML();
		}
	}

	_HTML += '</map>';

	return _HTML;
}

ImageMap.prototype.GetAreasNumber = function () {
	var nr = 0;
	for (var i=0; i<this.AreaCollection.length; i++) {
		if (this.AreaCollection[i] != null) {
			nr++
		}
	}
	return nr;
}

/*********** MAP AREA ****************/

function MapArea (ImageElement) {

	this.Comment = '';
	this.Link	= '';
	this.Target  = '';

	// the image to which the map will be applied
	this.Image = ImageElement;
}


MapArea.prototype.GetHTML = function ()
{
	var _HTML = '';
	_HTML += '<area';
	_HTML += ' shape="'  + this.Shape.Type + '"';
	_HTML += ' coords="' + this.Shape.GetCoords() + '"';

	if (this.Link)
	{
		// about:* strings are auto addded from IE
		if ( this.Link.indexOf('about:blank') == 0 )
		{
			this.Link = this.Link.substr('about:blank'.length);
		}
		else if (this.Link.indexOf('about:') == 0)
		{
			this.Link = this.Link.substr('about:'.length);
		}
		_HTML += ' href="'   + this.Link.replace('"','&#34;') + '"';
	}

	if (this.Target)
	{
		_HTML += ' target="' + this.Target.replace('"','&#34;') + '"';
	}

	if (this.Comment)
	{
		_HTML += ' alt="' + this.Comment.replace('"','&#34;') + '"';
	}

	_HTML += '/>';

	return _HTML;
}

/**
 *
 * For a given AREA element initialize the MapArea props
 *
 * @param AreaElement HtmlElement from which to create the MapArea
 *
 */
MapArea.prototype.Initialize = function (AreaElement) {

	/**
	 *
	 * Initialize area Shape object
	 *
	 */
	var ShapeType = AreaElement.getAttribute('shape');
	if (!ShapeType) {
		ShapeType = AREA_SHAPE_CONSTANTS.DEFAULT_SHAPE_TYPE;
	}
	this.Shape = IMAGE_MAP_DIALOG_CONTROL.createAreaShapeByType(ShapeType);
	this.Shape.SetImage(this.Image);
	this.Shape.SetAreaId(this.ID);
	var Coords = AreaElement.getAttribute('coords');

	if (!this.Shape.AreCoordsValid(Coords)) {
		return false;
	}

	this.Shape.SetCoords(Coords);

	/**
	 *
	 * Set area properties
	 *
	 */
	 this.Comment	= AreaElement.getAttribute('alt');

	 this.Link		= AreaElement.getAttribute("href", 2);

	 if (this.Link)
	 {
		// this 'about:blank' string is auto added in the link href
		// because the editor internal iframe dont have a src set
		if ( this.Link.indexOf('about:blank') == 0 )
		{
			this.Link = this.Link.substr('about:blank'.length);
		}
		else if (this.Link.indexOf('about:') == 0)
		{
			this.Link = this.Link.substr('about:'.length);
		}
	 }

	 this.Target	= AreaElement.getAttribute('target');

	 return true;
}

MapArea.prototype.Draw = function () {

	this.Shape.Draw();
    this.Shape.OnSelect();
}


MapArea.prototype.Move = function (Props) {
	var ShapeProps = this.Shape.GetShapeProperties();

	if (Props.x) {
		ShapeProps.x += Props.x;
	}

	if (Props.y) {
		ShapeProps.y += Props.y;
	}

	var ShapeCoords = this.Shape.ShapePropsToCoords(ShapeProps);

	if (!this.Shape.AreCoordsValid(ShapeCoords)) {
		return false;
	}

	this.Shape.SetCoords(ShapeCoords);
	this.Shape.Draw();
	return true;
}

MapArea.prototype.SetSize = function (Props) {

	var ShapeProps = this.Shape.GetShapeProperties();
	if (Props.width) {
		ShapeProps.width = Props.width;
	}

	if (Props.height) {
		ShapeProps.height = Props.height;
	}

	var ShapeCoords = this.Shape.ShapePropsToCoords(ShapeProps);

	if (!this.Shape.AreCoordsValid(ShapeCoords)) {
		return false;
	}

	this.Shape.SetCoords(ShapeCoords);

	this.Shape.Resize(Props);

	return true;
}

MapArea.prototype.CreateDefaultShape = function (ShapeType, x, y, width, height) {
	this.Shape = IMAGE_MAP_DIALOG_CONTROL.createAreaShapeByType(ShapeType);
	this.Shape.SetImage(this.Image);
	this.Shape.SetAreaId(this.ID);

	var ShapeCoords = this.Shape.ShapePropsToCoords({
		x		: x,
		y		: y,
		width	: width,
		height	: height
	});

	if (!this.Shape.AreCoordsValid(ShapeCoords)) {

		return null;
	}

	return this.Shape.SetCoords(ShapeCoords);
}

MapArea.prototype.GetProperties = function () {
	return {
		Comment : this.Comment,
		Link	: this.Link,
		Target  : this.Target
	}
}

MapArea.prototype.SetProperties = function (Props) {
	this.Comment	= Props.Comment;
	this.Link		= Props.Link;
	this.Target		= Props.Target;
}

MapArea.prototype.SetSelected = function () {
	this.Shape.SetSelected();
}

MapArea.prototype.DeSelect = function () {
	this.Shape.DeSelect();
}


MapArea.prototype.Dispose = function () {
	this.Shape.Dispose();
	this.Image = null;
}



/*********** AREA SHAPE ****************/

/**
 *
 * Base class for the area shape types
 *
 */
function AreaShape () {
	this.Coords = "";
	this.Type   = "";
	this.ResizeElementClassName = "circ_shape_resizer";
}

AreaShape.prototype.GetType = function () {
	return this.Type;
}

AreaShape.prototype.GetCoords = function () {
	return this.Coords;
}

AreaShape.prototype.AreCoordsValid = function (Coords) {
	return false;
}

AreaShape.prototype.SetCoords = function (Coords) {

	if (!this.AreCoordsValid(Coords)) {
		return false;
	}

	this.Coords = Coords;
	return true;
}

AreaShape.prototype.SetImage = function (ImageElement) {
	this.Image = ImageElement;
}

AreaShape.prototype.Resize = function (Props) {

}

AreaShape.prototype.SetAreaId = function (AreaID) {
	this.AreaID = AreaID;
}

AreaShape.prototype.CreateResizerElement = function () {

	/**
	 *
	 * Create a new Resizer
	 *
	 */
	var ResizeElement = IMAGE_MAP_DIALOG_CONTROL._document.createElement('DIV');

	ResizeElement.id				= 'res_' + this.AreaID;
	ResizeElement.className			= this.ResizeElementClassName;
	ResizeElement.style.width		= 5;
	ResizeElement.style.height		= 5;
	ResizeElement.style.position	= 'absolute';
	ResizeElement.style.display	    = 'none';
	return IMAGE_MAP_DIALOG_CONTROL._document.body.appendChild(ResizeElement);
}

AreaShape.prototype.GetShapeProperties = function () {
	return this.ShapeCoordsToProps(this.Coords);
}

AreaShape.prototype.SetSelected = function () {
}

AreaShape.prototype.DeSelect = function () {
}

AreaShape.prototype.Draw = function () {

}

AreaShape.prototype.OnSelect = function () {


}

AreaShape.prototype.Dispose = function () {

}



/*********** RECTANGLE SHAPE ****************/

function RectangleShape () {

	this.Type = AREA_SHAPE_CONSTANTS.RECTANGLE_TYPE;

	this.VisualFillElement = null;
	this.VisualBorderElement = null;
	this.ResizeElement = null;
	this.ResizeElementClassName = "rect_shape_resizer";
	this.SelectedClassName	    = "rect_shape_selected";
	this.NotSelectedClassName   = "rect_shape_not_selected";
	this.BorderElementClass     = "rect_shape_border";

}

// inherit from base
RectangleShape.prototype = new AreaShape();

// the alt text to be shown on mouver the shape area.
RectangleShape.prototype.ContainerTitle = '';

RectangleShape.prototype.Resize = function (Props) {
	if (Props.width) {
		var Width = Math.abs(Props.width);
		this.VisualFillElement.style.width   = Width - 1;
		this.VisualBorderElement.style.width = Width;
	}

	if (Props.height) {
		var Height = Math.abs(Props.height);
		this.VisualFillElement.style.height = Height - 1;
		this.VisualBorderElement.style.height = Height;
	}

	this.SetResizeElementPosition();
}

RectangleShape.prototype.Draw = function () {

	var ImageCoords = RadEditorNamespace.Utils.GetRect(this.Image);

	// remove any drawn object before
	if (this.VisualBorderElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.VisualBorderElement);
	}

	if (this.ResizeElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.ResizeElement);
	}

	/**
	 *
	 * Create a new Container
	 *
	 */
	var BorderContainer = IMAGE_MAP_DIALOG_CONTROL._document.createElement('DIV');
	var Container = IMAGE_MAP_DIALOG_CONTROL._document.createElement('DIV');

	BorderContainer.style.position	= 'absolute';
	BorderContainer.className	    = this.BorderElementClass;

	BorderContainer.title = this.ContainerTitle;

	var ShapeProps = this.GetShapeProperties();

	BorderContainer.style.top		= ImageCoords.top + ShapeProps.y;
	BorderContainer.style.left		= ImageCoords.left + ShapeProps.x;
	BorderContainer.style.width		= ShapeProps.width;
	BorderContainer.style.height	= ShapeProps.height;

	Container.className = this.NotSelectedClassName;
	Container.style.width	= ShapeProps.width - 1;
	Container.style.height	= ShapeProps.height - 1;

	BorderContainer.id = 'rect_' + this.AreaID;

	BorderContainer.ShapeObj	= this;
	BorderContainer.onclick	= this.HandleClick;

	BorderContainer.appendChild(Container);
	IMAGE_MAP_DIALOG_CONTROL._document.body.appendChild(BorderContainer);

	var ResizeElement = this.CreateResizerElement();

	this.VisualFillElement	 = Container;
	this.VisualBorderElement = BorderContainer;

	this.ResizeElement = ResizeElement;
	this.SetResizeElementPosition();

	/**** Move/Resize Event handlers **************/
	var self = this;
	var onMoveEnd = function()
	{
		var oRect  = RadEditorNamespace.Utils.GetRect(self.VisualBorderElement);
		var oRect2 = RadEditorNamespace.Utils.GetRect(self.Image);

		self.SetResizeElementPosition();
		
		//for some reason browser reports higher width and height ! a HACK subtracts them
		if ($telerik.isIE)
		{//1 px on IE
			oRect.width-=1;
			oRect.height-=1;
		}
		else if ($telerik.isFirefox)
		{//2 px on FF
			oRect.width-=2;
			oRect.height-=2;
		}
		
		var Coords = self.ShapePropsToCoords({
			x		: oRect.left - oRect2.left,
			y		: oRect.top - oRect2.top,
			width	: oRect.width,
			height	: oRect.height
		});

		if (self.AreCoordsValid(Coords)) {
			self.SetCoords(Coords);
		} else {
			self.Draw(); // roolback the previous state
		}
		self.OnSelect();
	}

	var onMove = function()
	{
		self.SetResizeElementPosition();
	};

	var onResize = function(fff, x, y)
	{

		BorderContainer.style.cursor = "SE-resize";
		var oRect = RadEditorNamespace.Utils.GetRect(BorderContainer);

												 // make the resize to be outside of the container
		var bottomX = oRect.left + oRect.width + parseInt(self.ResizeElement.style.width);
		var bottomY = oRect.top + oRect.height + parseInt(self.ResizeElement.style.height);

		var areaDivHeight = (oRect.height + y - bottomY);
		var areaDivWidth  = (oRect.width  + x - bottomX)

		var Props = {
			width  : areaDivWidth,
			height : areaDivHeight
		};

		self.Resize(Props);
	};

	var onResizeEnd = function()
	{
		BorderContainer.style.cursor = "move";
		onMoveEnd();
	};

	// add moveable behaviour
	var _t = new Draggable(BorderContainer, BorderContainer, null, onMove, onMoveEnd);

	// add resizable behaviour
	var _t2 = new Draggable(ResizeElement, ResizeElement, null, onResize, onResizeEnd);
}

RectangleShape.prototype.SetResizeElementPosition = function () {
	var VisualElStyle = this.VisualBorderElement.style;
																							 	// leave the resize to be outside of the container
	this.ResizeElement.style.top  = parseInt(VisualElStyle.top) + parseInt(VisualElStyle.height);// - parseInt(this.ResizeElement.style.height);
	this.ResizeElement.style.left = parseInt(VisualElStyle.left) + parseInt(VisualElStyle.width);// - parseInt(self.ResizeElement.style.width);

	this.ResizeElement.style.display = "block";
}

RectangleShape.prototype.HandleClick = function () {
	this.ShapeObj.OnSelect();
}

RectangleShape.prototype.SetSelected = function () {
	this.VisualFillElement.className = this.SelectedClassName;
	this.ResizeElement.style.display = 'block';
	this.VisualBorderElement.style.zIndex = 2;
	this.ResizeElement.style.zIndex = 2;

}

RectangleShape.prototype.DeSelect = function () {
	this.VisualFillElement.className = this.NotSelectedClassName;
	this.ResizeElement.style.display = 'none';
	this.VisualBorderElement.style.zIndex = 1;
	this.ResizeElement.style.zIndex = 1;
}

RectangleShape.prototype.ShapePropsToCoords = function (ShapeProps) {
	return ShapeProps.x + ',' +
		   ShapeProps.y + ',' +
		   (parseInt(ShapeProps.x) + parseInt(ShapeProps.width)) + ',' +
		   (parseInt(ShapeProps.y) + parseInt(ShapeProps.height));
}

RectangleShape.prototype.ShapeCoordsToProps = function (Coords) {
	var _Coords = Coords.split(',');
	var xLeft = parseInt(_Coords[0]);
	if (isNaN(xLeft)) xLeft = 0;
	var yTop = parseInt(_Coords[1]);
	if (isNaN(yTop)) yTop = 0;
	var xRight = parseInt(_Coords[2]);
	if (isNaN(xRight)) xRight = 0;
	var yBottom = parseInt(_Coords[3]);
	if (isNaN(yBottom)) yBottom = 0;

	return {
		x : xLeft,
		y : yTop,
		width   : xRight - xLeft,
		height  : yBottom - yTop
	}
}

/**
 *
 * Format of the 'coords' attribute for this shape type is
 * coords="x_left, y_top, x_right, y_bottom"
 *
 */
RectangleShape.prototype.AreCoordsValid = function (Coords) {

	var _Coords = Coords.split(',');

	// make sure there are exactly 4 coords
	if (_Coords.length != 4) {
		return false;
	}

	// make sure all coords are positive
	for (var i=0; i < _Coords.length; i ++) {
		if (_Coords[i] < 0) {
			return false;
		}
	}

	var ShapeProps = this.ShapeCoordsToProps(Coords);

	// test integrity - e.g. width and height > 0
	if (ShapeProps.width <= 0) {
		return false;
	}

	if (ShapeProps.height <= 0) {
		return false;
	}

	/* NEW: This "extra safety check" does no good to noone
	// test if the rect is not out of the image
	if ((ShapeProps.x + ShapeProps.width) > this.Image.offsetWidth) {
		return false;
	}

	if ((ShapeProps.y + ShapeProps.height) > this.Image.offsetHeight) {
		return false;
	}
	*/

	return true;

}

RectangleShape.prototype.Dispose = function () {
	this.VisualFillElement = null;

	if (this.VisualBorderElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.VisualBorderElement);
		this.VisualBorderElement = null;
	}

	if (this.ResizeElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.ResizeElement);
		this.ResizeElement = null;
	}
}

/*********** CIRCLE SHAPE ******************************************************************
********************************************************************************************/
function CircleShape () {
	this.Type = AREA_SHAPE_CONSTANTS.CIRCLE_TYPE;

	this.VisualElement = null;
	this.ResizeElement = null;

	this.SelectedClassName	  = "circ_shape_selected";
	this.NotSelectedClassName = "circ_shape_not_selected";

}

CircleShape.prototype = new AreaShape();

// the alt text to be shown on mouver the shape area.
CircleShape.prototype.ContainerTitle = '';

CircleShape.prototype.Resize = function (Props) {

	if (document.all) {
		if (Props.width) {
			this.VisualElement.style.width = Math.abs(Props.width);
			this.VisualElement.style.height = Math.abs(Props.width);
		}

		this.SetResizeElementPosition();
	} else {
		this.Draw();
	}
}

CircleShape.prototype.Draw = function (FFCircColor) {

	// remove any drawn object before
	if (this.VisualElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.VisualElement);
	}
	if (this.ResizeElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.ResizeElement);
	}

	var ImageCoords = RadEditorNamespace.Utils.GetRect(this.Image);
	var ShapeProps = this.GetShapeProperties();

	/**
	 *
	 * Create a new Container
	 *
	 */
	var Container = IMAGE_MAP_DIALOG_CONTROL._document.createElement('DIV');
	if (document.all) {

		// in IE - use VML to create the shape
		//
		Container.innerHTML = '<' + 'v:oval fillcolor="' + CIRCLESHAPE_BCKG_COLOR_NOT_SELECTED + '" style="position:absolute;" ></v:oval>';

	} else {

		// in FF - use Canvas element to create the shape
		// http://developer.mozilla.org/en/docs/Canvas_tutorial
		Container.innerHTML = '<canvas width="' + ShapeProps.width + '" height="' + ShapeProps.width + '"></canvas>';

	}

	Container = Container.childNodes[0];

	Container.style.position	= 'absolute';

	Container.title = this.ContainerTitle;

	Container.style.top		= ImageCoords.top + ShapeProps.y;
	Container.style.left	= ImageCoords.left + ShapeProps.x;

	if (!document.all) {

		// draw the shape in canvas holder
		// use getContext to use the canvas for drawing
		var ctx = Container.getContext('2d');

		ctx.beginPath();
		var radius     = parseInt(ShapeProps.width / 2);

		var x          = radius; // relative to the canvas
		var y          = radius;

		var startAngle = 0;
		var endAngle   = 360;

		ctx.arc(x, y, radius, startAngle, endAngle, false);

		if (!FFCircColor) {
			FFCircColor = CIRCLESHAPE_BCKG_COLOR_NOT_SELECTED;
		}

		ctx.fillStyle = FFCircColor;
		ctx.fill();

		ctx.stroke();
	} else {
	}

	Container.style.width	= ShapeProps.width;
	Container.style.height	= ShapeProps.width;

	Container.className = this.NotSelectedClassName;

	Container.id = 'circ_' + this.AreaID;

	Container.ShapeObj	= this;
	Container.onclick	= this.HandleClick;

	IMAGE_MAP_DIALOG_CONTROL._document.body.appendChild(Container);

	var ResizeElement = this.CreateResizerElement();

	this.VisualElement = Container;
	this.ResizeElement = ResizeElement;
	this.SetResizeElementPosition();

	/**** Move/Resize Event handlers **************/
	var self = this;
	var onMoveEnd = function()
	{

		var oRect  = RadEditorNamespace.Utils.GetRect(self.VisualElement);
		var oRect2 = RadEditorNamespace.Utils.GetRect(self.Image);

		self.SetResizeElementPosition();

		//lini: for some reason browser reports wrong width and height ! a HACK subtracts them
		if ($telerik.isIE)
		{
		 oRect.left+=1;
		 oRect.top+=1;
		 oRect.width-=2;
		}
		var Coords = self.ShapePropsToCoords({
			x		: oRect.left - oRect2.left,
			y		: oRect.top  - oRect2.top,
			width	: oRect.width
		});

		if (self.AreCoordsValid(Coords)) {

			self.SetCoords(Coords);
		} else {
			self.Draw(); // roolback the previous state
		}

		self.OnSelect();
	}

	var onMove = function()
	{
		self.SetResizeElementPosition();
	};

	var onResize = function(fff, x, y)
	{

		Container.style.cursor = "W-resize";
		var oRect = RadEditorNamespace.Utils.GetRect(Container);

												 // make the resize to be outside of the container
		var bottomX = oRect.left + oRect.width + parseInt(self.ResizeElement.style.width);

		var areaDivWidth  = (oRect.width +  (x - bottomX) )
		Container.style.width = (areaDivWidth > 0 ? areaDivWidth : 0)+ "px";
		Container.style.height = Container.style.width;

		self.SetResizeElementPosition();

	};

	var onResizeEnd = function()
	{
		Container.style.cursor = "move";
		onMoveEnd();
	};

	// add moveable behaviour
	var _t = new Draggable(Container, Container, null, onMove, onMoveEnd);

	// add resizable behaviour
	var _t2 = new Draggable(ResizeElement, ResizeElement, null, onResize, onResizeEnd);
}

CircleShape.prototype.SetResizeElementPosition = function () {

	var VisualElStyle = this.VisualElement.style;

	var CircleRadius  = parseInt(VisualElStyle.width) / 2;

	var SquareWidth   = parseInt(VisualElStyle.width);

	var TopPos = parseInt(VisualElStyle.top) + CircleRadius;
	var LeftPos = parseInt(VisualElStyle.left) + SquareWidth;

	this.ResizeElement.style.top  = TopPos;
	this.ResizeElement.style.left = LeftPos;

	/**
		a little mathematics comes to live
		if we want to have the resize element in bottom right

		var Diagonal = Math.sqrt(SquareWidth * SquareWidth * 2);
		var AB = Diagonal/2 - CircleRadius;
		var BC = Math.sqrt(Math.pow(AB,2)/2);

		this.ResizeElement.style.top  = parseInt(VisualElStyle.top) + SquareWidth - BC;
		this.ResizeElement.style.left = parseInt(VisualElStyle.left) + SquareWidth - BC;


	**/

	this.ResizeElement.style.display = "block";
}

CircleShape.prototype.HandleClick = function () {
	this.ShapeObj.OnSelect();
}

CircleShape.prototype.SetSelected = function () {
	if (document.all) {
		this.VisualElement.fillColor = CIRCLESHAPE_BCKG_COLOR_SELECTED;
	} else {
		this.Draw(CIRCLESHAPE_BCKG_COLOR_SELECTED);
	}

	this.VisualElement.className = this.SelectedClassName;
	this.ResizeElement.style.display = 'block';

	this.VisualElement.style.zIndex = 2;
	this.ResizeElement.style.zIndex = 2;


}

CircleShape.prototype.DeSelect = function () {

	if (document.all) {
		this.VisualElement.fillColor = CIRCLESHAPE_BCKG_COLOR_NOT_SELECTED;
	} else {
		this.Draw(CIRCLESHAPE_BCKG_COLOR_NOT_SELECTED);
	}

	this.VisualElement.className = this.NotSelectedClassName;
	this.ResizeElement.style.display = 'none';
	this.VisualElement.style.zIndex = 1;
	this.ResizeElement.style.zIndex = 1;

}

CircleShape.prototype.ShapePropsToCoords = function (ShapeProps) {
	var Radius = parseInt(ShapeProps.width)/2;

	return (parseInt(ShapeProps.x) + Radius) + ',' +
		   (parseInt(ShapeProps.y) + Radius) + ',' +
		   Radius;
}

CircleShape.prototype.ShapeCoordsToProps = function (Coords) {
	var _Coords = Coords.split(',');

	var CenterLeft	= parseInt(_Coords[0]);
	var CenterTop	= parseInt(_Coords[1]);
	var Radius	    = parseInt(_Coords[2]);

	return {
		x : CenterLeft - Radius,
		y : CenterTop - Radius,
		width : (Radius * 2)
	}
}

/**
 *
 * Format of the 'coords' attribute for this shape type is
 * coords="center_x, center_y, radius"
 *
 */
CircleShape.prototype.AreCoordsValid = function (Coords) {

	var _Coords = Coords.split(',');

	// make sure there are exactly 3 coords
	if (_Coords.length != 3) {
		return false;
	}

	// make sure all coords are positive
	for (var i=0; i < _Coords.length; i ++) {
		if (_Coords[i] < 0) {
			return false;
		}
	}

	var ShapeProps = this.ShapeCoordsToProps(Coords);

	// test integrity - e.g. width and height > 0
	if (ShapeProps.x < 0) {
		return false;
	}
	if (ShapeProps.y < 0) {
		return false;
	}
	if (ShapeProps.width <= 0) {
		return false;
	}

	// test if the rect is not out of the image
	if ((ShapeProps.x + ShapeProps.width) > this.Image.offsetWidth) {
		return false;
	}

	if ((ShapeProps.y + ShapeProps.width) > this.Image.offsetHeight) {
		return false;
	}

	return true;

}

CircleShape.prototype.Dispose = function () {
	if (this.VisualElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.VisualElement);
		this.VisualElement = null;
	}
	if (this.ResizeElement) {
		IMAGE_MAP_DIALOG_CONTROL._document.body.removeChild(this.ResizeElement);
		this.ResizeElement = null;
	}
}
/*********** POLYGON SHAPE ****************/
function PolygonShape () {

	this.Type = AREA_SHAPE_CONSTANTS.POLYGON_TYPE;

}

PolygonShape.prototype = new AreaShape();

PolygonShape.prototype.Draw = function () {
	alert('draw polygon');
}

/*********** RADE Utils ****************/
if (typeof(RadEditorNamespace) == 'undefined')
{
	RadEditorNamespace = {};
}

RadEditorNamespace.Utils =
{
	GetRect : function(element)
	{
		if (!element)
		{
			element = this;
		}

		var left = 0;
		var top  = 0;

		var width = element.offsetWidth;
		var height = element.offsetHeight;

		while (element.offsetParent)
		{
			left += element.offsetLeft;
			top += element.offsetTop;

			element = element.offsetParent;
		}

		if (element.x)
			left = element.x;

		if (element.y)
			top = element.y;

		left   = RadEditorNamespace.Utils.GetIntValue(left, 0);
		top    = RadEditorNamespace.Utils.GetIntValue(top, 0);
		width  = RadEditorNamespace.Utils.GetIntValue(width, 0);
		height = RadEditorNamespace.Utils.GetIntValue(height, 0);

		return new RadEditorNamespace.Utils.Rectangle(left, top, width, height);
	},

	Rectangle : function (left, top, width, height)
	{
		this.left   = (null != left ? left : 0);
		this.top    = (null != top ? top : 0);
		this.width  = (null != width ? width : 0);
		this.height = (null != height ? height : 0);

		this.right  = left + width;
		this.bottom = top + height;
	},


	//function RadEditorNamespace.Utils.CancelEvent(eventArgs)
	CancelEvent : function (eventArgs)
	{
		if (!eventArgs) eventArgs = IMAGE_MAP_DIALOG_CONTROL._window.event;
		if (!eventArgs) return false;

		eventArgs.returnValue = false;
		eventArgs.cancelBubble = true;

		if (eventArgs.stopPropagation)
		{
			eventArgs.stopPropagation();
		}
		return false;
	},

	GetIntValue : function (sNumber, defaultValue)
	{
		if (!defaultValue)
			defaultValue = 0;

		var nNumber = parseInt(sNumber);
		return (isNaN(nNumber) ? defaultValue : nNumber);
	}
}

/************* DRAGGABLE ******************/
/*  Draggable element definition */
function Draggable(obj, objToMove, onDragStart, onDrag, onDragEnd)
{
	var objToMove  = objToMove != null ? objToMove : obj;

	this.obj = obj;
	this.objToMove = objToMove;
	this.onDragStart = onDragStart;
	this.onDrag = onDrag;
	this.onDragEnd = onDragEnd;
	this.zIndex = 0;

	var dragObj = this;

	obj.onmousedown = function(e)
	{
		if (dragObj.onDragStart) dragObj.onDragStart(objToMove);
		dragObj.elNode = objToMove;

		//Init pos
		var array = GetCursorPos(e);
		x = array[0];
		y = array[1];

		// Save starting positions of cursor and element.
		dragObj.cursorStartX = x;
		dragObj.cursorStartY = y;

		//Get current x and y!
		var oRect = RadEditorNamespace.Utils.GetRect(objToMove);
		dragObj.elStartLeft  = oRect.left;
		dragObj.elStartTop   = oRect.top;
		if (isNaN(dragObj.elStartLeft)) dragObj.elStartLeft = 0;
		if (isNaN(dragObj.elStartTop))  dragObj.elStartTop  = 0;

		objToMove.style.position = "absolute";
		/*
		seems like this is not needed.
		objToMove.style.top = oRect.top;
		objToMove.style.left = oRect.left;*///

		// Update element's z-index.
		dragObj.elNode.style.zIndex = ++dragObj.zIndex;

		// Capture mousemove and mouseup events on the page.
        $telerik.addExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mousemove", dragObj.DragGo);
        $telerik.addExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mouseup", dragObj.DragStop);

		RadEditorNamespace.Utils.CancelEvent(e? e : IMAGE_MAP_DIALOG_CONTROL._window.event);
	}

	this.DragGo = function(e)
	{
		// Get cursor position with respect to the page.
		var array = GetCursorPos(e);
		x = array[0];
		y = array[1];
		// Move drag element by the same amount the cursor has moved.
		var offsetX = (dragObj.elStartLeft + x - dragObj.cursorStartX);
		var offsetY = (dragObj.elStartTop  + y - dragObj.cursorStartY);

		dragObj.elNode.style.left =  offsetX + "px";
		dragObj.elNode.style.top  =  offsetY + "px";

		RadEditorNamespace.Utils.CancelEvent(e? e : IMAGE_MAP_DIALOG_CONTROL._window.event);
		//Get Iframe pos
		if (dragObj.onDrag) dragObj.onDrag(objToMove, x, y);
	}

	this.DragStop = function(event)
	{
	  //Stop capturing mousemove and mouseup events.
	  $telerik.removeExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mousemove", dragObj.DragGo);
	  $telerik.removeExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mouseup", dragObj.DragStop);

	  //In IE on second showing of the dialog there is a problem  - throws access denied for some reason, in Moz works OK
  	  try
  	  {
        if (dragObj.onDragEnd) dragObj.onDragEnd(objToMove);
      } catch (e){;}
	}

	// Global object to hold drag information.
	function GetCursorPos(e)
	{
		if (document.all)
		{
			x = IMAGE_MAP_DIALOG_CONTROL._window.event.clientX + IMAGE_MAP_DIALOG_CONTROL._document.documentElement.scrollLeft + IMAGE_MAP_DIALOG_CONTROL._document.body.scrollLeft;
			y = IMAGE_MAP_DIALOG_CONTROL._window.event.clientY + IMAGE_MAP_DIALOG_CONTROL._document.documentElement.scrollTop  + IMAGE_MAP_DIALOG_CONTROL._document.body.scrollTop;
		}
		else
		{
			x = e.clientX + IMAGE_MAP_DIALOG_CONTROL._window.scrollX;
			y = e.clientY + IMAGE_MAP_DIALOG_CONTROL._window.scrollY;
		}
		return [x,y];
	}
};

function ShowRectProps()
{
	if (null != CurrentArea)
	{
		var RectProps = CurrentArea.Shape.GetShapeProperties();
		IMAGE_MAP_DIALOG_CONTROL.ShowRectPropsDlg(RectProps);
	}
}


var CurrentArea = null;
RectangleShape.prototype.OnSelect = function ()
{
    try
    {
	    if (CurrentArea) {
		    CurrentArea.DeSelect();
	    }

	    CurrentArea = imageMap.GetAreaById(this.AreaID);

	    var AreaProps = CurrentArea.GetProperties ();
	    IMAGE_MAP_DIALOG_CONTROL.ShowAreaPropsDlg(AreaProps);

	    ShowRectProps();

	    CurrentArea.SetSelected();
    } catch (e){;}
}

CircleShape.prototype.OnSelect = function ()
{
    try
    {
	    if (CurrentArea) {
		    CurrentArea.DeSelect();
	    }

	    CurrentArea = imageMap.GetAreaById(this.AreaID);
	    var AreaProps = CurrentArea.GetProperties ();
	    IMAGE_MAP_DIALOG_CONTROL.ShowAreaPropsDlg(AreaProps);
	    ShowRectProps();
	    CurrentArea.SetSelected();
	} catch (e){;}

}

function UpdateAreaProps (AreaProps) {
	CurrentArea.SetProperties (AreaProps);
	CurrentArea.Shape.OnSelect();
}

function RemoveArea () {

	if (!imageMap || !CurrentArea) {
		return;
	}

	imageMap.RemoveArea(CurrentArea.ID);
	CurrentArea = null;
	IMAGE_MAP_DIALOG_CONTROL.CloseAreaPropsDlg();

	if (imageMap.GetAreasNumber() == 0)
	{
		IMAGE_MAP_DIALOG_CONTROL.HideMapProps();
	}
}

function RemoveAllAreas () {
	if (imageMap)
	{
		for (var i=0; i < imageMap.AreaCollection.length; i ++)
		{
			if (imageMap.AreaCollection[i] != null)
			{
			imageMap.RemoveArea(imageMap.AreaCollection[i].ID);
			}
		}
	}
	CurrentArea = null;
	IMAGE_MAP_DIALOG_CONTROL.CloseAreaPropsDlg();

	IMAGE_MAP_DIALOG_CONTROL.HideMapProps();
}


function CheckKeyDown (e) {
	if (!CurrentArea) {
		return;
	}
	if (e.keyCode == 46) {//delete key
		RemoveArea();
	} else if (e.keyCode == 37) { // left arrow
		CurrentArea.Move({x : -1, y : 0});
		CurrentArea.Shape.OnSelect();
	} else if (e.keyCode == 40) { // down arrow
		CurrentArea.Move({x : 0, y : 1});
		CurrentArea.Shape.OnSelect();
	} else if (e.keyCode == 38) { // UP arrow
		CurrentArea.Move({x : 0, y : -1});
		CurrentArea.Shape.OnSelect();
	} else if (e.keyCode == 39) { // right arrow
		CurrentArea.Move({x : 1, y : 0});
		CurrentArea.Shape.OnSelect();
	}
}

var imageMap;






/* END Image map utils */

/* Mapped Image utils */

var InitialOffsetX = 0;
var InitialOffsetY = 0;
function ImageMapper_OnMouseDown(e)
{
	var oEvent = (document.all) ? IMAGE_MAP_DIALOG_CONTROL._window.event : e;
	var oRect = RadEditorNamespace.Utils.GetRect(IMAGE_MAP_DIALOG_CONTROL._document.getElementById("mappedImage"));
	var ImageLeft = oRect.left;
	var ImageTop  = oRect.top;

	InitialOffsetX = oEvent.clientX - ImageLeft;
	InitialOffsetY = oEvent.clientY - ImageTop;

	IsMouseMoved = false;

	if (CurrentArea)
	{
		IMAGE_MAP_DIALOG_CONTROL.CloseAreaPropsDlg();
		CurrentArea  = null;
	}

	$telerik.addExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mousemove", ImageMapper_OnMouseMove);
	$telerik.addExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mouseup", ImageMapper_OnMouseUp);

	RadEditorNamespace.Utils.CancelEvent(oEvent);
}

function ImageMapper_OnMouseMove(e)
{
	var oEvent = (document.all) ? IMAGE_MAP_DIALOG_CONTROL._window.event : e;

	if (!CurrentArea) {
		var DefaultWidth  = 2;
		var DefaultHeight = 2;
		CurrentArea = IMAGE_MAP_DIALOG_CONTROL.insertNewMapArea(InitialOffsetX, InitialOffsetY, DefaultWidth, DefaultHeight);
		if (!CurrentArea) {
			return;
		}
	}

	IsMouseMoved = true;
	var oRect = RadEditorNamespace.Utils.GetRect(IMAGE_MAP_DIALOG_CONTROL._document.getElementById("mappedImage"));
	var ImageLeft = oRect.left;
	var ImageTop  = oRect.top;

	var offsetX = oEvent.clientX - ImageLeft;
	var offsetY = oEvent.clientY - ImageTop;

	var NewProps = {
		width  : Math.abs(offsetX - InitialOffsetX),
		height : Math.abs(offsetY - InitialOffsetY)
	};

	CurrentArea.SetSize(NewProps);
	RadEditorNamespace.Utils.CancelEvent(oEvent); // cancel it - so the image dont get selected
}

function ImageMapper_OnMouseUp()
{
	if (IsMouseMoved) {
		if (CurrentArea) {
			CurrentArea.Shape.OnSelect();
		}
	}
	$telerik.removeExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mousemove", ImageMapper_OnMouseMove);
	$telerik.removeExternalHandler(IMAGE_MAP_DIALOG_CONTROL._document, "mouseup"  , ImageMapper_OnMouseUp);

	IsMouseMoved = false;
}
/* END Mapped Image utils */

function UpdateRectProps (properties)
{
	if (!CurrentArea)
	{
		return;
	}

	var Coords = CurrentArea.Shape.ShapePropsToCoords(properties);
	if (!CurrentArea.Shape.AreCoordsValid(Coords))
	{
		return false;
	}

	CurrentArea.Shape.SetCoords(Coords);
	CurrentArea.Shape.Draw();
	return true;
}
// -->
</script>

<table cellpadding="0" cellspacing="0" class="reDialog ImageMapEditor" style="width: 100%;">
	<tr>
		<td style="vertical-align: top; padding: 0;">
			<fieldset>
				<legend>
					<script type="text/javascript">
					document.write(localization["Preview"]);
					</script>
				</legend>
				<iframe id="ImageMap_ImageMapFrame" style="height: 304px;" src="" height="100%" width="100%" frameborder="0"></iframe>
				<textarea id="ImageMap_ImageMapHtml" style="display: none" cols="" rows="">
						<style type="text/css">
						/*    RECTANGLE      */
						.rect_shape_selected
						{
							background-color:#33FFFF;
							-moz-opacity:0.4;
							font-size:1px;
							cursor:move;
						}
						.rect_shape_not_selected
						{
							background-color:#33ccff;
							-moz-opacity:0.4;
							font-size:1px;
							cursor:move;
						}
						.rect_shape_resizer
						{
							width:5;
							height:5;
							background-color:red;
							font-size:1px;
							position:absolute;
							cursor:SE-resize;
						}
						.rect_shape_border
						{
							border : 1px solid black;
						}
						/*    CIRCLE      */
						.circ_shape_selected
						{
							-moz-opacity:0.4;
							cursor:move;
						}
						.circ_shape_not_selected
						{
							-moz-opacity:0.4;
							cursor:move;
						}
						.circ_shape_resizer
						{
							width:5;
							height:5;
							background-color:red;
							font-size:1px;
							position:absolute;
							cursor:W-resize;
						}
						IMG
						{
							border: 1px solid black;
						}
						/* see below the circle bckg color define in JS -> CIRCLESHAPE_BCKG_COLOR_SELECTED */
						</style>
						<!--[if IE]><style type="text/css">

						.rect_shape_selected {
							filter:progid:DXImageTransform.Microsoft.Alpha(opacity=40);
						}
						.rect_shape_not_selected {
							filter:progid:DXImageTransform.Microsoft.Alpha(opacity=40);
						}
						.circ_shape_selected
						{
							filter:progid:DXImageTransform.Microsoft.Alpha(opacity=40);
						}
						.circ_shape_not_selected
						{
							filter:progid:DXImageTransform.Microsoft.Alpha(opacity=40);
						}
						v\:* {
							behavior: url(#default#VML);
						}

						</style><![endif]-->
						<div unselectable="on" id="dummy" style="position:absolute;">
							<table cellpadding="0" cellspacing="0" style="width:100%; height:100%;">
								<tr>
									<td unselectable="on" style="font-size: 1px;"><!-- / --></td>
								</tr>
							</table>
						</div>
					</textarea>
			</fieldset>
		</td>
		<td style="padding: 0; padding-left: 4px;">
			<table cellpadding="0" cellspacing="0" style="width: 330px;">
				<tr>
					<td>
						<fieldset style="width: 328px;">
							<legend>
								<script type="text/javascript">
								document.write(localization["ChooseImage"]);
								</script>
							</legend>
							<table cellpadding="0" cellspacing="0" style="margin: 8px 0;">
								<tr>
									<td>
										<div class="propertyLabel">
											<script type="text/javascript">
											document.write(localization["ChooseImage"]);
											</script>:
										</div>
									</td>
									<td>
										<tools:ImageDialogCaller id="ImageCaller" runat="server" />
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
				</tr>
				<tr>
					<td>
						<fieldset id="area_controls" style="width: 328px;">
							<legend>
								<script type="text/javascript">
								document.write(localization["SelectAreaShape"]);
								</script>
							</legend>
							<div style="padding: 8px 0; float: right; margin-right: 13px;">
							    <ul class="radECtrlButtonsList" style="float: left;">
								    <li style="float: left;">
									    <input type="radio" name="area" id="ImageMap_Rect" checked="checked" /><label for="ImageMap_Rect"><script type="text/javascript">document.write(localization["Rectangle"]);</script></label>
								    </li>
								    <li style="float: left;">
									    <input type="radio" name="area" id="ImageMap_Circle" /><label for="ImageMap_Circle"><script type="text/javascript">document.write(localization["Circle"]);</script></label>
								    </li>
								    <li style="float: left; padding-left: 40px;">
									    <button type="button" id="ImageMap_NewArea" style="width: 120px;">
										    <script type="text/javascript">
										    setInnerHtml("ImageMap_NewArea", localization["NewArea"]);
										    </script>
									    </button>
								    </li>
							    </ul>
							</div>
						</fieldset>
					</td>
				</tr>
				<tr>
					<td>
						<fieldset id="map_props" style="width: 328px;">
							<legend>
								<script type="text/javascript">
								document.write(localization["DefineAreaPropertiesLegend"]);
								</script>
							</legend>
							<style type="text/css">
							.DefineAreaProperties td
							{
								padding: 3px 0;
								_padding: 1px 0;
							}
							
							*+html .DefineAreaProperties td
							{
								padding: 1px 0;
								
							}
							</style>
							<table cellpadding="0" cellspacing="0" class="DefineAreaProperties">
								<tr>
									<td>
										<label class="propertyLabel" for="ImageMap_AreaLeft" style="width: 80px;">
											<script type="text/javascript">document.write(localization["Left"]);</script>:
										</label>
									</td>
									<td>
										<input type="text" id="ImageMap_AreaLeft" style="width: 26px;" /> px
									</td>
									<td>
										<label class="propertyLabel" for="ImageMap_AreaTop" style="width: 80px;"><script type="text/javascript">document.write(localization["Top"]);</script>:</label>
									</td>
									<td>
										<input type="text" id="ImageMap_AreaTop" style="width: 26px;" /> px
									</td>
								</tr>
								<tr>
									<td>
										<label for="ImageMap_AreaWidth" class="propertyLabel" style="width: 80px;">
											<script type="text/javascript">
											document.write(localization["Width"]);
											</script>:
										</label>
									</td>
									<td>
										<input type="text" id="ImageMap_AreaWidth" style="width: 26px;" /> px
									</td>
									<td>
										<label for="ImageMap_AreaHeight" class="propertyLabel" style="width: 80px;">
											<script type="text/javascript">
											document.write(localization["Height"]);
											</script>:
										</label>
									</td>
									<td>
										<input type="text" id="ImageMap_AreaHeight" style="width: 26px;" /> px
									</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" class="DefineAreaProperties">
								<tr>
									<td>
										<label class="propertyLabel" for="ImageMap_AreaURL" style="width: 80px;"><script type="text/javascript">document.write(localization["Url"]);</script>:</label>
									</td>
									<td>
										<input type="text" id="ImageMap_AreaURL" style="width: 216px;" />
									</td>
								</tr>
								<tr>
									<td>
										<label class="propertyLabel" for="ImageMap_AreaTarget" style="width: 80px;"><script type="text/javascript">document.write(localization["Target"]);</script>:</label>
									</td>
									<td>
										<select id="ImageMap_AreaTarget">
											<option value=""><script type="text/javascript">document.write(localization["Target"]);</script></option>
											<option value="_blank"><script type="text/javascript">document.write(localization["TargetBlank"]);</script></option>
											<option value="_parent"><script type="text/javascript">document.write(localization["TargetParent"]);</script></option>
											<option value="_self"><script type="text/javascript">document.write(localization["TargetSelf"]);</script></option>
											<option value="_top"><script type="text/javascript">document.write(localization["TargetTop"]);</script></option>
											<option value="_search"><script type="text/javascript">document.write(localization["TargetSearch"]);</script></option>
											<option value="_media"><script type="text/javascript">document.write(localization["TargetMedia"]);</script></option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<label class="propertyLabel" for="ImageMap_AreaComment" style="width: 80px;"><script type="text/javascript">document.write(localization["Comment"]);</script>:</label>
									</td>
									<td>
										<input type="text" id="ImageMap_AreaComment" style="width: 216px;" />
									</td>
								</tr>
							</table>
							<div style="padding: 9px 0 10px 0; float: right; margin-right: 17px;">
							    <table border="0" cellpadding="0" cellspacing="0">
							        <tr>
							            <td style="padding-right: 8px;">
							                <button type="button" id="ImageMap_UpdateArea">
								                <script type="text/javascript">
								                setInnerHtml("ImageMap_UpdateArea", localization["UpdateArea"]);
								                </script>
							                </button>
							            </td>
							            <td style="padding-right: 8px;">
							                <button type="button" id="ImageMap_RemoveArea">
								                <script type="text/javascript">
								                setInnerHtml("ImageMap_RemoveArea", localization["RemoveArea"]);
								                </script>
							                </button>
							            </td>
							            <td>
							                <button type="button" id="ImageMap_RemoveAllAreas">
								                <script type="text/javascript">
								                setInnerHtml("ImageMap_RemoveAllAreas", localization["RemoveAllAreas"]);
								                </script>
							                </button>
							            </td>
							        </tr>
							    </table>
							 </div>
						</fieldset>
						<table cellpadding="0" cellspacing="0" style="width: 100%">
							<tr>
								<td class="reBottomcell">
								    <table border="0" cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
		                                <tr>
		                                    <td>
									            <button type="button" id="ImageMap_OK">
										            <script type="text/javascript">
										            setInnerHtml("ImageMap_OK", localization["OK"]);
										            </script>
									            </button>
									        </td>
									        <td class="reRightMostCell">
									            <button type="button" id="ImageMap_Cancel">
										            <script type="text/javascript">
										            setInnerHtml("ImageMap_Cancel", localization["Cancel"]);
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
		</td>
	</tr>
</table>