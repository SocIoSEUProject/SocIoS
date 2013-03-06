if (typeof (Telerik) == "object") {
    Telerik.Web.UI.Editor.CommandList["SaveTemplate"] = function (commandName, editor, args) {
        var htmlText = editor.get_html();
        argument = htmlText;

        var myCallbackFunction = function (sender, args) { };

        editor.showExternalDialog(
    __textEditorSaveTemplateDialog,
    argument,
    375,
    275,
    myCallbackFunction,
    null,
    'Save as Template',
    true,
    Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Resize,
    false,
    true);
    };
}

