<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>

<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.TableDesign = function(element)
{
	Telerik.Web.UI.Widgets.TableDesign.initializeBase(this, [element]);

	this._clientParameters = null;
	this._currentRowSpan = 1;
	this._currentColSpan = 1;

	this._spinBoxColumns = null;
	this._spinBoxColumnSpan = null;
	this._spinBoxRows = null;
	this._spinBoxRowSpan = null;

	/*THE SELECTED CELL AND ITS INDEX IN THE MODEL TABLE!!!*/
	this._selectedCell = null;
	this._selectedCellIndex = -1;
	this._victimColumns = new Array();
	this._victimRows = new Array();
	this._rowsCount = 0;

	this._tableToModify = null;
	this._tablePreviewControl = null;
	this._tableWizardDialog = null;	
	this._tableLayoutBuilderEngine = new Telerik.Web.UI.LayoutBuilderEngine();
}

Telerik.Web.UI.Widgets.TableDesign.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.TableDesign.callBaseMethod(this, "initialize");        
		this._initializeChildren();		
	},

	_initializeChildren : function()
	{
		this._spinBoxDelegate = Function.createDelegate(this, this._spinBoxValueChanged);
		this._selectedCellDelegate = Function.createDelegate(this, this._onSelectedCellChanged);
		
		this._spinBoxColumns = this._initializeSpinBox("SpinBoxColumns");
		this._spinBoxColumnSpan = this._initializeSpinBox("SpinBoxColumnSpan");
		this._spinBoxRows = this._initializeSpinBox("SpinBoxRows");
		this._spinBoxRowSpan = this._initializeSpinBox("SpinBoxRowSpan");

		this._tablePreviewControl = new Telerik.Web.UI.Widgets.TablePreview();
		this._tablePreviewControl.set_previewHolder($get("TableDesign_PreviewTableHolder"));
		this._tablePreviewControl._onSelectedCellChanged = this._selectedCellDelegate;
	},

	clientInit : function(clientParameters)
	{
		this._clientParameters = clientParameters;
		this._tableToModify = this._clientParameters.originalTable;
		this._tableLayoutBuilderEngine.set_selectedTable(this._tableToModify);
		//this._selectedCell = this._clientParameters.selectedCell;        
		this._loadData();
	},

	_initializeSpinBox : function(boxId)
	{
		var spinBox = $find(boxId);
		spinBox.add_valueSelected(this._spinBoxDelegate);
		spinBox.set_value(9999);
		return spinBox;
	},
	
	_spinBoxValueChanged : function(sender, args)
	{
		var oldValue = args.get_oldValue();
		var newValue = args.get_newValue();
		var diff = newValue - oldValue;
		//difference should be either +1 or -1
		if (diff != -1 && diff != 1)
		{
			return;
		}
		switch (sender)
		{
			case this._spinBoxColumns:
				return (diff == 1) ? this._addNewColumn() : this._deleteLastColumn();
			break;
			case this._spinBoxColumnSpan:
				return (diff == 1) ? this._increaseColSpan() : this._decreaseColSpan();
			break;
			case this._spinBoxRows:
				return (diff == 1) ? this._addNewRow() : this._deleteLastRow();
			break;
			case this._spinBoxRowSpan:
				return (diff == 1) ? this._increaseRowSpan() : this._decreaseRowSpan();
			break;
			default:
			break;
		}
	},

	_loadData : function()
	{	    
		//clear dialog data because the page is not reloaded each time the dialog is opened!
		this._currentRowSpan = 1;
		this._currentColSpan = 1;
		this._selectedCell = null;
		this._selectedCellIndex = -1;
		this._victimColumns = new Array();
		this._victimRows = new Array();

		//clear the table preview control as well		
		this._tablePreviewControl.deSelectAllCells();		
		if (this._tableToModify)
		{
			this._rowsCount = this._tableToModify.rows.length;
		}
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_onSelectedCellChanged : function()
	{	    
		this._synchronizeSelectedCell();
		this._checkButtonAvailability();
	},

	_synchronizeSelectedCell : function()
	{	    
		var previewSelectedCell = this._tablePreviewControl.get_selectedCell();
		var previewTable = this._tablePreviewControl.get_previewTable();

		var previewTableRows = previewTable.rows;
		this._selectedCell = null;
		this._selectedCellIndex = -1;
		for (var i=0; i<previewTableRows.length; i++)
		{
			var previewTableCells = previewTableRows[i].cells;
			for (var j=0; j<previewTableCells.length; j++)
			{
				if (previewTableCells[j] == previewSelectedCell)
				{
					this._selectedCell = this._tableToModify.rows[i].cells[j];
					this._tableLayoutBuilderEngine.set_selectedCell(this._selectedCell);
					this._selectedCellIndex = j;
					if (this._tableWizardDialog)
						this._tableWizardDialog._synchronizeSelection(this._selectedCell, this._selectedCellIndex);										    
					return;
				}
			}
		}		
	},

	_checkButtonAvailability : function()
	{	    
	    if (!this._selectedCell)
	    {
	        var table = this._tablePreviewControl.get_previewTable();

		    //check row and column count for the row and column spinboxes
		    if (this._getNamedNodesLength(table.firstChild, "TR") > 1)		    
			    this._spinBoxRows.set_enabledDecrease(true);		    
		    else		    
			    this._spinBoxRows.set_enabledDecrease(false);		    
		    
		    if (this._getMaxColumns() > 1)
			    this._spinBoxColumns.set_enabledDecrease(true);		    
		    else		    
			    this._spinBoxColumns.set_enabledDecrease(false);		    
						
			this._spinBoxColumnSpan.set_enabledDecrease(false);		    		    
		    this._spinBoxRowSpan.set_enabledDecrease(false);			 
	    }
	    else
	    {
	        var layoutBulider = this._tableLayoutBuilderEngine;
	        var layoutBuliderSelectedCell = layoutBulider._selectedCell;
	        var spinBoxColumnSpan = this._spinBoxColumnSpan;
	        var spinBoxRowSpan = this._spinBoxRowSpan;
	        var spinBoxColumns = this._spinBoxColumns;
	        var spinBoxRows = this._spinBoxRows;
    	    
	        //_spinBoxColumnSpan
	        if (layoutBulider.canMergeRight())	    
	            spinBoxColumnSpan.set_enabledIncrease(true);	    
	        else	    
	            spinBoxColumnSpan.set_enabledIncrease(false);	    
    	    
	        if (layoutBulider._getColSpan(layoutBuliderSelectedCell) > 1)	    
	            spinBoxColumnSpan.set_enabledDecrease(true);	    
	        else	    
	            spinBoxColumnSpan.set_enabledDecrease(false);	    
    	    
    	    
	        //_spinBoxColumnSpan
	        if (layoutBulider.canMergeDown())	    
	            spinBoxRowSpan.set_enabledIncrease(true);	    
	        else	    
	            spinBoxRowSpan.set_enabledIncrease(false);	    
    	    
	        if (layoutBulider._getRowSpan(layoutBuliderSelectedCell) > 1)	    
	            spinBoxRowSpan.set_enabledDecrease(true);	    
	        else	    
	            spinBoxRowSpan.set_enabledDecrease(false);	 
    	        
	        //_spinBoxColumns   
	        if(layoutBulider._tableStateColsCount != 1)
	            spinBoxColumns.set_enabledDecrease(true);
	        else
	            spinBoxColumns.set_enabledDecrease(false);
    	        
	        //_spinBoxRows
	        if(layoutBulider._tableStateRowsCount != 1)
	            spinBoxRows.set_enabledDecrease(true);
	        else
	            spinBoxRows.set_enabledDecrease(false);
	    }	    	    	    	    	    		
	},

	_getNamedNodesLength : function(node, name)
	{
		var counter = 0;
		if (node)
		{
			for (var i=0; i<node.childNodes.length; i++)
			{
				if (node.childNodes[i].nodeName == name)
				{
					counter++;
				}
			}
		}
		return counter;
	},

	_getMaxColumns : function()
	{
		var maxCols = 0;
		var firstRow = this._tableToModify.rows[0];
		if (firstRow)
		{
			var cells = firstRow.cells;//childNodes;
			for (var i=0; i < cells.length; i++)
			{
				maxCols += this._getColSpan(cells[i]);
			}
		}
		return maxCols;
	},
	
    _findNextNamedSibling : function(node, name)
	{
		if (node != null)
		{
			var nSibling = node.nextSibling;
			while (nSibling != null)
			{
				if (nSibling.nodeName == name)
				{
					return nSibling;
				}
				nSibling = nSibling.nextSibling;
			}
		}
		return null;
	},
	
	_getRowSpan : function (oCell)
	{
		if (!oCell) return;
		return oCell.rowSpan > 0 ? oCell.rowSpan : 1;
	},

	_getColSpan : function (oCell)
	{
		if (!oCell) return;
		return oCell.colSpan > 0 ? oCell.colSpan : 1;
	},
	
	_getEquivalentModelTableCell : function(previewTableCell)
	{
		var table = this._tablePreviewControl.get_previewTable();
		var rows = table.rows;
		for (var i=0; i<rows.length; i++)
		{
			var cells = rows[i].cells;
			for (var j=0; j < cells.length; j++)
			{
				if (cells[j] == previewTableCell)
				{
					return this._tableToModify.rows[i].cells[j];
				}
			}
		}
	},

	_getCellByOffset : function(row, offset)
	{
		var cells = row.cells;
		for (var i=0; i<cells.length; i++)
		{
			if (cells[i].offsetLeft == offset)
			{
				return cells[i];
			}
		}
		return null;
	},

	_getNamedNodeIndex : function(node, name)
	{
		if (node && node.parentNode && node.parentNode.childNodes)
		{
			var nodesChild = node.parentNode.childNodes;
			var nodeIndex = 0;
			for (var i=0; i<nodesChild.length; i++)
			{
				if (nodesChild[i] == node)
				{
					return nodeIndex;
				}
				else if (nodesChild[i].nodeName == name)
				{
					nodeIndex++;
				}
			}
		}
		return -1;
	},

	_removeLastChild : function(node, name)
	{
		if (!node || !node.childNodes)
		{
			return;
		}
		var i=node.childNodes.length-1;
		while (i>=0 && node.childNodes[i].nodeName != name)
		{
			i--;
		}
		if (i>=0)
		{
			node.removeChild(node.childNodes[i]);
		}
	},

	_deleteLastColumn : function()
	{
		if (this._getMaxColumns() == 1)
		{
			return false;
		}

		var cells = this._selectedCell.parentNode.cells;
		var lastCellIndex = cells.length - 1;
		if (this._selectedCell.cellIndex == lastCellIndex)
		{
			var result = this._tableLayoutBuilderEngine.executeCommand("deleteColumn");
			this.set_selectedCell(this._tableLayoutBuilderEngine._selectedTable.rows[0].cells[0]);
		}
		else
		{
			var cell = this._selectedCell;
			this.set_selectedCell(cells[lastCellIndex]);
			var result = this._tableLayoutBuilderEngine.executeCommand("deleteColumn");
			this.set_selectedCell(cell);
		}

		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_deleteLastRow : function()
	{
		if (this._rowsCount == 1)
		{
			return false;
		}
		
		var lasRowIndex = this._tableLayoutBuilderEngine._tableStateRowsCount - 1;
		if (this._tableLayoutBuilderEngine._selectedRowIndex == lasRowIndex)
		{
			var result = this._tableLayoutBuilderEngine.executeCommand("deleteRow");
			this.set_selectedCell(this._tableLayoutBuilderEngine._selectedTable.rows[0].cells[0]);
		}
		else
		{
			var cell = this._selectedCell;
			this.set_selectedCell(this._tableLayoutBuilderEngine._selectedTable.rows[lasRowIndex].cells[0]);
			var result = this._tableLayoutBuilderEngine.executeCommand("deleteRow");
			this.set_selectedCell(cell);
		}
		this._rowsCount -= 1;
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_addNewColumn : function()
	{	  
	    if(!this._tableLayoutBuilderEngine._selectedCell) return false;  
		var result = this._tableLayoutBuilderEngine.executeCommand("insertColumnToTheRight");
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_addNewRow : function()
	{
	    if(!this._tableLayoutBuilderEngine._selectedCell) return false;
	    var result = this._tableLayoutBuilderEngine.executeCommand("insertRowBelow");
	    this._rowsCount += 1;
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_increaseColSpan : function()
	{	    		
        if(!this._tableLayoutBuilderEngine._selectedCell) return false;
        if (this._tableLayoutBuilderEngine.canMergeRight()) this._tableLayoutBuilderEngine.executeCommand("mergeRight");
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_decreaseColSpan : function()
	{
	    if(!this._tableLayoutBuilderEngine._selectedCell) return false;
		if (this._tableLayoutBuilderEngine._getColSpan(this._tableLayoutBuilderEngine._selectedCell) > 1)
		{
		    var args = {rightColSpan : 1}
		    this._tableLayoutBuilderEngine.executeCommand("splitCellHorizontally", args);
		}				    
				
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_increaseRowSpan : function()
	{	    
		if(!this._tableLayoutBuilderEngine._selectedCell) return false;
		if (this._tableLayoutBuilderEngine.canMergeDown()) this._tableLayoutBuilderEngine.executeCommand("mergeDown");
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	_decreaseRowSpan : function()
	{
	    if(!this._tableLayoutBuilderEngine._selectedCell) return false;
		if (this._tableLayoutBuilderEngine._getRowSpan(this._tableLayoutBuilderEngine._selectedCell) > 1)
		{
		    var args = {downRowSpan : 1}
		    this._tableLayoutBuilderEngine.executeCommand("splitCellVertically", args);
		}		    
		    
		this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		this._checkButtonAvailability();
	},

	set_selectedCell : function(value)
	{	    
		this._selectedCell = value;
		this._tableLayoutBuilderEngine.set_selectedCell(value);
		if (this._tableToModify != null)
		{		    
			this._tablePreviewControl._updateTable(this._tableToModify, this._selectedCell);
		}
		
		//NEW always check _checkButtonAvailability when you set selected cell
		this._checkButtonAvailability();
	},

	set_tableWizardControl : function(value)
	{
		this._tableWizardDialog = value;
	},
	
	getParentTable : function(oNode)
	{
		if (!oNode)
			return null;

		while (null != oNode
				&& oNode.parentNode != oNode
				&& "TABLE" != oNode.tagName)
		{
			oNode = oNode.parentNode;
		}

		return (oNode && oNode.tagName == "TABLE" ? oNode : null);
	},
	
	getNextSiblingCell : function(cell)
	{
		if (!cell) return null;

		var row = cell.parentNode;
		var nextIndex = cell.cellIndex + 1;

		if (0 <= nextIndex && nextIndex < row.cells.length)
			return row.cells[nextIndex];

		return null;
	},

	getLowerCell : function(cell)
	{
		if (!cell) return null;

		var table = this.getParentTable(cell);
		var row = cell.parentNode;

		var nextRow = table.rows[row.rowIndex + this._getRowSpan(cell)];
		if (!nextRow) return null;

		var lowerCell = nextRow.cells[cell.cellIndex];
		return lowerCell;
	},

	dispose : function()
	{
		this._clientParameters = null;

		this._selectedCell = null;
		this._victimColumns = [];
		this._victimRows = [];

		this._spinBoxColumns = null;
		this._spinBoxColumnSpan = null;
		this._spinBoxRows = null;
		this._spinBoxRowSpan = null;

		this._tableToModify = null;
		this._tablePreviewControl = null;
		this._tableWizardDialog = null;
		Telerik.Web.UI.Widgets.TableDesign.callBaseMethod(this, "dispose");
	}
}
Telerik.Web.UI.Widgets.TableDesign.registerClass('Telerik.Web.UI.Widgets.TableDesign', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>
<!-- table design pane -->
<table border="0" cellpadding="0" cellspacing="0" style="margin-left: 4px;">
	<tr>
		<td style="vertical-align: top; padding: 0;">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="vertical-align: top; padding: 0;">					    
						<fieldset style="padding: 0; margin: 0; width: 379px; height: 44px;">
							<legend><script type="text/javascript">
											document.write(localization["Columns"]);
											</script></legend>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td style="vertical-align: top;">
										<div class="propertyLabel" style="width: 80px; text-align: left; margin-left: 8px; margin-bottom: 6px;">
											<script type="text/javascript">
											document.write(localization["Columns"]);
											</script>:
										</div>
									</td>
									<td style="vertical-align: top;">
										<tools:EditorSpinBox id="SpinBoxColumns" VisibleInput="false" runat="server" />
									</td>
									<td style="vertical-align: top;">
										<div class="propertyLabel" style="width: 80px; text-align: left; margin-left: 90px; margin-bottom: 6px;">
											<script type="text/javascript">
											document.write(localization["ColumnSpan"]);
											</script>:
										</div>
									</td>
									<td style="vertical-align: top;">
										<tools:EditorSpinBox id="SpinBoxColumnSpan" VisibleInput="false" runat="server" />
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top; padding: 0;">
						<div id="TableDesign_PreviewTableHolder" class="reTableDesignPreviewTableHolder">
							<!-- / -->
						</div>
					</td>
				</tr>
			</table>
		</td>
		<td style="vertical-align: top; padding: 0; padding-left: 6px;">
			<fieldset style="padding: 0; width: 304px; height: 397px;">
				<legend><script type="text/javascript">document.write(localization["Rows"]);</script></legend>
				<table border="0" cellpadding="0" cellspacing="0" style="margin: 40px 0 0 6px;">
					<tr>
						<td style="padding: 3px 0">
							<div class="propertyLabel" style="text-align: left; margin-left: 6px; width: 60px;">
								<script type="text/javascript">document.write(localization["Rows"]);</script>:
							</div>
						</td>
						<td style="padding: 3px 0">
							<tools:EditorSpinBox id="SpinBoxRows" VisibleInput="false" runat="server" />
						</td>
					</tr>
					<tr>
						<td style="padding: 3px 0">
							<div class="propertyLabel" style="text-align: left; margin-left: 6px; width: 60px;">
								<script type="text/javascript">document.write(localization["RowSpan"]);</script>:
							</div>
						</td>
						<td style="padding: 3px 0">
							<tools:EditorSpinBox id="SpinBoxRowSpan" VisibleInput="false" runat="server" />
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
</table>
<!-- end of table design pane -->