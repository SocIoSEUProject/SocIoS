<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
	Type.registerNamespace("Telerik.Web.UI.Widgets");

	Telerik.Web.UI.Widgets.SilverlightPreviewer = function(element)
	{
		Telerik.Web.UI.Widgets.SilverlightPreviewer.initializeBase(this, [element]);
		this._currentItem = null;

		this._tab = null;
		this._multiPage = null;
		this._objectWidth = null;
		this._objectHeight = null;
		this._agBgrColor = null;
		this._agWindowless = null;
		this._agMinVersion = null;
		this._agAutoUpgrade = null;
		this._agEnableHtmlAccess = null;
	}

	Telerik.Web.UI.Widgets.SilverlightPreviewer.prototype = {
		initialize: function()
		{
			Telerik.Web.UI.Widgets.SilverlightPreviewer.callBaseMethod(this, "initialize");
			this._initializeChildren();
			this._initializeChildEvents();
		},

		_initializeChildren: function()
		{
			this._tab = $find("silverlightTabStrip");
			this._multiPage = $find("silverlightMultiPage");
			this._objectWidth = $get("ObjectWidth");
			this._objectHeight = $get("ObjectHeight");
			this._agBgrColor = $get("BackgroundColor");
			this._setComboLocalization(this._agBgrColor);
			this._agWindowless = $get("Windowless");
			this._agMinVersion = $get("MinVersion");
			this._agAutoUpgrade = $get("AutoUpgrade");
			this._agEnableHtmlAccess = $get("EnableHtmlAccess");
		},

		_initializeChildEvents: function()
		{
			this._tabClickDelegate = Function.createDelegate(this, this._tabClickHandler);
			this._tab.add_tabSelecting(this._tabClickDelegate);
		},

		_setComboLocalization: function(combo)
		{
			var options = combo.getElementsByTagName("option");
			for (var j = 0; j < options.length; j++)
			{
				var optName = options[j].text;
				if (localization[optName])
					options[j].text = localization[optName];
			}
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
					previewElement.innerHTML = this._createSilverlightElement();
					break;
				default:
					break;
			}
		},

		_getParams: function(element)
		{
			var params = {};

			params["source"] = this._currentItem.get_url();
			var background = this._agBgrColor.value;
			if (background) params["background"] = background;
			params["windowless"] = this._agWindowless.checked.toString();
			var minRuntimeVersion = this._agMinVersion.value;
			if (minRuntimeVersion) params["minRuntimeVersion"] = minRuntimeVersion;
			params["autoUpgrade"] = this._agAutoUpgrade.checked.toString();

			return params;
		},

		_getObjectAttributes: function()
		{
			var objectParams = {};

			var widthValue = this._objectWidth.value;
			if (isNaN(parseInt(widthValue, 10)) || parseInt(widthValue, 10).toString() != widthValue)
			{
				widthValue = "200";
			}
			objectParams["width"] = widthValue;

			var heightValue = this._objectHeight.value;
			if (isNaN(parseInt(heightValue, 10)) || parseInt(heightValue, 10).toString() != heightValue)
			{
				heightValue = "200";
			}
			objectParams["height"] = heightValue;

			objectParams["type"] = "application/x-silverlight-2";
			objectParams["data"] = "data:application/x-silverlight-2,";

			return objectParams;
		},

		_createSilverlightElement: function()
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
			//alt HTML for Silverlight objects:
			sb.append("<a href=\"http://go.microsoft.com/fwlink/?LinkID=124807\" style=\"text-decoration: none;\">");
			sb.append("<img src=\"http://go.microsoft.com/fwlink/?LinkId=108181\" alt=\"Get Microsoft Silverlight\" style=\"border-style: none;\">");
			sb.append("</a>");
			sb.append("</object>");

			return sb.toString();
		},

		_setInitialValues: function()
		{
			var previewElement = this._multiPage.findPageViewByID("previewPage").get_element();
			previewElement.innerHTML = "";

			this._objectWidth.value = "200";
			this._objectHeight.value = "200";
			this._agBgrColor.selectedIndex = 0;
			this._agWindowless.checked = false;
			this._agMinVersion.value = "2.0.31005.0";
			this._agAutoUpgrade.checked = true;
			this._agEnableHtmlAccess.checked = false;
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
				return this._createSilverlightElement();
			}
			return null;
		},

		populateObjectProperties: function(selectedObject)
		{
			//WARNING: Currently tested only in IE7:
			if (selectedObject.object)
			{
				this._objectWidth.value = (selectedObject.width) ? parseInt(selectedObject.width).toString() : "";
				this._objectHeight.value = (selectedObject.height) ? parseInt(selectedObject.height).toString() : "";
			}
		},

		dispose: function()
		{
			this._tabClickDelegate = null;
			this._tab = null;
			this._multiPage = null;
			this._objectWidth = null;
			this._objectHeight = null;
			this._agBgrColor = null;
			this._agWindowless = null;
			this._agMinVersion = null;
			this._agAutoUpgrade = null;
			this._agEnableHtmlAccess = null;

			Telerik.Web.UI.Widgets.SilverlightPreviewer.callBaseMethod(this, "dispose");
		}
	}

	Telerik.Web.UI.Widgets.SilverlightPreviewer.registerClass("Telerik.Web.UI.Widgets.SilverlightPreviewer", Telerik.Web.UI.Widgets.FilePreviewer);
