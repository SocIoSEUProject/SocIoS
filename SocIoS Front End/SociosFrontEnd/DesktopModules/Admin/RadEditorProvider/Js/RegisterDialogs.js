var initToolCommands = function() {
	if (typeof Telerik !== "undefined" && typeof Telerik.Web.UI.Editor !== "undefined") {
		Telerik.Web.UI.Editor.CommandList["SaveTemplate"] = function(commandName, editor, args) {
			var htmlText = editor.get_html();

			var args;
			args[0] = htmlText;
			argument = args;

			var myCallbackFunction = function(sender, args) { };

			editor.showExternalDialog(
				__textEditorSaveTemplateDialog,
				argument,
				375,
				290,
				myCallbackFunction,
				null,
				'Save as Template',
				true,
				Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Resize,
				false,
				true);
		};

		Telerik.Web.UI.Editor.CommandList["DMXManager"] = function(commandName, editor, args) {

			var argument;
			var elem = editor.getSelectedElement(); //returns the selected element.

			if (elem.tagName == "A") {
				editor.selectElement(elem);
				argument = elem;
			}
			else {
				//remove links if present from the current selection - because of JS error thrown in IE
				editor.fire("Unlink");

				//remove Unlink command from the undo/redo list
				var commandsManager = editor.get_commandsManager();
				var commandIndex = commandsManager.getCommandsToUndo().length - 1;
				commandsManager.removeCommandAt(commandIndex);

				var content = editor.getSelectionHtml();

				var link = editor.get_document().createElement("A");

				link.innerHTML = content;
				link.name = content;
				argument = link;
			}


			var AddDMXLink = function(sender, args) {
				editor.pasteHtml(String.format("<a href='{0}' title='{1}'>{2}</a> ", args.href, args.title, args.innerHTML))
			}

			editor.showExternalDialog(
				__textEditorDMXManagerDialog,
				argument,
				728,
				541,
				AddDMXLink,
				null,
				'DMX Browser',
				true,
				Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Resize,
				false,
				true);
		};
	}
};

initToolCommands();
if(typeof Sys !== "undefined") {
	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
		initToolCommands();
	});
}




