<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor.DialogControls"
	TagPrefix="dc" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.ImagePreviewer = function(element)
{
	Telerik.Web.UI.Widgets.ImagePreviewer.initializeBase(this, [element]);
	this._tab = null;
	this._tabClickDelegate = null;
	this._multiPage = null;
	this._imageProperties = null;
	this._imageContainer = null;
	this._cleanImageContainer = null;
	this._previewedImage = null;
	this._containerBounds = null;
	this._originalBounds = null;
	this._toolbarClickDelegate = null;
	this._currentItem = "";
	this._selectedFileName = null;
	this._browser = null;
}

Telerik.Web.UI.Widgets.ImagePreviewer.prototype = {
	initialize: function()
	{
		Telerik.Web.UI.Widgets.ImagePreviewer.callBaseMethod(this, 'initialize');
		this._initializeChildren();
		this._initNoImageItem();
	},

	get_enableImageEditor: function()
	{
		return this._browser.get_enableImageEditor();
	},

	get_imageEditorFileSuffix: function()
	{
		return this._browser.get_imageEditorFileSuffix();
	},

	_initializeChildren: function()
	{
		this._tab = $find("imageTabStrip");
		this._multiPage = $find("imageMultiPage");
		this._imageContainer = this.get_element();
		this._containerBounds = $telerik.getContentSize(this._imageContainer);
		this._cleanImageContainer = $get("CleanImageContainer");

		this._toolbar = $find("ImagePreviewToolBar");
		this._toolbarClickDelegate = Function.createDelegate(this, this._toolbarClickHandler);
		this._toolbar.add_buttonClicked(this._toolbarClickDelegate);
		this._selectedFileName = $get("selectedFileName");
		this._imageProperties = $find("ImageProperties");
	},

	dispose: function()
	{
		this._toolbarClickDelegate = null;
		this._selectedFileName = null;
		Telerik.Web.UI.Widgets.ImagePreviewer.callBaseMethod(this, 'dispose');
	},

	_setTabsEnabled: function(enabled)
	{
		this._tab.get_tabs().forEach(function(item)
		{
			item.set_enabled(enabled);
		});
	},

	/* toolbar related code */
	_toolbarClickHandler: function(sender, args)
	{
		var buttonValue = args._item.get_value();
		switch (buttonValue)
		{
			case "BestFit":
				this._fitImage();
				break;
			case "ActualSize":
				this._adjustImage(this._originalBounds);
				break;
			case "ZoomIn":
				this._zoom(80);
				break;
			case "ZoomOut":
				this._zoom(-40);
				break;
			case "ImageEditor":
				this._openImageEditor();
				break;
		}
	},

	_setToolbarEnabled: function(enabled)
	{
		this._toolbar.get_items().forEach(function(item)
		{
			item.set_enabled(enabled);
		});
	},

	/* zoom related code */
	_zoom: function(zoomFactor)
	{
		if (this._previewedImage)
		{
			var size = this._getZoomedSize($telerik.getBounds(this._previewedImage), zoomFactor);
			if (size.width > 2 && size.height > 2) this._adjustImage(size); //limit the zoom out till the hight or width is more dan 1 px.
		}
	},

	_getZoomedSize: function(size, zoomFactor)
	{
		return {
			width: size.width * (1 + zoomFactor / 100),
			height: size.height * (1 + zoomFactor / 100)
		}
	},

	_adjustImage: function(size)
	{
		if (!this._previewedImage)
		{
			return;
		}
		var containerBounds = this._containerBounds;
		var topMargin = containerBounds.height - size.height;

		topMargin = topMargin < 0 ? 0 : Math.floor(topMargin / 2);
		//The image has CSS class set that wraps it in 1 px border.
		//This border can cause scrollbars to appear on parent if image height is equal to container height
		if (topMargin <= 2) topMargin = 0;

		this._previewedImage.width = size.width;
		this._previewedImage.height = size.height;

		this._previewedImage.style.marginTop = topMargin + "px";
	},

	_fitImage: function()
	{
		var imageBounds = this._originalBounds;
		var wrapperBounds = this._containerBounds;

		var hRatio = imageBounds.height / wrapperBounds.height;
		var wRatio = imageBounds.width / wrapperBounds.width;

		var ratio = 1;

		if (imageBounds.width > wrapperBounds.width && imageBounds.height > wrapperBounds.height)
		{
			ratio = hRatio >= wRatio ? hRatio : wRatio;
		}
		else if (imageBounds.width > wrapperBounds.width)
		{
			ratio = wRatio;
		}
		else if (imageBounds.height > wrapperBounds.height)
		{
			ratio = hRatio;
		}

		this._adjustImage({ width: Math.floor(imageBounds.width / ratio), height: Math.floor(imageBounds.height / ratio) - 4 });
	},

	/* image editor related code */
	_openImageEditor: function()
	{
		var selectedItem = this._currentItem;
		if (selectedItem != null && (selectedItem.get_permissions() & Telerik.Web.UI.FileExplorerItemPermissions.Upload) && selectedItem.get_type() == Telerik.Web.UI.FileExplorerItemType.File)
		{
			var browser = this.get_browser();
			var args = {};
			args.imageSrc = selectedItem.get_url();
			args.suffix = this.get_imageEditorFileSuffix();
			args.name = selectedItem.get_name();
			args.path = selectedItem.get_path();
			var callbackFunction = function(sender, args)
			{
				var newSrc = null;
				if (args && args.get_newImageSrc)
				{
					newSrc = args.get_newImageSrc();
				}
				if (newSrc)
				{
					newSrc = newSrc.substring(newSrc.lastIndexOf("/") + 1);
					browser.get_fileBrowser().refresh(newSrc);
				}
			}
			var dialogOpener = Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().get_dialogOpener();
			dialogOpener.open("ImageEditor", args, callbackFunction);
		}
	},

	_checkImageEditorDisplay: function()
	{
		var imageEditorItem = this._toolbar.findItemByValue("ImageEditor");
		if (imageEditorItem)
		{
			var selectedItem = this._currentItem;
			var hasPermission = this.get_enableImageEditor() ? selectedItem != null && (selectedItem.get_permissions() & Telerik.Web.UI.FileExplorerItemPermissions.Upload) : false;
			imageEditorItem.set_enabled(hasPermission ? true : false);
		}
	},

	/* previewer related code */
	setItem: function(item)
	{
		this._currentItem = item;
		if (item.get_type() == Telerik.Web.UI.FileExplorerItemType.Directory)
		{
			this._initNoImageItem();
		}
		else
		{
			this._initImageItem(item);
		}
	},

	getResult: function()
	{
		var newImage = this._imageProperties.getModifiedImage();
		if (newImage == null && this._currentItem)
		{
			//for example if image size is large and the user clicks insert before it is loaded.
			newImage = new Image();
			newImage.src = this._currentItem.get_url();
			newImage.setAttribute("alt", "");
		}
		return newImage;
	},

	getClonedImage: function(src)
	{
		var img = new Image();
		img.src = src;
		//Add to DOM so as to have width and height - else it returns zero
		this._cleanImageContainer.innerHTML = "";
		this._cleanImageContainer.appendChild(img);
		return img;
	},

	_initImageItem: function(item)
	{
		var img = new Image();
		this._previewedImage = null;
		var src = item.get_url();
		var displayName = item.get_name();

		src = encodeURI(src);
		img.style.border = "0";
		img.style.position = "absolute";
		img.style.top = "-10000px";
		img.style.left = "-10000px";

		this._selectedFileName.innerHTML = displayName;
		this._imageContainer.innerHTML = "";
		this._imageContainer.className = "imagePreview";
		this._imageContainer.appendChild(img);
		this._setToolbarEnabled(true);
		this._setTabsEnabled(true);
		this._checkImageEditorDisplay();

		//Force a loading handler - it will be called any time we set src to the image, even if it is cached
		//IMPORTANT! IE executes the load handler for CACHED images right after the handler is attached!
		//So, to ensure that all works OK, the image must be initialized and added to the parent container prior to setting the handler
		$addHandlers(img, { "load": this._imageLoadHandler }, this);
		//NOTE: we cannot use a random src to bypass the IE browser cache here, because it will make browsing images a lot slower
		img.src = src;
	},

	_imageLoadHandler: function(e)
	{
		//Clear the event handler, because otherwise in FireFox (and/or IE) there is infinite recursion
		//also clearing the handlers fixes a problem with animated GIF files in IE.
		//NEW: Amazingly in some unclear cases, e.target is null!
		if (e && e.target)
		{
			var img = e.target;
			$clearHandlers(img);
			this._setupPreviewedImage(img);
		}
	},

	_setupPreviewedImage: function(img)
	{
		if (!img)
		{
			return;
		}
		this._previewedImage = img;
		img.style.position = "";
		img.style.top = "";
		img.style.left = "";

		this._originalBounds = { width: img.width, height: img.height };
		this._fitImage();

		var cleanImg = this.getClonedImage(img.getAttribute("src", 2));
		var initialItem = this.get_browser().get_initialItem();
		if (initialItem && initialItem.getAttribute)
		{
			var cleanSrc = cleanImg.getAttribute("src", 2);
			var initialSrc = initialItem.getAttribute("src", 2);
			if (cleanSrc.length > 0 && initialSrc.length > 0 && initialSrc.indexOf(cleanSrc) == initialSrc.length - cleanSrc.length)
			{
				cleanImg = initialItem;
				this.get_browser().set_initialItem(null);
			}
		}
		this._imageProperties.loadImageProperties(cleanImg);
		if ($telerik.isSafari || $telerik.isChrome)
		{
			//hack: when loading a new image, some browsers display 0,0 for the width,height
			//so we reset the width/height and their ratio
			this._imageProperties.get_imageWidth().value = this._originalBounds.width;
			this._imageProperties.get_imageHeight().value = this._originalBounds.height;
			this._imageProperties.set_ratio(parseInt(this._originalBounds.width) / parseInt(this._originalBounds.height));
		}
	},

	_initNoImageItem: function()
	{
		this._previewedImage = null;
		this._originalBounds = null;
		this._imageContainer.className = "imagePreview noImage";
		this._imageContainer.innerHTML = "&nbsp;";
		this._selectedFileName.innerHTML = "&nbsp;";
		this._setToolbarEnabled(false);
		this._tab.set_selectedIndex(0);
		this._setTabsEnabled(false);
	}
}

