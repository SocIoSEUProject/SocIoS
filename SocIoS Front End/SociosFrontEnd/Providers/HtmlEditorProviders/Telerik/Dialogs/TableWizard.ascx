<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Widgets" TagPrefix="widgets" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Dialogs" TagPrefix="dialogs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor.DialogControls"
	TagPrefix="dc" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">
	.aaaaa
	{
		color: Red;
		cursor: "Arrow";
	}
</style>
<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");

Telerik.Web.UI.Widgets.TablePreview = function(element)
{
	Telerik.Web.UI.Widgets.TablePreview.initializeBase(this);

	this._previewHolder = null;
	this._previewTable = null;
	this._editedCells = [];
	this._selectedCell = null;
	this._selectedCells = [];
	this._allowMultiCellSelection = false;
	this._selectAllButton = null;
	this._selectAllHolder = null;
}

Telerik.Web.UI.Widgets.TablePreview.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.TablePreview.callBaseMethod(this, "initialize");
	},

	_configureChildren : function()
	{
		var dummyTable = document.createElement("TABLE");
		dummyTable.className = "tableDesign";
		this._previewHolder.appendChild(dummyTable);
		this._previewTable = dummyTable;
		
		//select all element
		var divSelectAllHolder = document.createElement("div");
		divSelectAllHolder.style.cssText = "display: none; text-align: right; margin-top: 3px; margin-right: 3px;";
		this._selectAllHolder = divSelectAllHolder;
		var btnSelectAll = document.createElement("a");
		btnSelectAll.href = "javascript: void(0);";
		btnSelectAll.title = localization["SelectAll"];
		btnSelectAll.innerHTML = localization["SelectAll"];
		var attributeName = ($telerik.isIE) ? "className" : "class";
		btnSelectAll.setAttribute(attributeName, "reTableWizardSelectAllBtn");
		this._selectAllButton = btnSelectAll;
		this._selectAllHolder.appendChild(this._selectAllButton);
		this._previewHolder.appendChild(this._selectAllHolder);
		$addHandlers(this._selectAllButton, {"click" : this._handleSelectAllButtonClick}, this);
	},

	_updateTable : function(modelTable, selectedCell)
	{
		var newTable = document.createElement("TABLE");
		newTable.className = "tableDesign";
		newTable.cellPadding = 1;
		newTable.cellSpacing = 1;

		for (var i=0; i < modelTable.rows.length; i++)
		{
			var currentRow = modelTable.rows[i];
			var newRow = newTable.insertRow(-1);//newTable.rows.length
			for (var j=0; j<currentRow.cells.length; j++)
			{
				var currentCell = currentRow.cells[j];
				var newCell = newRow.insertCell(-1);//newRow.cells.length

				newCell.rowSpan = currentCell.rowSpan;
				newCell.colSpan = currentCell.colSpan;
				if (currentCell == selectedCell)
				{
					this._selectCell(newCell);
				}
				else
				{
					this._deSelectCell(newCell);
				}

				newCell.theTablePreviewControl = this;
				$addHandlers(newCell, {"click" : this._handleCellClick}, this);
				newCell.innerHTML = "&nbsp;&nbsp;";
			}
		}
		this._previewTable.parentNode.replaceChild(newTable, this._previewTable);
		this._previewTable = newTable;
	},
	
	_handleSelectAllButtonClick: function(e)
	{
		if (this._allowMultiCellSelection)
		{
			var rows = this._previewTable.rows;
			var rl = rows.length;
			for (var i = 0; i < rl; i++)
			{
				var cells = rows[i].cells;
				var cl = cells.length;
				for (var j = 0; j < cl; j++)
				{
					this._selectCell(cells[j]);
				}
			}
		}
	},

	_handleCellClick : function(e)
	{
		var cell = null;
		if (!e)
			cell = window.event.srcElement;
		else
			cell = e.target;

		if (this._allowMultiCellSelection && e.ctrlKey)
		{
			/**
			 *
			 * If the control key is pressed a multiple selection
			 * is being done.
			 *
			 */
			if (this._isCellSelected(cell))
			{
				this._deSelectCell(cell);
			}
			else
			{
				this._selectCell(cell);
			}
		}
		else
		{
			this._changeSelectedCell(cell);
		}
	},

	_changeSelectedCell : function(cell)
	{
		this.set_editedCells(this.get_selectedCells());
		var isCellSelected = this._isCellSelected(cell);
		var isMultiCellSelection = this._isMultiCellSelection();
		this.deSelectAllCells();
		if (!isCellSelected || isMultiCellSelection)
		{
			this._selectCell(cell);
		}

		if (this._onSelectedCellChanged)
		{
			this._onSelectedCellChanged();
		}
	},

	_getCellIndex : function(oCell)
	{

		var selCol = oCell ? (oCell.cellIndex) : 0;

		if ($telerik.isSafari) //SAFARI
		{
			var oP = oCell.parentNode;
			for (var i = 0; i < oP.cells.length; i++)
			{
				if (oCell == oP.cells[i])
				{
					selCol = i;
					break;
				}
			}
		}
		return selCol;
	},

	_selectCell : function(cell)
	{
		this._selectedCell = cell;

		var rowIndex  = cell.parentNode.rowIndex;
		var cellIndex = this._getCellIndex(cell);//cell.cellIndex; TEKI - SAFARI support.

		if (typeof(this._selectedCells[rowIndex]) == 'undefined')
		{
			this._selectedCells[rowIndex] = [];
		}

		this._selectedCells[rowIndex][cellIndex] = cell;

		//TODO do this with $telerik.addCssClasses
		cell.className = "selectedCell";
	},

	_deSelectCell : function(cell)
	{
	    if(!cell) return;
		if (this._isCellSelected(cell))
		{
			var rowIndex  = cell.parentNode.rowIndex;
			var cellIndex = this._getCellIndex(cell);//cell.cellIndex; TEKI - SAFARI support. Defined in Common.js
			if (rowIndex >=0 && cellIndex >=0)
			{
				this._selectedCells[rowIndex][cellIndex] = null;
			}
			if (cell == this._selectedCell)
			{
				this._selectedCell = null;
			}
		}

		cell.className = "";
	},

	deSelectAllCells : function ()
	{
		var selectedCells = this.get_selectedCells();
		for (var i = 0; i < selectedCells.length; i ++)
		{
			this._deSelectCell(selectedCells[i]);
		}

		this._selectedCells = [];
	},

	_isCellSelected : function(cell)
	{
		return (cell && cell.className == "selectedCell"); // Or use the this.selectedCells Array ?
	},

	_isMultiCellSelection : function ()
	{
		return (this.get_selectedCells().length > 1);
	},

	get_previewHolder : function()
	{
		return this._previewHolder;
	},

	set_previewHolder : function(value)
	{
		this._previewHolder = value;

		if(this._previewHolder) this._configureChildren();
	},

	set_editedCells : function(editedCells)
	{
		this._editedCells = editedCells;
	},

	get_editedCells : function()
	{
		return this._editedCells;
	},

	get_previewTable : function()
	{
		return this._previewTable;
	},

	get_selectedCells : function()
	{
		var selectedCells = [];
		for (var rowIndex in this._selectedCells)
		{
			for (var cellIndex in this._selectedCells[rowIndex])
			{
				selectedCells.push(this._selectedCells[rowIndex][cellIndex]);
			}
		}
		return selectedCells;
	},

	get_selectedCell : function()
	{
		var selectedCells = this.get_selectedCells();
		if (selectedCells && selectedCells.length > 0)
		{
			return selectedCells[selectedCells.length - 1];
		}
		return null;
	},

	set_allowMultiCellSelection : function(value)
	{
		this._selectAllHolder.style.display = (value) ? "" : "none";
		this._allowMultiCellSelection = value;
	},

	_disposeChildEvents : function()
	{
		if(this._previewTable)
		{
			for (var i=0; i < this._previewTable.rows.length; i++)
			{
				var currentRow = this._previewTable.rows[i];
				for (var j=0; j<currentRow.cells.length; j++)
				{
					$clearHandlers(currentRow.cells[j]);
				}
			}
		}
	},

	dispose : function()
	{
		this._disposeChildEvents();

		this._previewHolder = null;
		this._previewTable = null;
		this._editedCells = [];
		this._selectedCell = null;
		this._selectedCells = [];

		Telerik.Web.UI.Widgets.TablePreview.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.TablePreview.registerClass('Telerik.Web.UI.Widgets.TablePreview', Sys.Component);

Telerik.Web.UI.Widgets.TableWizard = function(element)
{
	Telerik.Web.UI.Widgets.TableWizard.initializeBase(this, [element]);

	this._clientParameters = null;
	this._insertButton = null;
	this._cancelButton = null;
	this._table = null;
	this._originalSelectedCell = null;
	this._currentlyEditedCell = null;
	this._originalTableClone = null;
	this._selectedTabIndex = 0;

	this._selectedCell = null;
	this._selectedCellIndex	= -1;

	this._accessibleTableControl = null;
	this._tablePropertiesControl = null;
	this._tableDesignControl = null;
	this._cellPropertiesControl	= null;
	this._tablePreviewControl = null;

	//Due to dialog caching make and difference in sequence of initialization we will use a trick to call
	this._isLoaded = false;
}

Telerik.Web.UI.Widgets.TableWizard.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.TableWizard.callBaseMethod(this, 'initialize');
		this._setupChildren();
	},

	_initializeControl : function()
	{
	    var params = this._clientParameters;
	    if(params.selectedTabIndex && params.selectedTabIndex >= 0)
		{
		    this._tab.set_selectedIndex(params.selectedTabIndex);
		    this._selectedTabIndex = params.selectedTabIndex;
		}

		//New - initialize manually subcontrols
		this._tableDesignControl.clientInit(params);
		this._tablePropertiesControl.clientInit(params);
	    this._cellPropertiesControl.clientInit(params);
	    this._accessibleTableControl.clientInit(params);


	    this.tabChangedHandler = Function.createDelegate(this, this._tabChangedHandler);
		this._tab.add_tabSelected(this.tabChangedHandler);
		this._loadTableProperties();
	},

	//Called also when a dilog is cached
	clientInit : function(clientParameters)
	{
		this._clientParameters = clientParameters;
		this._table = this._clientParameters.originalTable;
		this._originalTableClone = this._clientParameters.tableToModify;
		this._originalSelectedCell = this._clientParameters.cellToModify;

		this._initializeControl();
	},

	_tabChangedHandler : function (sender, args)
	{
	    var selectedTab = sender.get_selectedIndex();
	    this._initTabControl(selectedTab);
	    this._selectedTabIndex = selectedTab;
	},

	_loadTableProperties : function()
	{
	    this._initTabControl(this._selectedTabIndex);
	},

	_initTabControl : function(selectedTab)
	{
	    switch(selectedTab)
	    {
	     case 0 :
	        this._initDesigner();
	        break;
	     case 1 :
	        this._initTableProperties();
	        break;
	     case 2 :
	        this._initCellProperties();
	        break;
	     case 3 :
	        this._initAccessibleTable();
	        break;
	    }
	},

	_setupChildren : function()
	{
	    this._tableDesignControl = $find("tableDesignPanel");
	    this._tablePropertiesControl = $find("tablePropertiesPanel");
	    this._cellPropertiesControl = $find("cellPropertiesPanel");
	    this._accessibleTableControl = $find("accessibilityPanel");

	    this._tablePreviewControl = this._cellPropertiesControl.get_tablePreviewControl();

	    this._insertButton = $get("InsertButton");
	    this._cancelButton = $get("CancelButton");

	    this._tab = $find("TableWizardTab");

	    this._initializeChildEvents();
	},

	_initializeChildEvents : function()
	{
	    $addHandlers(this._insertButton, {"click" : this._insertClickHandler}, this);
	    $addHandlers(this._cancelButton, {"click" : this._cancelClickHandler}, this);
	},

	_getModifiedTable : function()
	{
	    this._accessibleTableControl.set_tableToModify(this._table.cloneNode(true));
	    this._originalTableClone = this._accessibleTableControl._updateTable();

	    this._tablePropertiesControl.set_tableToModify(this._originalTableClone);
	    var modifiedTable = this._tablePropertiesControl._updateTable();
	    if(modifiedTable) this._originalTableClone = modifiedTable;

	    return this._originalTableClone;
	},

	 _insertClickHandler : function(e)
    {
        if (!this._saveLastEditedCellProperties(false))
		{
			return;
		}
		Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close({
		    tableToModify : this._getModifiedTable() 
		    , styleSheetToImport : this._tablePropertiesControl._tableBorderControl._selectedStyleSheet
		    , styleSheetToRemove : this._tablePropertiesControl._tableBorderControl._styleSheetToRemove	
		});
    },

     _cancelClickHandler : function(e)
    {
        if (this._table && this._table.parentNode) //TEKI: According to SAFARI parentNode could be null when Cancel is pressed
		this._table.parentNode.replaceChild(this._originalTableClone, this._table);
		this._table = this._originalTableClone;

		Telerik.Web.UI.Dialogs.CommonDialogScript.get_windowReference().close();
    },

    /////////////////////////////////////////////////////////
     _getCurrentlyEditedCell : function()
	{
		return this._currentlyEditedCell;
	},

	_onCellPropertiesSelectedCellChanged : function()
	{
		// Update the last edited cells
		var editedCells = this._tablePreviewControl.get_editedCells();
		this._cellPropertiesControl._updateMultiple(this._getModifyCellsForPreviewCells(editedCells));

		this._synchronizeSelectedCell();

		if (this._selectedCell)
		{
			this._currentlyEditedCell = this._selectedCell;
			this._cellPropertiesControl._loadPropertyValues(this._selectedCell);
		}
	},

	_onCellPropertiesSelectedMultipleCells : function()
	{
		this._cellPropertiesControl._clear();
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
					this._selectedCell = (this._table.rows.length > 0) ? this._table.rows[i].cells[j] : null;

					this._selectedCellIndex = j;
					return;
				}
			}
		}
	},

	_synchronizeSelection : function(selectedCell, selectedIndex)
	{
	    this._selectedCell = selectedCell;
		this._selectedCellIndex = selectedIndex;
	},

	/**
	*
	* For a given preview cell return the model cell
	*
	*/
	_getModifyCellForPreviewCell : function(previewCell)
	{
	    if(!previewCell) return null;
		var rowIndex  = previewCell.parentNode.rowIndex;
		var cellIndex = this._tablePreviewControl._getCellIndex(previewCell);// PreviewCell.cellIndex; TEKI - SAFARI support! Defined in Common.js

		return (this._table.rows.length > 0) ? this._table.rows[rowIndex].cells[cellIndex] : null;
	},

	_getModifyCellsForPreviewCells : function(previewCells)
	{
		var modifyCells = [];

		for (var i=0; i < previewCells.length; i ++)
		{
			modifyCells.push(this._getModifyCellForPreviewCell(previewCells[i]));
		}

		return modifyCells;
	},

	_saveLastEditedCellProperties : function(saveSelectedCell)
	{
		if (this._currentlyEditedCell)
		{

			var selectedCells = this._tablePreviewControl.get_selectedCells();
			if (!this._cellPropertiesControl._updateMultiple(this._getModifyCellsForPreviewCells(selectedCells)))
			{
				return false;
			}
			if(!saveSelectedCell)
			{
			    this._selectedCell = null;
			    this._selectedCellIndex = -1;
			}
		}
		return true;
	},

	_initCellProperties : function()
	{
		/*WARNING! POSSIBLE CROSS REFERENCE! */
		var theTableWizardControl = this;
		this._tablePreviewControl._onSelectedCellChanged = function anon()
		{
			theTableWizardControl._onCellPropertiesSelectedCellChanged();
		};
		this._tablePreviewControl.deSelectAllCells();
		this._tablePreviewControl.set_allowMultiCellSelection(true);

		if(!this._originalSelectedCell)
		{
			if(!this._selectedCell)
				this._initSelectedCell();
		}
		else
		{
			this._selectedCell = this._originalSelectedCell;
			//Clear the originally selected cell.
			this._originalSelectedCell = null;
		}

		this._tablePreviewControl._updateTable(this._table, this._selectedCell);

		this._currentlyEditedCell = this._selectedCell;
		this._cellPropertiesControl.set_cellToModify(this._currentlyEditedCell);
		this._cellPropertiesControl._loadPropertyValues(this._currentlyEditedCell);
	},

	_initTableProperties : function()
	{
	    if(!this._originalSelectedCell)
		{
		    if(!this._selectedCell)
		        this._initSelectedCell();
		}
		else
		{
		    this._selectedCell = this._originalSelectedCell;
		    //Clear the originally selected cell.
	        this._originalSelectedCell = null;
	    }

		this._currentlyEditedCell = this._selectedCell;
		this._tablePropertiesControl.set_tableToModify(this._table.cloneNode(true));
		this._cellPropertiesControl.set_cellToModify(this._currentlyEditedCell);
	    this._cellPropertiesControl._loadPropertyValues(this._currentlyEditedCell);
	},

	_initAccessibleTable : function()
	{
	    //Clear the originally selected cell.
	    this._originalSelectedCell = null;

		this._saveLastEditedCellProperties(true);
		this._accessibleTableControl.set_tableToModify(this._table.cloneNode(true));
	},

	_initSelectedCell : function()
	{
	    if (this._table.rows.length > 0)
	    {
		    if (this._table.rows[0].cells.length > 0)
		    {
			    this._selectedCell = this._table.rows[0].cells[0];
		    }
	    }
	},

	_initDesigner : function()
	{
	    //Clear the originally selected cell.
	    this._originalSelectedCell = null;
		this._saveLastEditedCellProperties(true);

		this._tableDesignControl.set_tableWizardControl(this);

		//NEW _initSelectedCell on every opening of the Table Wizard
		if(!this._selectedCell || this._tableDesignControl._selectedCell != this._selectedCell)
		    this._initSelectedCell();
		    		    		    
		this._tableDesignControl.set_selectedCell(this._selectedCell);		
	},


    //////////////////////////////////////////////////////////


    dispose : function()
	{
	    $clearHandlers(this._insertButton);
	    $clearHandlers(this._cancelButton);

	    this._tab.remove_tabSelected(this.tabChangedHandler);

	    this._clientParameters = null;
	    this._insertButton = null;
	    this._cancelButton = null;
	    this._table = null;
	    this._originalSelectedCell = null;
	    this._currentlyEditedCell = null;
	    this._originalTableClone = null;
	    this._selectedCell = null;
	    this._tablePreviewControl = null;

	    this._accessibleTableControl = null;
	    this._tablePropertiesControl = null;
	    this._tableDesignControl = null;
	    this._cellPropertiesControl	= null;

		Telerik.Web.UI.Widgets.TableWizard.callBaseMethod(this, 'dispose');
	}
}

