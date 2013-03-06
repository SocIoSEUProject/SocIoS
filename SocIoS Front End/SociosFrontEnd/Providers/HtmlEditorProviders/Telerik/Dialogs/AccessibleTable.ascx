<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");
Telerik.Web.UI.Widgets.AccessibleTable = function(element)
{
	Telerik.Web.UI.Widgets.AccessibleTable.initializeBase(this, [element]);

	this._clientParameters = null;
	this._table = null
	this._tableDocument = null;
	
	this._headingRows = 0;
	this._headingColumns = 0;
	this._caption = "";
	this._summary = "";
	this._captionHalign = "";
	this._captionValign = "";
	this._setCellID = false;
	
	this._headingRowsInput = null;
	this._headingColumnsInput = null;
	this._captionTextArea = null;
	this._summaryTextArea = null;
	this._setCellIDCheckBox = null;
	
	this._alignmentSelector = null;
	
	this._maxHeadRowsSpan = null;
	this._maxHeadColsSpan = null;
}

Telerik.Web.UI.Widgets.AccessibleTable.prototype = {
	initialize : function() 
	{
		Telerik.Web.UI.Widgets.AccessibleTable.callBaseMethod(this, "initialize");
		this._initializeChildren();
	},

	_initializeChildren : function()
	{
		this._headingRowsInput = $get("headingRows");
		this._headingColumnsInput = $get("headingColumns");
		this._captionTextArea = $get("CaptionText");
		this._summaryTextArea = $get("SummaryText");
		this._setCellIDCheckBox = $get("associateCellsWithHeaders");

		this._alignmentSelector = $find("alignmentSelector");
		this._maxHeadRowsSpan = $get("maxHeadRows");
		this._maxHeadColsSpan = $get("maxHeadColumns");
	},

	clientInit : function(clientParameters)
	{
		this._clientParameters = clientParameters;
		if(this._clientParameters)
		{
			this._table = this._clientParameters.tableToModify; 
			this._tableDocument = this._clientParameters.tableDocument; 
		}
		
		this._loadData();
	},

	_loadData : function()
	{
		if (this._table)	// retreive table's data
		{
			// caption
			if (this._table.caption)
			{
				if ($telerik.isIE)
				{	// IE
					this._caption = this._table.caption.innerText;
					this._captionHalign = ('' == this._table.caption.align ? 'left' : this._table.caption.align);
					this._captionValign = ('' == this._table.caption.vAlign ? 'top' : this._table.caption.vAlign);
				}
				else
				{	// NS
					this._caption = this._table.caption.childNodes[0].nodeValue;
					this._captionHalign = 'center';
					this._captionValign = this._table.caption.align;
				}
			}
			else
			{
				this._caption = '';
				this._captionHalign = 'left';
				this._captionValign = 'top';
			}
			this._alignmentSelector.setTagName("CAPTION");
			this._alignmentSelector.updateValue(this._captionHalign, this._captionValign);

			// summary
			this._summary = this._table.summary;
			// heading
			this._headingRows = this._table.tHead ? this._table.tHead.rows.length : 0;
			this._headingColumns = this._countHeadingColumns();
			this._setCellID = this._checkHeadersHasIds() || this._checkCellsHasHeaders();

			// show data
			this._updateData(false);
		}
	},

	_countHeadingColumns : function()
	{
		var count = 0;
		if (this._table)
		{
			var tHead = this._getThead();
			if(tHead)
			{
				for (i = 0; i < tHead.rows.length; i++)
				{
					var row = tHead.rows[i];
					var cells = row.getElementsByTagName('TH');
					if ((cells && cells.length < count) || count == 0)
						count = cells.length;
				}
			}
			for (k = 0; k < this._table.tBodies.length; k++)
			{
				var tBody = this._table.tBodies[k];
				for (i = 0; i < tBody.rows.length; i++)
				{
					var row = tBody.rows[i];
					var cells = row.getElementsByTagName('TH');
					if ((cells && cells.length < count) || count == 0)
						count = cells.length;
				}
			}
		}
		return count;
	},

	_checkCellsHasHeaders : function()
	{
		if (this._table)
		{
			for (k = 0; k < this._table.tBodies.length; k++)
			{
				var tBody = this._table.tBodies[k];
				for (i = 0; i < tBody.rows.length; i++)
				{
					var row = tBody.rows[i];
					for (j = 0; j < row.cells.length; j++)
					{
						var cell = row.cells[j];
						if (cell.getAttribute('headers'))
						{
							return true;
						}
					}
				}
			}
		}
		return false;
	},

	_checkHeadersHasIds : function()
	{
		if (this._table)
		{
			for (i = 0; i < this._table.rows.length; i++)
			{
				var row = this._table.rows[i];
				for (j = 0; j < row.cells.length; j++)
				{
					var cell = row.cells[j];
					if ("TH" == cell.tagName.toUpperCase() && "" != cell.id)
						return true;
				}
			}
		}
		return false;
	},

	_updateData : function(save)
	{
		if (save) // retreive data from controls
		{
			this._headingRows = parseInt(this._headingRowsInput.value);
			this._headingColumns = parseInt(this._headingColumnsInput.value);
			this._caption = this._captionTextArea.value;
			this._summary = this._summaryTextArea.value;

			this._captionHalign = this._alignmentSelector.getAlign();
			this._captionValign = this._alignmentSelector.getVAlign();

			this._setCellID = this._setCellIDCheckBox.checked;
		}
		else	// set data to controls
		{
			this._headingRowsInput.value = this._headingRows;
			this._headingColumnsInput.value = this._headingColumns;
			this._captionTextArea.value = this._caption;
			this._summaryTextArea.value = this._summary;

			this._alignmentSelector.updateValue(this._captionHalign, this._captionValign);

			this._setCellIDCheckBox.checked = this._setCellID;
			if (this._table)
			{
				var maxRows = this._table.rows.length;
				var maxColumns = (this._table.rows.length > 0) ? this._table.rows[0].cells.length : 0;

				this._maxHeadRowsSpan.innerText = '(Max. ' + maxRows + ')';
				this._maxHeadColsSpan.innerText = '(Max. ' + maxColumns + ')';
			}
		}
	},

	_changeCellType : function(cellToConvert, newType)
	{
		var isChangeMade = false;
		if (cellToConvert.tagName.toUpperCase() != newType.toUpperCase())
		{
			var newCell = this._tableDocument.createElement(newType.toUpperCase());

			this._mergeAttributes(newCell, cellToConvert);
			cellToConvert.parentNode.replaceChild(newCell, cellToConvert);
			isChangeMade = true;
		}
		return isChangeMade;
	},

	_mergeAttributes : function (destElem, sourceElem)
	{
		if (destElem.mergeAttributes)
		{
			destElem.mergeAttributes(sourceElem);
		}
		else
		{
			for (var attrName in sourceElem.attributes)
			{
				destElem.attrName = sourceElem.attributes[attrName];
			}
		}
		destElem.colSpan = sourceElem.colSpan;
		destElem.rowSpan = sourceElem.rowSpan;
		destElem.style.cssText = sourceElem.style.cssText;
		destElem.innerHTML = sourceElem.innerHTML;
	},

	_updateTable : function()
	{
		if (null != this._table)
		{
			this._updateData(true);

			this._updateCaption();
			if (this._summary == "")
			{
				this._table.removeAttribute('summary', false);
			}
			else
			{
				this._table.summary = this._summary;
			}
			this._updateThead();
			this._updateRows();
			this._updateCellIDs();
		}

		return this._table;
	},

	_updateCaption : function()
	{
		var caption = this._table.caption;
		if ($telerik.isIE)
		{
			if (!caption && "" != this._caption)
				caption = this._table.createCaption();

			if (caption)
			{
				caption.innerText = this._caption;
				caption.align = this._captionHalign;
				caption.vAlign = this._captionValign;
			}
		}
		else
		{
			if (caption)
			{
				this._table.removeChild(caption);
				caption = null;
			}

			if (!caption && "" != this._caption)
			{
				var caption = this._tableDocument.createElement("CAPTION");
				caption.innerHTML = this._caption;
				caption.setAttribute("align", this._captionValign);
				this._table.appendChild(caption);
			}
		}
	},

	_getTableColumns : function()
	{
		var numColumns = 0;
		if (null != this._table && this._table.rows.length > 0)
		{
			numColumns = this._table.rows[0].cells.length;
		}
		return numColumns;
	},

	_getThead : function ()
	{
		var arrElements = this._table.getElementsByTagName('THEAD');
		if (arrElements.length > 0)
			return arrElements[0];
		else
			return null;
	},

	_updateThead : function()
	{
		var numColumns = this._getTableColumns();
		var tHead = this._getThead();
		if (!tHead)
		{
			tHead = this._table.createTHead();
		}

		var tBodyInsertPos = 0;
		for (i = 0; i < this._table.rows.length; i++)
		{
			var row = this._table.rows[i];
			var parent = row.parentNode;

			var parentTagName = parent.tagName.toUpperCase();

			if (i < this._headingRows)
			{	// rows that have to be in THEAD
				if ("THEAD" != parentTagName)
				{
					var newRow = tHead.insertRow(tHead.rows.length);
					for (j = 0; j < row.cells.length; j++)
					{
						var newCell = this._tableDocument.createElement("TH");

						//Copy all attributes from the source cell to the new cell.
						this._mergeAttributes(newCell, row.cells[j]);
						newRow.insertBefore(newCell, null);
					}
					this._table.deleteRow(i + 1);
				}
			}
			else
			{	// rows that have not be in THEAD
				if ("THEAD" == parentTagName)
				{
					var newRow = this._table.tBodies[0].insertRow(tBodyInsertPos++);
					for (j = 0; j < row.cells.length; j++)
					{
						var newCell = newRow.insertBefore(this._tableDocument.createElement("TD"), null);
						//Copy all attributes from the source cell to the new cell.
						this._mergeAttributes(newCell, row.cells[j]);
					}
				}
			}
		}
		// remove the extra heading rows
		if (this._headingRows < tHead.rows.length)
		{
			for (i = tHead.rows.length - 1; i >= this._headingRows; i--)
			{
				tHead.deleteRow(i);
			}
		}

	},

	_updateRows : function()
	{
		if (this._table)
		{
			for (k = 0; k < this._table.tBodies.length; k++)
			{
				var tBody = this._table.tBodies[k];
				for (i = 0; i < tBody.rows.length; i++)
				{
					var row = tBody.rows[i];
					for (j = 0; j < row.cells.length; j++)
					{
						var cellType = j < this._headingColumns ? "TH" : "TD";
						this._changeCellType(row.cells[j], cellType);
					}
				}
			}
		}
	},

	_updateCellIDs : function()
	{
		var haveIds = this._checkHeadersHasIds();
		var haveHeaders = this._checkCellsHasHeaders();

		if (this._table && this._table.tHead && (this._setCellID || haveIds || haveHeaders))
		{
			var tableID = this._table.id ? this._table.id : this._table.uniqueID;

			if (!tableID)
			{
				tableID = "table";
			}

			var arrHeaders = null;
			var headingId = 0;

			if (haveIds || this._setCellID)
			{
				for (i = 0; i < this._table.tHead.rows.length; i++)
				{
					var row = this._table.tHead.rows[i];
					if (!arrHeaders)
						arrHeaders = new Array(row.cells.length);

					for (j = 0; j < row.cells.length; j++)
					{
						var cell = row.cells[j];

						if (this._setCellID)
						{
							var id = cell.id ? cell.id : (tableID + "_heading_" + headingId++);
							cell.id = id;
							if (!arrHeaders[j])
								arrHeaders[j] = id;
						}
						else
						{
							cell.id = "";
						}
					}
				}
			}

			for (k = 0; k < this._table.tBodies.length; k++)
			{
				var tBody = this._table.tBodies[k];
				for (i = 0; i < tBody.rows.length; i++)
				{
					var row = tBody.rows[i];
					for (j = 0; j < row.cells.length; j++)
					{
						var cell = row.cells[j];
						var cellTagName = cell.tagName.toUpperCase();
						if ("TH" == cellTagName)
						{
							if (this._setCellID)
								cell.id = cell.id ? cell.id : (tableID + "_heading_" + headingId++);
							else
								cell.id = "";
						}
						else if (	"TD" == cellTagName &&
									this._table.tHead.rows.length > 0 &&
									arrHeaders &&
									(haveHeaders || this._setCellID)	)
						{
							if (this._setCellID)
								cell.setAttribute("headers", arrHeaders[j]);
							else
								cell.removeAttribute("headers", false);
						}
					}
				}
			}
		}
	},

	set_tableToModify : function(value)
	{
		this._table = value;
	},

	dispose : function() 
	{
		this._clientParameters = null;
		this._table = null
		this._tableDocument = null;

		this._headingRowsInput = null;
		this._headingColumnsInput = null;
		this._captionTextArea = null;
		this._summaryTextArea = null;
		this._setCellIDCheckBox = null;

		this._alignmentSelector = null;

		this._maxHeadRowsSpan = null;
		this._maxHeadColsSpan = null;

		Telerik.Web.UI.Widgets.AccessibleTable.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.AccessibleTable.registerClass('Telerik.Web.UI.Widgets.AccessibleTable', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>

<table cellpadding="0" cellspacing="0" style="margin: 0 2px 0 4px;">
	<tr>
		<td>
			<fieldset style="height: 398px; width: 697px;">
				<legend><script type="text/javascript">document.write(localization["AccessibilityOptions"]);</script></legend>
				<table cellpadding="0" cellspacing="0" class="reControlsLayout">
					<tr>
						<td class="reLabelCell">
							<label class="reDialogLabel" for="headingRows">
								<span style="text-align: right;"><script type="text/javascript">document.write(localization["HeadingRows"]);</script></span>
							</label>
						</td>
						<td class="reControlCell">
							<input type="text" id="headingRows" />
							<span id="maxHeadRows">
								<!-- / -->
							</span>
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label class="reDialogLabel" for="headingColumns">
								<span style="text-align: right;">

									<script type="text/javascript">
                                    document.write(localization["HeadingColumns"]);
									</script>

								</span>
							</label>
						</td>
						<td class="reControlCell">
							<input type="text" id="headingColumns" class="s_input" />
							<span id="maxHeadColumns"></span>
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label class="reDialogLabel" for="CaptionText">
								<span style="text-align: right;">

									<script type="text/javascript">
                                    document.write(localization["Caption"]);
									</script>

								</span>
							</label>
						</td>
						<td class="reControlCell">
							<textarea id="CaptionText" rows="6" cols="10" style="overflow: auto; width: 540px;
								height: 120px;"></textarea>
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label class="reDialogLabel">
								<span style="text-align: right;">

									<script type="text/javascript">
                                    document.write(localization["CaptionAlign"]);
									</script>

								</span>
							</label>
						</td>
						<td class="reControlCell">
							<tools:AlignmentSelector id="alignmentSelector" runat="server">
							</tools:AlignmentSelector>
						</td>
					</tr>
					<tr>
						<td class="reLabelCell">
							<label for="accessibilitySummary" class="reDialogLabel">
								<span style="text-align: right;">

									<script type="text/javascript">
                                    document.write(localization["Summary"]);
									</script>

								</span>
							</label>
						</td>
						<td class="reControlCell">
							<textarea id="SummaryText" rows="6" cols="10" style="overflow: auto; width: 540px;
								height: 120px;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="reLabelCell" style="padding-left: 130px;">
							<input type="checkbox" id="associateCellsWithHeaders" style="border: 0;" />
							<label for="associateCellsWithHeaders">

								<script type="text/javascript">
	                            document.write(localization["AssociateCellsWithHeaders"]);
								</script>

							</label>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
</table>
