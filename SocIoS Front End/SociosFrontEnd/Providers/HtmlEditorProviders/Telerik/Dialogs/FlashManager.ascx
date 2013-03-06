<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.FlashPreviewer = function(element)
{
	Telerik.Web.UI.Widgets.FlashPreviewer.initializeBase(this, [element]);
	this._currentItem = null;
	
	this._tab = null;
	this._tabClickDelegate = null;
	this._multiPage = null;
	
	this._classIdCheckBox = null; 
	this._classIDText = null;
	this._classIDLi = null;
	this._newImageWidth = null;
	this._newImageHeight = null;
	this._newImageUnits = null;
	this._flPlayCheckBox = null;
	this._flLoopCheckBox = null;
	this._flMenuCheckBox = null;
	this._flTranspBgrCheckBox = null;
	this._flHtmlAlign = null;
	this._flFlashalign = null;
	this._flBgrColor = null;
}

Telerik.Web.UI.Widgets.FlashPreviewer.prototype = {
	initialize : function() 
	{
		Telerik.Web.UI.Widgets.FlashPreviewer.callBaseMethod(this, "initialize");
		this._initializeChildren();
		this._initializeChildEvents();
	},

	_initializeChildren : function()
	{
		this._tab = $find("flashTabStrip");
		this._multiPage = $find("flashMultiPage");
		
		this._classIdCheckBox = $get("ClassID"); 
		this._classIDText = $get("ClassIDText");
		this._classIDLi = $get("ClassIDLi");
		this._newImageWidth = $get("NewImageWidth");
		this._newImageHeight = $get("NewImageHeight");
		this._newImageUnits = $get("NewImageUnits");
		this._flPlayCheckBox = $get("flPlay");
		this._flLoopCheckBox = $get("flLoop");
		this._flMenuCheckBox = $get("flMenu");
		this._flTranspBgrCheckBox = $get("flTranspBgr");
		this._flHtmlAlign = $get("flHtmlAlign");
		this._setComboLocalization(this._flHtmlAlign);
		this._flFlashalign = $get("flFlashalign");
		this._setComboLocalization(this._flFlashalign);
		this._flBgrColor = $get("flBgrColor");
		this._setComboLocalization(this._flBgrColor);
	},

	_initializeChildEvents : function()
	{
		this._tabClickDelegate = Function.createDelegate(this, this._tabClickHandler);
		this._tab.add_tabSelecting(this._tabClickDelegate);
		$addHandlers(this._classIdCheckBox, {"click" : this._classIdClickHandler}, this);
	},

	_setComboLocalization : function(combo)
	{
		var options = combo.getElementsByTagName("option");
		for(var j = 0; j < options.length; j++)
		{
			var optName = options[j].text;
			if (localization[optName])
				options[j].text = localization[optName];
		}
	},

	_tabClickHandler : function(sender, args)
	{
		if(!this._currentItem)
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
				previewElement.innerHTML = this._createFlashElement();
			break;
			default:
			break;
		}

	},

	_classIdClickHandler : function(e)
	{
		if(this._classIdCheckBox.checked)
		{
			this._classIDLi.style.display = "";
		}
		else
		{
			this._classIDLi.style.display = "none";
		}
	},

	_getParams : function(element)
	{
		var params = {};
		if (element == "object")
		{
			params["Movie"] = this._currentItem.get_url();
			params["play"] = this._flPlayCheckBox.checked.toString();
		}
		else
		{
			params["src"] = this._currentItem.get_url();
			if(isNaN(parseInt(this._newImageWidth.value, 10)) || parseInt(this._newImageWidth.value, 10).toString() != this._newImageWidth.value)
			{
				this._newImageWidth.value = "150";
			}
			params["width"] = this._newImageWidth.value;
			if(isNaN(parseInt(this._newImageHeight.value, 10)) || parseInt(this._newImageHeight.value, 10).toString() != this._newImageHeight.value)
			{
				this._newImageHeight.value = "150";
			}
			params["height"] = this._newImageHeight.value;
			params["type"] = "application/x-shockwave-flash";
			params["pluginspage"] = "http://www.macromedia.com/go/getflashplayer";
		}
		params["quality"] = this._newImageUnits.value;
		if(this._flTranspBgrCheckBox.checked) params["wmode"] = "transparent";
		//optional
		params["loop"] = this._flLoopCheckBox.checked.toString();
		params["menu"] = this._flMenuCheckBox.checked.toString();
		if (this._flHtmlAlign.value.toLowerCase() != "baseline")
			params["align"] = this._flHtmlAlign.value;
		if (this._flFlashalign.value.toLowerCase() != "lt")
			params["salign"] = this._flFlashalign.value;
		if (this._flBgrColor.value.length >0)
			params["bgcolor"] = this._flBgrColor.value;
		return params;
	},

	_getObjectAttributes : function()
	{
		var objectParams = {};
		if(this._classIdCheckBox.checked && this._classIDText.value && this._classIDText.value.length>0)
		{
			objectParams["classid"] = this._classIDText.value;
		}
		else
		{
			objectParams["classid"] = "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000";
		}

		if(isNaN(parseInt(this._newImageWidth.value, 10)) || parseInt(this._newImageWidth.value, 10).toString() != this._newImageWidth.value)
		{
			this._newImageWidth.value = "150";
		}
		objectParams["width"] = this._newImageWidth.value;
		if(isNaN(parseInt(this._newImageHeight.value, 10)) || parseInt(this._newImageHeight.value, 10).toString() != this._newImageHeight.value)
		{
			this._newImageHeight.value = "150";
		}
		objectParams["height"] = this._newImageHeight.value;
		if (this._flHtmlAlign.value && this._flHtmlAlign.value.toLowerCase() != "baseline")
		{
			objectParams["align"] = this._flHtmlAlign.value;
		}
		return objectParams;
	},

	_createFlashElement : function()
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
			sb.append(String.format("<param name=\"{0}\" value=\"{1}\">",member, params[member]));
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

	_setInitialValues : function()
	{
		this._classIDLi.style.display = "none";
		this._classIdCheckBox.checked = false;
		var previewElement = this._multiPage.findPageViewByID("previewPage").get_element();
		previewElement.innerHTML = "";

		this._classIDText.value = "";
		this._newImageWidth.value = "150";
		this._newImageHeight.value = "150"; 
		this._newImageUnits.selectedIndex = 0;
		this._flPlayCheckBox.checked = true;
		this._flLoopCheckBox.checked = false;
		this._flMenuCheckBox.checked = false;
		this._flTranspBgrCheckBox.checked = true;
		this._flHtmlAlign.selectedIndex = 0;
		this._flFlashalign.selectedIndex = 0;
		this._flBgrColor.selectedIndex = 0;
	},

	setItem : function(item)
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

	getResult : function()
	{
		if (this._currentItem && this._currentItem.get_type() == Telerik.Web.UI.FileExplorerItemType.File)
		{
			return this._createFlashElement();
		}
		return null;
	},

	populateObjectProperties : function(selectedObject)
	{
		//WARNING: Currently tested only in IE7:
		if (selectedObject.object)
		{
			if (selectedObject.classid)
			{
				this._classIdCheckBox.click();
				this._classIDText.value = selectedObject.classid;
			}
			this._newImageWidth.value = (selectedObject.width) ? parseInt(selectedObject.width).toString() : "";
			this._newImageHeight.value = (selectedObject.height) ? parseInt(selectedObject.height).toString() : "";

			this._flPlayCheckBox.checked = selectedObject.object.Playing;
			this._flLoopCheckBox.checked = selectedObject.object.Loop;
			this._flMenuCheckBox.checked = selectedObject.object.Menu;
			this._flTranspBgrCheckBox.checked = selectedObject.object.WMode.toLowerCase() == "transparent";

			this._selectOptionByValue(this._newImageUnits, selectedObject.object.Quality2, false, 0);
			this._selectOptionByValue(this._flHtmlAlign, selectedObject.align, false, 0);
			this._selectOptionByValue(this._flFlashalign, selectedObject.object.SAlign, false, 0);
			this._selectOptionByValue(this._flBgrColor, "#" + selectedObject.object.BGColor, false, 0);
		}
	},

	dispose : function() 
	{
		this._setInitialValues();
		this._tabClickDelegate = null;
		$clearHandlers(this._classIdCheckBox);
		this._tab = null;
		this._tabClickDelegate = null;
		this._multiPage = null;
		
		this._classIdCheckBox = null; 
		this._classIDText = null;
		this._classIDLi = null;
		this._newImageWidth = null;
		this._newImageHeight = null;
		this._newImageUnits = null;
		this._flPlayCheckBox = null;
		this._flLoopCheckBox = null;
		this._flMenuCheckBox = null;
		this._flTranspBgrCheckBox = null;
		this._flHtmlAlign = null;
		this._flFlashalign = null;
		this._flBgrColor = null;

		Telerik.Web.UI.Widgets.FlashPreviewer.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.FlashPreviewer.registerClass("Telerik.Web.UI.Widgets.FlashPreviewer", Telerik.Web.UI.Widgets.FilePreviewer);
</script>
<div id="FlashPreviewer" class="flashPreviewer">
    <telerik:RadToolBar ID="EmptyToolbar" runat="Server" Height="26px" Width="100%"></telerik:RadToolBar>
	<telerik:RadMultiPage ID="flashMultiPage" Height="300px" runat="server" SelectedIndex="0">
		<telerik:RadPageView ID="previewPage" runat="server">
			<div>&nbsp;</div>
		</telerik:RadPageView>
		<telerik:RadPageView ID="propertiesPage" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 267px; height: 300px;" class="reControlsLayout">
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
						<label for="NewImageWidth" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["Width"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="NewImageWidth" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="NewImageHeight" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["Height"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="NewImageHeight" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="NewImageUnits" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["Quality"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="NewImageUnits" class="FlashManagerCombo">
							<option selected="selected" value="high">high</option>
							<option value="medium">medium</option>
							<option value="low">low</option>
						</select>
					</td>
				</tr>
				<tr>
				    <td class="reLabelCell">
				        <label for="flPlay" class="reDialogLabel">
				            <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["Play"]);
						        </script>
						    </span>
						</label>
				    </td>
				    <td class="reControlCell">
				        <input type="checkbox" id="flPlay" />
				    </td>
				</tr>
				<tr>
					<td class="reLabelCell">
				        <label for="flLoop" class="reDialogLabel">
				            <span style="text-align: right; width: 100px;">
					            <script type="text/javascript">
					            document.write(localization["Loop"]);
					            </script>
					        </span>
					    </label>
					</td>
					<td class="reControlCell">
					    <input type="checkbox" id="flLoop" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
					    <label for="flMenu" class="reDialogLabel">
					        <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["FlashMenu"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
					    <input type="checkbox" id="flMenu" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
					     <label for="flTranspBgr" class="reDialogLabel">
					        <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["Transparent"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
					    <input type="checkbox" id="flTranspBgr" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="flHtmlAlign" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["HtmlAlign"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="flHtmlAlign" class="FlashManagerCombo">
							<option selected="selected" value="baseline">Baseline</option>
							<option value="bottom">Bottom</option>
							<option value="left">Left</option>
							<option value="middle">Middle</option>
							<option value="right">Right</option>
							<option value="texttop">TextTop</option>
							<option value="top">Top</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="flFlashalign" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["FlashAlign"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="flFlashalign" class="FlashManagerCombo">
							<option selected="selected" value="LT">LeftTop</option>
							<option value="LC">LeftCenter</option>
							<option value="LB">LeftBottom</option>
							<option value="TR">RightTop</option>
							<option value="RC">RightCenter</option>
							<option value="RB">RightBottom</option>
							<option value="CT">CenterTop</option>
							<option value="CC">CenterCenter</option>
							<option value="CB">CenterBottom</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="flBgrColor" class="reDialogLabel">
						    <span style="text-align: right; width: 100px;">
						        <script type="text/javascript">
						        document.write(localization["BackgroundColor"]);
						        </script>
						    </span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="flBgrColor" class="FlashManagerCombo">
							<option selected="selected" value="">NoColor</option>
							<option value="#000000" style="background-color: #000000;">Black</option>
							<option value="#0000ff" style="background-color: #0000ff;">Blue</option>
							<option value="#008000" style="background-color: #008000;">Green</option>
							<option value="#ffa500" style="background-color: #ffa500;">Orange</option>
							<option value="#ff0000" style="background-color: #ff0000;">Red</option>
							<option value="#ffffff" style="background-color: #ffffff;">White</option>
							<option value="#FFFF00" style="background-color: #FFFF00;">Yellow</option>
						</select>
					</td>
				</tr>
			</table>
		</telerik:RadPageView>
	</telerik:RadMultiPage>
	<telerik:RadTabStrip ID="flashTabStrip" Width="100%" Orientation="HorizontalBottom" runat="server" MultiPageID="flashMultiPage" 
		ShowBaseLine="true" SelectedIndex="0">
		<Tabs>
			<telerik:RadTab Text="Preview" Value="Preview" Selected="true" />
			<telerik:RadTab Text="Properties" Value="Properties" />
		</Tabs>
	</telerik:RadTabStrip>
</div>