Telerik.Web.UI.Widgets.TableWizard.registerClass('Telerik.Web.UI.Widgets.TableWizard', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>

<style type="text/css">
/* NEW TABLE WIZARD DIALOG */

#TableDesign_PreviewTableHolder
{
   clear: both;
   padding-top: 4px;
}

#TableDesign_PreviewTableHolder table
{
    clear: both;
}

.reDialog .spinList
{
    height: 26px;
}

.reDialog .spinItem span
{
    line-height: 26px;
}
/*.reDialog.reTableWizard
{
	height: 420px;
	float: left;
}

*+html .reDialog.reTableWizard
{
	height: 410px;
}

.reDialog.reTableWizard .dialogtabstrip
{
	width: 653px;
}

.reDialog.reTableWizard .dialogtabstrip .tabIcon
{
	display: none;
}

.reDialog.reTableWizard .customControl .reToolbar,
.reDialog.reTableWizard .customControl .reToolbar li
{
	background: none;
}

.reDialog.reTableWizard .reColorPickerContainer li,
.reDialog.reTableWizard .reAlignmentContainer li
{
	height: 24px !important;
	line-height: 24px;
}

.reDialog.reTableWizard .customControl .reGrip
{
	display: none;
}

.reDialog.reTableWizard #tableWizardControlButtons
{
	position: absolute;
	bottom: 0;
	left: 17px;
	width: 620px;
	border: 0;
	border-top: 1px solid #868686;

	padding: 0;
	margin: 0;
}

.reDialog.reTableWizard #tableWizardControlButtons .floatright
{
	margin: 8px 0 0;
	padding: 0;
}

.reDialog.reTableWizard #tableWizardControlButtons legend
{
	display: none;
}

.reDialog.reTableWizard #tableWizardControlButtons ul
{
	list-style-type: none;
	width: 150px;
}

.reDialog.reTableWizard table.tableDesignPreview
{
	border: 0;
	background: #b0b0b0;
	empty-cells: show;
	width: 310px;
	height: 256px;
}

.reDialog.reTableWizard table.tableDesignPreview td
{
	background: #ececec;
	padding: 0; margin: 0;
	cursor: pointer;
	border: 1px solid #fdfdfd;
	width: auto !important;
}

.reDialog.reTableWizard table.tableDesignPreview td.reSelectedCell
{
	background: #cecece;
	border: 1px solid #d6d6d6;
}*/
/* END OF NEW TABLE WIZARD DIALOG */
</style>
<!-- table wizard -->
<table cellpadding="0" cellspacing="0" class="reDialog NoMarginDialog TableWizard" style="width: 706px">
	<tr>
		<td class="reTopcell">
			<telerik:RadTabStrip ShowBaseline="true" ID="TableWizardTab" runat="server" SelectedIndex="0" MultiPageID="dialogMultiPage">
				<Tabs>
					<telerik:RadTab Text="Table Design" Value="Tab1HeaderText">
					</telerik:RadTab>
					<telerik:RadTab Text="Table Properties" Value="Tab2HeaderText">
					</telerik:RadTab>
					<telerik:RadTab Text="Cell Properties" Value="Tab3HeaderText">
					</telerik:RadTab>
					<telerik:RadTab Text="Accessibility" Value="Tab4HeaderText">
					</telerik:RadTab>
				</Tabs>
			</telerik:RadTabStrip>
		</td>
	</tr>
	<tr>
		<td class="reMiddlecell" style="height: 400px; padding: 0; vertical-align: top;">
			<telerik:RadMultiPage ID="dialogMultiPage" runat="server" SelectedIndex="0">
				<telerik:RadPageView ID="tableDesignRow" runat="server">
					<dc:TableDesign id="tableDesignPanel" runat="server">
					</dc:TableDesign>
				</telerik:RadPageView>
				<telerik:RadPageView ID="tablePropertiesRow" runat="server">
					<dc:TableProperties id="tablePropertiesPanel" runat="server">
					</dc:TableProperties>
				</telerik:RadPageView>
				<telerik:RadPageView ID="cellPropertiesRow" runat="server">
					<dc:CellProperties id="cellPropertiesPanel" runat="server">
					</dc:CellProperties>
				</telerik:RadPageView>
				<telerik:RadPageView ID="accessibilityRow" runat="server">
					<dc:AccessibleTable id="accessibilityPanel" runat="server">
					</dc:AccessibleTable>
				</telerik:RadPageView>
			</telerik:RadMultiPage>
		</td>
	</tr>
	<tr>
		<td class="reBottomcell">
		    <table cellpadding="0" cellspacing="0" class="reConfirmCancelButtonsTbl">
                <tr>
                    <td style="padding-right: 8px;">
			            <button type="button" id="InsertButton">
						    <script type="text/javascript">
						    setInnerHtml("InsertButton", localization["OK"]);
						    </script>		
					    </button>
			        </td>
			        <td class="reRightMostCell">
			            <button type="button" id="CancelButton">
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
<!-- end of table wizard -->