Telerik.Web.UI.Widgets.ImagePreviewer.registerClass('Telerik.Web.UI.Widgets.ImagePreviewer', Telerik.Web.UI.Widgets.FilePreviewer);
</script>

<style type="text/css">

</style>
<div class="imagePreviewer">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<telerik:RadToolBar ID="ImagePreviewToolBar" runat="Server" Height="26px" Width="100%">
					<Items>
						<telerik:RadToolBarButton Text="Image Editor" ToolTip="Image Editor" Value="ImageEditor"
							Enabled="false" CssClass="icnImageEditor" />
						<telerik:RadToolBarButton Text="&nbsp;" ToolTip="Best Fit" Value="BestFit" Enabled="false"
							CssClass="rtbIconOnly icnBestFit" />
						<telerik:RadToolBarButton Text="&nbsp;" ToolTip="Actual Size" Value="ActualSize"
							Enabled="false" CssClass="rtbIconOnly icnActualSize" />
						<telerik:RadToolBarButton Text="&nbsp;" ToolTip="Zoom In" Value="ZoomIn" Enabled="false"
							CssClass="rtbIconOnly icnZoomIn" />
						<telerik:RadToolBarButton Text="&nbsp;" ToolTip="Zoom Out" Value="ZoomOut" Enabled="false"
							CssClass="rtbIconOnly icnZoomOut" />
					</Items>
				</telerik:RadToolBar>
			</td>
		</tr>
		<tr>
			<td>
				<telerik:RadMultiPage ID="imageMultiPage" runat="server">
					<telerik:RadPageView ID="previewPage" runat="server" Selected="true">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<div id="selectedFileName" class="selectedFileName">
										&nbsp;</div>
								</td>
							</tr>
							<tr>
								<td valign="middle">
									<div id="CleanImageContainer" style="position: absolute; width: 0px; height: 0px;
										overflow: hidden;">
									</div>
									<div id="ImagePreviewer" class="imagePreview noImage">
										&nbsp;</div>
								</td>
							</tr>
						</table>
					</telerik:RadPageView>
					<telerik:RadPageView ID="propertiesPage" runat="server">
						<dc:SetImagePropertiesDialog id="ImageProperties" runat="server" StandAlone="false">
						</dc:SetImagePropertiesDialog>
					</telerik:RadPageView>
				</telerik:RadMultiPage>
			</td>
		</tr>
		<tr>
			<td>
				<telerik:RadTabStrip ID="imageTabStrip" Width="100%" runat="server" Orientation="HorizontalBottom" ShowBaseLine="true"
					MultiPageID="imageMultiPage">
					<Tabs>
						<telerik:RadTab Text="Preview" Value="Preview" Selected="true" />
						<telerik:RadTab Text="Properties" Value="Properties" />
					</Tabs>
				</telerik:RadTabStrip>
			</td>
		</tr>
	</table>
</div>