</script>

<div id="SilverlightPreviewer" class="silverlightPreviewer">
	<telerik:RadToolBar ID="EmptyToolbar" runat="Server" Height="26px" Width="100%">
	</telerik:RadToolBar>
	<telerik:RadMultiPage ID="silverlightMultiPage" Height="300px" SelectedIndex="0"
		runat="server">
		<telerik:RadPageView ID="previewPage" runat="server">
			<div>
				&nbsp;</div>
		</telerik:RadPageView>
		<telerik:RadPageView ID="propertiesPage" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 267px; display: block;
				margin-top: 70px;" class="reControlsLayout">
				<tr>
					<td class="reLabelCell">
						<label for="ObjectWidth" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["Width"]);
								</script>

							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="ObjectWidth" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="ObjectHeight" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["Height"]);
								</script>

							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="ObjectHeight" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="BackgroundColor" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["BackgroundColor"]);
								</script>

							</span>
						</label>
					</td>
					<td class="reControlCell">
						<select id="BackgroundColor" class="FlashManagerCombo" style="width: 144px;">
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
				<tr>
					<td class="reLabelCell">
						<label for="Windowless" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["Windowless"]);
								</script>

							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="checkbox" id="Windowless" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="MinVersion" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["MinVersion"]);
								</script>

							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="text" id="MinVersion" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="AutoUpgrade" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["AutoUpgrade"]);
								</script>

							</span>
						</label>
					</td>
					<td class="reControlCell">
						<input type="checkbox" id="AutoUpgrade" />
					</td>
				</tr>
				<tr>
					<td class="reLabelCell">
						<label for="EnableHtmlAccess" class="reDialogLabel">
							<span style="text-align: right; width: 100px;">

								<script type="text/javascript">
									document.write(localization["EnableHtmlAccess"]);
								</script>

							</span></label>
					</td>
					<td class="reControlCell">
						<input type="checkbox" id="EnableHtmlAccess" />
					</td>
				</tr>
			</table>
		</telerik:RadPageView>
	</telerik:RadMultiPage>
	<telerik:RadTabStrip SelectedIndex="0" ID="silverlightTabStrip" Orientation="HorizontalBottom"
		Width="100%" runat="server" ShowBaseLine="true" MultiPageID="silverlightMultiPage">
		<Tabs>
			<telerik:RadTab Text="Preview" Value="Preview" Selected="true" />
			<telerik:RadTab Text="Properties" Value="Properties" />
		</Tabs>
	</telerik:RadTabStrip>
</div>
