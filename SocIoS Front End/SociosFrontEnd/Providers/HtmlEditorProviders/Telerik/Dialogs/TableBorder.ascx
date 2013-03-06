<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.Editor" TagPrefix="tools" %>

<style type="text/css" id="telerik-reTable-1">
.telerik-reTable-1   {
	border-width: 0px;
	border-style: none;
	border-collapse: collapse;
	font-family: Tahoma;  
}
.telerik-reTable-1 tr.telerik-reTableHeaderRow-1      {
	margin: 10px;
	padding: 10px;
	color: #3F4D6B;
	background: #D6E8FF;
	text-align: left;
	font-size: 10pt;  
	font-style: normal;
	font-family: Tahoma;  
	text-transform: capitalize;
	font-weight: bold;
	border-spacing: 10px;
	line-height: 14pt;
	vertical-align: top;
}
.telerik-reTable-1 td.telerik-reTableHeaderFirstCol-1    {
	padding: 0in 5.4pt 0in 5.4pt;
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-1 td.telerik-reTableHeaderLastCol-1  {
	padding: 0in 5.4pt 0in 5.4pt; 
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-1 td.telerik-reTableHeaderOddCol-1 {
	padding:0in 5.4pt 0in 5.4pt; 
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-1 td.telerik-reTableHeaderEvenCol-1 
{
	padding:0in 5.4pt 0in 5.4pt; color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-1 tr.telerik-reTableOddRow-1  {
	color: #666666;
	background-color: #F2F3F4;
	font-size: 10pt;   
	vertical-align: top;
}
.telerik-reTable-1 tr.telerik-reTableEvenRow-1   {
	color: #666666;
	background-color: #E7EBF7;
	font-size: 10pt;   
	vertical-align: top;
}
.telerik-reTable-1 td.telerik-reTableFirstCol-1  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-1 td.telerik-reTableLastCol-1 {padding:0in 5.4pt 0in 5.4pt;}
.telerik-reTable-1 td.telerik-reTableOddCol-1  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-1 td.telerik-reTableEvenCol-1 {
	padding:0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-1 tr.telerik-reTableFooterRow-1     {
	background-color: #D6E8FF;
	color: #4A5A80;
	font-weight: 500;
	font-size: 10pt;  
	font-family: Tahoma;  
	line-height: 11pt;
}
.telerik-reTable-1 td.telerik-reTableFooterFirstCol-1  {
	padding: 0in 5.4pt 0in 5.4pt;
	border-top: solid gray 1.0pt;
	text-align: left;
}
.telerik-reTable-1 td.telerik-reTableFooterLastCol-1 {
	padding:0in 5.4pt 0in 5.4pt;
	border-top:solid gray 1.0pt;
	text-align:left;
}
.telerik-reTable-1 td.telerik-reTableFooterOddCol-1  {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
	border-top: solid gray 1.0pt;
}
.telerik-reTable-1 td.telerik-reTableFooterEvenCol-1  {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
	border-top: solid gray 1.0pt;
}
</style>

<style type="text/css" id="telerik-reTable-2">
.telerik-reTable-2   {
	border-collapse: collapse;
	border: solid 0px;
	font-family: Tahoma;   
}
.telerik-reTable-2 tr.telerik-reTableHeaderRow-2     {
	border-width: 1.0pt 1.0pt 3.0pt 1.0pt;
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 10.0pt;
	margin-left: 0in;
	line-height: 115%;
	font-size: 11.0pt;  
	font-family: "Calibri","sans-serif";  
	width: 119.7pt;
	border: solid white 1.0pt;
	border-bottom: solid white 3.0pt;
	background: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	color: #FFFFFF;	
}
.telerik-reTable-2 td.telerik-reTableHeaderFirstCol-2   {
	border-width: 1.0pt 1.0pt 3.0pt 1.0pt;
	border: solid white 1.0pt;
	border-bottom: solid white 3.0pt;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableHeaderLastCol-2  {
	border-width: 1.0pt 1.0pt 3.0pt 1.0pt;
	border: solid white 1.0pt;
	border-bottom: solid white 3.0pt;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableHeaderOddCol-2 {
	border-width: 1.0pt 1.0pt 3.0pt 1.0pt;
	border: solid white 1.0pt;
	border-bottom: solid white 3.0pt;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableHeaderEvenCol-2 {
	border-width: 1.0pt 1.0pt 3.0pt 1.0pt;
	border: solid white 1.0pt;
	border-bottom: solid white 3.0pt;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 tr.telerik-reTableOddRow-2 {
	color: #666666;
	background-color: #F2F3F4;
	font-size: 10pt;   
	vertical-align: top;
}
.telerik-reTable-2 tr.telerik-reTableEvenRow-2 {
	color: #666666;
	background-color: #E7EBF7;
	font-size: 10pt;   
	vertical-align: top;	
}
.telerik-reTable-2 td.telerik-reTableFirstCol-2  {
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 10.0pt;
	margin-left: 0in;
	line-height: 115%;
	font-size: 11.0pt;  
	font-family: "Calibri","sans-serif";  
	width: 119.7pt;
	border-top: none;
	border-left: solid white 1.0pt;
	border-bottom: none;
	border-right: solid white 3.0pt;
	background: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	color: #FFFFFF;
}
.telerik-reTable-2 td.telerik-reTableLastCol-2 {
	padding:0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableOddCol-2  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableEvenCol-2 {
	padding:0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 tr.telerik-reTableFooterRow-2    {
	color: #666666;
	background-color: #FFFFFF;
	font-size: 10pt;  
	vertical-align: top;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableFooterFirstCol-2  {
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 10.0pt;
	margin-left: 0in;
	line-height: 115%;
	font-size: 11.0pt;  
	font-family: "Calibri","sans-serif";  
	width: 119.7pt;
	border-top: none;
	border-left: solid white 1.0pt;
	border-bottom: none;
	border-right: solid white 3.0pt;
	background: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	color: #FFFFFF;
}
.telerik-reTable-2 td.telerik-reTableFooterLastCol-2 {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableFooterOddCol-2  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-2 td.telerik-reTableFooterEvenCol-2  {
	padding: 0in 5.4pt 0in 5.4pt;
}
</style>
<style type="text/css" id="telerik-reTable-3">
.telerik-reTable-3   {
	border-collapse: collapse;
	border: solid 0px;
	font-family: Tahoma;   
}
.telerik-reTable-3 tr.telerik-reTableHeaderRow-3   {
	margin: 10px;
	padding: 10px;
	color: #3a4663;
	text-align: left;
	font-size: 10pt;  
	font-style: normal;
	font-family: Verdana;  
	text-transform: capitalize;
	font-weight: normal;
	border-spacing: 10px;
	vertical-align: top;
	background-color: #C4D1E3;
}
.telerik-reTable-3 td.telerik-reTableHeaderFirstCol-3    {
	padding: 0in 5.4pt 0in 5.4pt;
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-3 td.telerik-reTableHeaderLastCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-3 td.telerik-reTableHeaderOddCol-3  {
	padding: 0in 5.4pt 0in 5.4pt;
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-3 td.telerik-reTableHeaderEvenCol-3 
 {
	padding: 0in 5.4pt 0in 5.4pt;
	color: #3a4663;
	line-height: 14pt;
}
.telerik-reTable-3 tr.telerik-reTableOddRow-3 {
	color:#666666;
	vertical-align: top;
	font-size: 10pt;  
}
.telerik-reTable-3 tr.telerik-reTableEvenRow-3 {
	color:#666666;
	vertical-align: top;
	font-size: 10pt;  
}
.telerik-reTable-3 td.telerik-reTableFirstCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	background-color: #E7EBF7;
}
.telerik-reTable-3 td.telerik-reTableLastCol-3  {
	padding: 0in 5.4pt 0in 5.4pt;
	background-color:#E7EBF7;
}
.telerik-reTable-3 td.telerik-reTableOddCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	background-color:#F7F3F7;
}
.telerik-reTable-3 td.telerik-reTableEvenCol-3  {
	padding: 0in 5.4pt 0in 5.4pt;
	background-color:#E7EBF7
}
.telerik-reTable-3 tr.telerik-reTableFooterRow-3      {
	background-color: #C4D1E3;
	color: #3a4663;
	font-weight: normal;
	font-size: 10pt;  
	font-family: Verdana;  
	line-height: 11pt;
}
.telerik-reTable-3 td.telerik-reTableFooterFirstCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
.telerik-reTable-3 td.telerik-reTableFooterLastCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
.telerik-reTable-3 td.telerik-reTableFooterOddCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
.telerik-reTable-3 td.telerik-reTableFooterEvenCol-3   {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
</style>

<style type="text/css" id="telerik-reTable-4">
.telerik-reTable-4   {
	border-collapse: collapse;
	border: solid 0px;
	font-family: Tahoma;   
}
.telerik-reTable-4 tr.telerik-reTableHeaderRow-4     {
	border-width: 1.0pt 1.0pt 3.0pt 1.0pt;
	margin-top: 0in;
	margin-right: 0in;
	margin-bottom: 10.0pt;
	margin-left: 0in;
	line-height: 115%;
	font-size: 11.0pt;  
	font-family: "Calibri","sans-serif";  
	width: 119.7pt;
	background: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	color: #FFFFFF;	
}
.telerik-reTable-4 td.telerik-reTableHeaderFirstCol-4   {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableHeaderLastCol-4  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableHeaderOddCol-4 {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableHeaderEvenCol-4 {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 tr.telerik-reTableOddRow-4 {
	border-width: 1pt;
	color: #666666;
	font-size: 10pt;  
	vertical-align: top;
	border-bottom-style: solid;
	border-bottom-color: #4F81BD;
}
.telerik-reTable-4 tr.telerik-reTableEvenRow-4 {
	color: #666666;
	font-size: 10pt;  
	vertical-align: top;	
}
.telerik-reTable-4 td.telerik-reTableFirstCol-4  {
	border-width: 1pt;
	border-color: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	border-bottom-style: solid;
	border-left-style: solid;
}
.telerik-reTable-4 td.telerik-reTableLastCol-4 {
	border-width: 1pt;
	border-color: #4F81BD;
	border-bottom-style: solid;
	border-right-style: solid;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableOddCol-4  {
	border-width: 1pt;
	border-color: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	border-bottom-style: solid;
}
.telerik-reTable-4 td.telerik-reTableEvenCol-4 {
	border-width: 1pt;
	border-color: #4F81BD;
	padding: 0in 5.4pt 0in 5.4pt;
	border-bottom-style: solid;
}
.telerik-reTable-4 tr.telerik-reTableFooterRow-4    {
	color: #355C8C;
	background-color: #FFFFFF;
	font-size: 10pt;  
	vertical-align: top;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableFooterFirstCol-4  {
	border-width: 1pt;
	border-color: #4F81BD;
	border-bottom-style: solid;
	border-left-style: solid;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableFooterLastCol-4 {
	border-width: 1pt;
	border-color: #4F81BD;
	border-bottom-style: solid;
	border-right-style: solid;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableFooterOddCol-4  {
	border-width: 1pt;
	border-color: #4F81BD;
	border-bottom-style: solid;
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-4 td.telerik-reTableFooterEvenCol-4  {
	border-width: 1pt;
	border-color: #4F81BD;
	border-bottom-style: solid;
	padding: 0in 5.4pt 0in 5.4pt;
}
</style>
<style type="text/css" id="telerik-reTable-5">
.telerik-reTable-5   {
	border-collapse: collapse;
	border: solid 0px;
	font-family: Tahoma   
}
.telerik-reTable-5 tr.telerik-reTableHeaderRow-5     {
	margin: 10px;
	padding: 10px;
	color: #3A4663;
	text-align: left;
	font-size: 10pt;  
	font-style: normal;
	font-family: Tahoma;  
	text-transform: capitalize;
	font-weight: 500;
	border-spacing: 10px;
	line-height: 11pt;
	vertical-align: top;
}
.telerik-reTable-5 td.telerik-reTableHeaderFirstCol-5   {
	padding: 0in 5.4pt 0in 5.4pt;
	color: #3a4663;
}
.telerik-reTable-5 td.telerik-reTableHeaderLastCol-5  {
	padding: 0in 5.4pt 0in 5.4pt; 
	color: #3a4663;
}
.telerik-reTable-5 td.telerik-reTableHeaderOddCol-5 {
	padding:0in 5.4pt 0in 5.4pt; 
	color: #3a4663;
}
.telerik-reTable-5 td.telerik-reTableHeaderEvenCol-5 
{padding:0in 5.4pt 0in 5.4pt; color: #3a4663;
}
.telerik-reTable-5 tr.telerik-reTableOddRow-5 {
	color: #666666;
	vertical-align: top;
	font-size: 10pt; 
}
.telerik-reTable-5 tr.telerik-reTableEvenRow-5 {
	color: #666666;
	vertical-align: top;	
	font-size: 10pt; 
}
.telerik-reTable-5 td.telerik-reTableFirstCol-5  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-5 td.telerik-reTableLastCol-5 {padding:0in 5.4pt 0in 5.4pt;}
.telerik-reTable-5 td.telerik-reTableOddCol-5  {
	padding: 0in 5.4pt 0in 5.4pt;
}
.telerik-reTable-5 td.telerik-reTableEvenCol-5 {padding:0in 5.4pt 0in 5.4pt;}
.telerik-reTable-5 tr.telerik-reTableFooterRow-5    {
	color: #3a4663;
	font-weight: 500;
	font-size: 10pt; 
	font-family: Tahoma;  
	line-height: 11pt;
}
.telerik-reTable-5 td.telerik-reTableFooterFirstCol-5  {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
.telerik-reTable-5 td.telerik-reTableFooterLastCol-5 {
	padding:0in 5.4pt 0in 5.4pt;
	text-align:left;
}
.telerik-reTable-5 td.telerik-reTableFooterOddCol-5  {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
.telerik-reTable-5 td.telerik-reTableFooterEvenCol-5  {
	padding: 0in 5.4pt 0in 5.4pt;
	text-align: left;
}
</style>
<script type="text/javascript">
Type.registerNamespace("Telerik.Web.UI.Widgets");
Telerik.Web.UI.Widgets.TableBorder = function(element)
{
	Telerik.Web.UI.Widgets.TableBorder.initializeBase(this, [element]);
    
    //Initioalize properties 
    this._editorRef = null; 
    this._previewTable = null;
    this._table = null;
    this._cssFilePath = null;
        
    this._tableFormat = null;
    this._formatName = null;
    this._headerRow = null;
    this._lastRow = null;
    this._firstColumn = null;
    this._lastColumn = null;
    
    this._formats = []; 
    
    this._selectedStyleSheet = null; 
    this._styleSheetToRemove = null;     
    this._classToClear = null;
    this._canFormatTable = false;
}

var TABLE_BORDER_CONTROL = null;

Telerik.Web.UI.Widgets.TableBorder.prototype = {
	initialize : function()
	{
		Telerik.Web.UI.Widgets.TableBorder.callBaseMethod(this, "initialize");				        
		
		this._styleSheetToRemove = null;        
        this._classToClear = null;
		this._initializeChildren();
		this._initializeChildEvents();
	},

	_initializeChildren : function()
	{
	    //initialize elements
	    this._previewTable = $get("PreviewTable");
		
		this._formatName = $get("FormatName");
		this._headerRow = $get("HeaderRow");
		this._lastRow = $get("LastRow");
		this._firstColumn = $get("FirstColumn");
		this._lastColumn = $get("LastColumn");
		
		TABLE_BORDER_CONTROL = this;
	},
	
	_setClassName : function(element, className)
	{
	    if (element)
	    {
	        if ($telerik.isIE) element.className = className;	        
	        else element.setAttribute("class", className);
	    }	    
	},
	
	_getClassName : function(element)
	{
	    if (element)
	    {
	        var className = (element.className) ? element.className : element.getAttribute("class");	              
	        return (className != null) ? className : "";
	    }
	    
	    return "";
	},

	_initializeChildEvents : function()
	{
		$addHandlers(this._formatName, {"change" : this._formatNameHandler}, this);
		$addHandlers(this._headerRow, {"click" : this._headerRowHandler}, this);
		$addHandlers(this._lastRow, {"click" : this._lastRowHandler}, this);
		$addHandlers(this._firstColumn, {"click" : this._firstColumnHandler}, this);
		$addHandlers(this._lastColumn, {"click" : this._lastColumnHandler}, this);
	},
	
	get_tableFormat : function()
	{
	    return this._tableFormat();
	},
	
	set_tableFormat : function(value)
	{
	    this._tableFormat = value;
	},

	clientInit : function(clientParameters)
	{
		this._clientParameters = clientParameters;
		
		this._editorRef = clientParameters.editor;
				
		//initialize		
		this._table = this._clientParameters.tableToModify;  
		this._cssFilePath = clientParameters.tableLayoutCssFile;		
		if (this._cssFilePath) Telerik.Web.UI.Editor.Utils.addStyleSheet(this._cssFilePath);
		
		this._formats = clientParameters.tableFormats;		
		this._loadData();	
	},			
	
	_formatNameHandler : function(e)
	{
	    if (e) this._canFormatTable = true;	    	    
	    var formatName = this._formatName.value;
	    
	    if (!formatName)
	    {
	        this._tableFormat = null;
	        this._clearTableFormat(this._previewTable);
	        
	        this._headerRow.setAttribute("checked", "checked");
			this._lastRow.setAttribute("checked", "checked");
			this._firstColumn.setAttribute("checked", "checked");
			this._lastColumn.setAttribute("checked", "checked");
	        
	        this._headerRow.setAttribute("disabled", "disabled");
			this._lastRow.setAttribute("disabled", "disabled");
			this._firstColumn.setAttribute("disabled", "disabled");
			this._lastColumn.setAttribute("disabled", "disabled");
	    }
	    else
	    {
			this._headerRow.setAttribute("disabled", "");
			this._lastRow.setAttribute("disabled", "");
			this._firstColumn.setAttribute("disabled", "");
			this._lastColumn.setAttribute("disabled", "");
			
	        var formatsLength = this._formats.length;
	        for (var i = 0; i < formatsLength; i++)
	        {
    	        var format = this._formats[i];
    	        if (formatName == format.name)
    	        {
    	            this._tableFormat = this._formats[i];
	                this._setTableFormat(this._previewTable, this._tableFormat);  
	                break;
    	        }  
	        }	        
	    }		    
	},

	_headerRowHandler : function(e)
	{
	    if (e) this._canFormatTable = true;
		this._setTableFormat(this._previewTable, this._tableFormat);
	},
	
	_lastRowHandler : function(e)
	{
	    if (e) this._canFormatTable = true;
		this._setTableFormat(this._previewTable, this._tableFormat);
	},
	
	_firstColumnHandler : function(e)
	{
	    if (e) this._canFormatTable = true;
		this._setTableFormat(this._previewTable, this._tableFormat);
	},
	
	_lastColumnHandler : function(e)
	{
	    if (e) this._canFormatTable = true;
		this._setTableFormat(this._previewTable, this._tableFormat);
	},
	
	_loadStyleSheetFormats : function(styleSheet)
	{	    
	    if (typeof(this._formats) != "object") this._formats = [];
	    var formats = [];	    
	    var itemsArray = [];	    
	    this._editorRef._getStyleSheetRules(itemsArray, styleSheet, null);
	    var arTableClasses = this._getTableClassesArray(itemsArray);
	    	    
	    if(!arTableClasses) return;
	    var arTableClassesLength = arTableClasses.length;	    
	    for (var i = 0; i < arTableClassesLength; i++)
	    {	        
	        var tableClassName = arTableClasses[i];	        
	        formats[i] = this._setFormatByClassName(itemsArray, tableClassName);	 
	    }	 
	    
	    this._formats = this._formats.concat(formats); 	    
	},
	
	_setFormatByClassName : function(itemsArray, tableClassName)
	{	    	    
	    var format = {
            name : ""
            , text : ""
            , table : ""
            , evenRow : ""
            , oddRow : ""
            , headerRow : ""
            , footerRow : ""
            , evenHeaderCol : ""
            , oddHeaderCol : ""
            , firstHeaderCol : ""
            , lastHeaderCol : ""
            , evenCol : ""
            , oddCol : ""
            , firstCol : ""
            , lastCol : ""
            , evenFooterCol : ""
            , oddFooterCol : ""
            , firstFooterCol : ""
            , lastFooterCol : ""
        };	    	    
	    
	    format.name = tableClassName;
	    format.text = tableClassName;
	    format.table = tableClassName;
	    
	    var tableClassNameMachString = tableClassName + " ";
	    var itemsArrayLength = itemsArray.length;
	    for (var i = 0; i < itemsArrayLength; i++)
	    {	        
            var selectorText = itemsArray[i][1].selectorText.substr(1);            
            if (selectorText.indexOf(" ") != -1 && selectorText.indexOf(tableClassNameMachString) != -1)
            {                
                var className = itemsArray[i][0];
                if(selectorText.match(/TableEvenRow/i) != null)
                    format.evenRow = className.replace(/TableEvenRow/i, "TableEvenRow");
                else if(selectorText.match(/TableOddRow/i) != null)
                    format.oddRow = className.replace(/TableOddRow/i, "TableOddRow");
                else if(selectorText.match(/TableHeaderRow/i) != null)
                    format.headerRow = className.replace(/TableHeaderRow/i, "TableHeaderRow");
                else if(selectorText.match(/TableFooterRow/i) != null)
                    format.footerRow = className.replace(/TableFooterRow/i, "TableFooterRow");
                else if(selectorText.match(/TableHeaderEvenCol/i) != null)
                    format.evenHeaderCol = className.replace(/TableHeaderEvenCol/i, "TableHeaderEvenCol");
                else if(selectorText.match(/TableHeaderOddCol/i) != null)
                    format.oddHeaderCol = className.replace(/TableHeaderOddCol/i, "TableHeaderOddCol");
                else if(selectorText.match(/TableHeaderFirstCol/i) != null)
                    format.firstHeaderCol = className.replace(/TableHeaderFirstCol/i, "TableHeaderFirstCol");
                else if(selectorText.match(/TableHeaderLastCol/i) != null)
                    format.lastHeaderCol = className.replace(/TableHeaderLastCol/i, "TableHeaderLastCol");
                else if(selectorText.match(/TableEvenCol/i) != null)
                    format.evenCol = className.replace(/TableEvenCol/i, "TableEvenCol");
                else if(selectorText.match(/TableOddCol/i) != null)
                    format.oddCol = className.replace(/TableOddCol/i, "TableOddCol");
                else if(selectorText.match(/TableFirstCol/i) != null)
                    format.firstCol = className.replace(/TableFirstCol/i, "TableFirstCol");
                else if(selectorText.match(/TableLastCol/i) != null)
                    format.lastCol = className.replace(/TableLastCol/i, "TableLastCol");
                else if(selectorText.match(/TableFooterEvenCol/i) != null)
                    format.evenFooterCol = className.replace(/TableFooterEvenCol/i, "TableFooterEvenCol");
                else if(selectorText.match(/TableFooterOddCol/i) != null)
                    format.oddFooterCol = className.replace(/TableFooterOddCol/i, "TableFooterOddCol");
                else if(selectorText.match(/TableFooterFirstCol/i) != null)
                    format.firstFooterCol = className.replace(/TableFooterFirstCol/i, "TableFooterFirstCol");
                else if(selectorText.match(/TableFooterLastCol/i) != null)
                    format.lastFooterCol = className.replace(/TableFooterLastCol/i, "TableFooterLastCol");
            }
	    }
	    
	    return format;
	},
	
	_getTableClassesArray : function(itemsArray)
	{
	    var arTableClasses = [];
	    var itemsArrayLength = itemsArray.length;
	    
	    count = 0;	    
	    for (var i = 0; i < itemsArrayLength; i++)
	    {
	        var selectorText = itemsArray[i][1].selectorText.substr(1);
	        if (selectorText.indexOf(" ") == -1)
	        {	            	            	            	            
	            arTableClasses[count++] = selectorText;
	        }
	    }	    
	    
	    return arTableClasses;
	},

	_loadData : function()
	{		    
	    // check if formatting was applied over the selected table
	    this._styleSheetToRemove = null;	
	    this._classToClear = "";	
	    this._canFormatTable = false;    
	    
	    
	    
	    if (!this._formats)
	    {
	        var styleSheets = this._editorRef.get_document().styleSheets;
	        var cssStyleSheet = null;
	        var styleSheetsLength = styleSheets.length;
	        if (this._cssFilePath)
	        {
	            for (var i = 0; i < styleSheetsLength; i++)
	            {
	                styleSheet = styleSheets[i];
	                styleSheetHref = styleSheet.href;
	                if (this._cssFilePath.indexOf("http://") == -1)
	                {
	                    var ownerNode = (styleSheet.ownerNode) ? styleSheet.ownerNode : styleSheet.owningElement;
	                    if (ownerNode)
	                    {
	                        styleSheetHref = ownerNode.getAttribute("href", 2);
	                    }	                    
	                }	                
	                
	                if (styleSheetHref == this._cssFilePath)
	                {	                    
	                    cssStyleSheet = styleSheet;	                    
	                    break;
	                }                    
	            }
	            this._loadStyleSheetFormats(styleSheet); //loads different formats in the _format array using the styleSheet rules	            
	        }
	        	        
	        if (!cssStyleSheet  && !this._cssFilePath)
	        {
	            styleSheets = document.styleSheets;
	            styleSheetsLength = styleSheets.length; 
	            for (var i = 0; i < styleSheetsLength; i++)
	            {	                 
	                styleSheet = styleSheets[i];
	                var styleSheetId = (typeof(styleSheet.id) != "undefined") ? styleSheet.id : styleSheet.ownerNode.id;	                
	                if (styleSheetId.indexOf("telerik-reTable") != -1)	                
	                {	                    
	                    cssStyleSheet = styleSheet;
	                    this._loadStyleSheetFormats(styleSheet); //loads different formats in the _format array using the styleSheet rules
	                }	                    
	            } 
	        }	        	        	        	        
	    }	    	    
	    
	    if(this._formats)
	    {	    
	        //clear this._formatName
	        var options = this._formatName.options;
	        var optionsLength = options.length;
	        var formatsLength = this._formats.length;	    
	        if (optionsLength == 1) //loading the table formats
	        {	        
	            for (var i = 0; i < formatsLength; i++)
	            {
	                var tableFormat = this._formats[i];	            
	                var option = document.createElement('option');
                    option.setAttribute('value', tableFormat.name);
                    option.appendChild(document.createTextNode(tableFormat.text));
                    this._formatName.appendChild(option);
	            }
	        }	    	    	    
    	    
		    if (this._table)
		    {
		        var bClearFormat = true;
		        var tableClassName = this._getClassName(this._table);		    
		        if (tableClassName)
		        {		        
		            for (var i = 0; i < formatsLength; i++)
                    {
                        var format = this._formats[i];                       
                        if (format.table == tableClassName)
                        {                        
                            this._formatName.value = format.name;
                            
                            if (!this._cssFilePath && this._editorRef) this._styleSheetToRemove = $get(tableClassName); //load styleSheet to remove only if there is no cssFilePath
                            this._classToClear = tableClassName; //can clear format if you selected no formatting
                            
                            //check end cells
                            var rows = this._table.rows;                        
                            var firstRow = rows[0];
                            var lastRow = rows[rows.length - 1];
                            
                            if (this._getClassName(firstRow) == format.headerRow)
                                this._headerRow.checked = "checked";
                            else
                                this._headerRow.checked = "";
                               
                            if (this._getClassName(lastRow) == format.footerRow)
                                this._lastRow.checked = "checked";
                            else
                                this._lastRow.checked = "";
                            
                            //check the className of the first and the last cell of the first row
                            var cells = firstRow.cells;                        
                            var firstCellClassName = this._getClassName(cells[0]);
                            var lastCellClassName = this._getClassName(cells[cells.length - 1]);
                            if (firstCellClassName == format.firstCol || firstCellClassName == format.firstHeaderCol)
                                this._firstColumn.checked = "checked";
                            else
                                this._firstColumn.checked = "";
                                
                            if (lastCellClassName == format.lastCol || lastCellClassName == format.lastHeaderCol)
                                this._lastColumn.checked = "checked";
                            else 
                                this._lastColumn.checked = "";
                           
                           bClearFormat = false;    
                           break; 
                        }                    
                    }
		        }
    		    
		        if (bClearFormat)
		        {		        
		            this._formatName.value = "";
		            this._headerRow.checked = "checked";
		            this._lastRow.checked = "checked"; 
		            this._firstColumn.checked = "checked";
		            this._lastColumn.checked = "checked";
		        }
    		    		    
		        this._formatNameHandler(false);
		    }
		}
	},		

	_updateTarget : function()
	{
        if (null != this._table)        
        {  
            if (this._canFormatTable)
            {  
                if (this._tableFormat)
                {
                    this._setTableFormat(this._table, this._tableFormat);
                    if (!this._cssFilePath && this._editorRef)
                    {                        
                        this._selectedStyleSheet = $get(this._tableFormat.name);                        
                    }
                }                     
                else if (this._classToClear)
                {                    
                    var oldClassName = this._getClassName(this._table);                    
                    this._clearTableFormat(this._table);                    
                    if(oldClassName != this._classToClear) this._setClassName(this._table, oldClassName);                    
                }
            }                  
            
            if (!this._cssFilePath && this._getClassName(this._table) == this._classToClear) this._styleSheetToRemove = null; //if there is no chenge of the formating do not remove the StyleSheet.
            
            return this._table;
        }
                
        return null;
	},

	set_tableToModify : function(value)
	{
		this._table = value;
	},
	
	_clearTableFormat : function(table)
	{
	    if (!table) return false;
	    this._setClassName(table, "");	    
	    var rows = table.rows;
	    var rowsLength = rows.length;
	    for (var i = 0; i < rowsLength; i++)
	    {
	        var row = rows[i];
	        this._setClassName(row, "");	        
	        var cells = row.cells;
	        var cellsLength = cells.length;
	        for (var j = 0; j < cellsLength; j++)
	        {
	            var cell = cells[j];
	            this._setClassName(cell, "");	            
	        }
	    }
	},
    
    _setTableFormat : function(table, format)
	{
	    if (!table || !format) return false;
	    	    
	    var headerRowChecked = this._headerRow.checked;
	    var lastRowChecked = this._lastRow.checked;
	    var firstColumnChecked = this._firstColumn.checked;
	    var lastColumnChecked = this._lastColumn.checked;
	    
	    //set the calss name of the table
	    this._setClassName(table, format.table);	    
	    var rows = table.rows;
	    if (rows)
	    {
	        var rowsLength = rows.length;
	        var rowsEndIndex = rowsLength - 1;
	        for (var i = 0; i < rowsLength; i++)
	        {
	            var row = rows[i];
	            var rowClassName = "";
	            // setting the class name to the row 
	            if (i == 0 && headerRowChecked)
	                rowClassName = format.headerRow;
	            else if (i == rowsEndIndex && lastRowChecked)
	                rowClassName = format.footerRow;
	            else
	                rowClassName = (i % 2 == 0) ? format.evenRow : format.oddRow;
	            
	            this._setClassName(row, rowClassName);	            
                var cells = row.cells;
                if (cells) 
                {
                    var cellsLength = cells.length;
                    var cellsEndIndex = cellsLength - 1;
                    for (var j = 0; j < cellsLength; j++)
                    {
                        var cell = cells[j];
                        var cellClassName = "";
                        
                        //setting the class name of the cell
                        if (i == 0 && j == 0) //first cell of first row
                        {
                            if (!headerRowChecked && !firstColumnChecked)
                                cellClassName = format.evenCol;
                            else if (!headerRowChecked && firstColumnChecked)
                                cellClassName = format.firstCol;
                            else if (headerRowChecked && !firstColumnChecked)
                                cellClassName = format.evenHeaderCol; 
                            else if (headerRowChecked && firstColumnChecked)
                                cellClassName = format.firstHeaderCol;  
                        }                            
                        else if (i == 0 && j == cellsEndIndex) //last cell of first row
                        {
                            if (!headerRowChecked && !lastColumnChecked)
                                cellClassName = (cellsEndIndex % 2 == 0) ? format.evenCol : format.oddCol;
                            else if (!headerRowChecked && lastColumnChecked)
                                cellClassName = format.lastCol;
                            else if (headerRowChecked && !lastColumnChecked)
                                cellClassName = (cellsEndIndex % 2 == 0) ? format.evenHeaderCol : format.oddHeaderCol;
                            else if (headerRowChecked && lastColumnChecked)
                                cellClassName = format.lastHeaderCol;
                        }                            
                        else if (i == 0 && headerRowChecked) //non-end cell of the first row. If !headerRowChecked it will be processed as normal cell
                        {                            
                            cellClassName = (j % 2 == 0) ? format.evenHeaderCol : format.oddHeaderCol;                            
                        }                            
                        else if (i == rowsEndIndex && j == 0) //first cell of the last row.
                        {
                            if (!lastRowChecked && !firstColumnChecked)                            
                                cellClassName = format.evenCol;                            
                            else if (!lastRowChecked && firstColumnChecked)                            
                                cellClassName = format.firstCol;                            
                            else if (lastRowChecked && !firstColumnChecked)                             
                                cellClassName = format.evenFooterCol;                             
                            else if (lastRowChecked && firstColumnChecked)                            
                                cellClassName = format.firstFooterCol;                            
                        }
                        else if (i == rowsEndIndex && j == cellsEndIndex) //last cell of the last row.
                        {
                            if (!lastRowChecked && !lastColumnChecked)                            
                                cellClassName = (cellsEndIndex % 2 == 0) ? format.evenCol : format.oddCol;
                            else if (!lastRowChecked && lastColumnChecked)                            
                                cellClassName = format.lastCol;
                            else if (lastRowChecked && !lastColumnChecked)
                                cellClassName = (cellsEndIndex % 2 == 0) ? format.evenFooterCol : format.oddFooterCol;                                
                            else if (lastRowChecked && lastColumnChecked)                            
                                cellClassName = format.lastFooterCol; 
                        }                            
                        else if (i == rowsEndIndex && lastRowChecked) //non-end cell of the last row. If !headerRowChecked it will be processed as normal cell
                            cellClassName = (j % 2 == 0) ? format.evenFooterCol : format.oddFooterCol;
                        else if (j == 0 && firstColumnChecked) //first cell of non-end row.
                            cellClassName = format.firstCol;
                        else if (j == cellsEndIndex && lastColumnChecked) //last cell of non-end row.
                            cellClassName = format.lastCol;
                        else
                             cellClassName = (j % 2 == 0) ? format.evenCol : format.oddCol;
                       
                       this._setClassName(cell, cellClassName);                       
                    }
                } 
                
	        }
	    }	    	    
	}, 
	
	_disposeChildEvents : function()
	{
	    $clearHandlers(this._formatName);
		$clearHandlers(this._headerRow);
		$clearHandlers(this._lastRow);
		$clearHandlers(this._firstColumn);
		$clearHandlers(this._lastColumn);				
	},

	dispose : function()
	{
		this._disposeChildEvents();
        
        this._tableFormat = null;
		this._formatName = null;
		this._headerRow = null;
		this._lastRow = null;
		this._firstColumn = null;
		this._lastColumn = null;				

		TABLE_BORDER_CONTROL = null;
		Telerik.Web.UI.Widgets.TableBorder.callBaseMethod(this, "dispose");
	}
}

Telerik.Web.UI.Widgets.TableBorder.registerClass('Telerik.Web.UI.Widgets.TableBorder', Telerik.Web.UI.RadWebControl, Telerik.Web.IParameterConsumer);
</script>
<style type="text/css">
    .TableFormatter table
    {
        table-layout: fixed;
    } 
</style>
<div style="margin: 10px;"  class="TableFormatter">	
    <div style="margin-bottom: 5px;">
        <select id="FormatName"  style="width: 200px;">
            <option selected="selected" value="">
                <script type="text/javascript">document.write(localization["NoCSSClassLayout"]);</script>                
            </option>            
        </select> 
    </div> 
    <div style="margin-bottom: 5px;">
        <script type="text/javascript">document.write(localization["ApplySpecialFormatsTo"]);</script> 
    </div> 
	<table id="toolsTable" width="100%" border="0" cellpadding="0" cellspacing="0" style="text-align: left; margin-bottom: 50px;">	    
	    <tr>
	        <td style="vertical-align: top;">
	            <div><input type="checkbox" disabled="disabled" checked id="HeaderRow"/> <script type="text/javascript">document.write(localization["HeadingRow"]);</script></div>	            
	            <div><input type="checkbox" disabled="disabled" checked id="FirstColumn"/> <script type="text/javascript">document.write(localization["FirstColumn"]);</script></div>	            
	        </td>
	        <td style="vertical-align: top;">
	            <div><input type="checkbox" disabled="disabled" checked id="LastRow"/> <script type="text/javascript">document.write(localization["LastRow"]);</script></div>
	            <div><input type="checkbox" disabled="disabled" checked id="LastColumn"/> <script type="text/javascript">document.write(localization["LastColumn"]);</script></div> 
	        </td>
	    </tr>
	</table>
	<div style="margin-bottom: 5px;">
	    <script type="text/javascript">document.write(localization["Preview"]);</script>:
	</div>
	<table id="PreviewTable" style="width: 100%;text-align: left;">
		<thead>
			<tr>
				<th></th>
				<th>Jan</th>
				<th>Feb</th>
				<th>Mar</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>East</td>
				<td>7</td>
				<td>7</td>
				<td>5</td>
				<td>19</td>
			</tr>
			<tr>
				<td>West</td>
				<td>6</td>
				<td>4</td>
				<td>7</td>
				<td>17</td>
			</tr>
			<tr>
				<td>South</td>
				<td>8</td>
				<td>7</td>
				<td>9</td>
				<td>24</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>Total</td>
				<td>21</td>
				<td>18</td>
				<td>21</td>
				<td>60</td>
			</tr>
		</tfoot>
	</table>
</div>