function OnClientCommandExecuting(editor, args) {
    var name = args.get_name(); //The command name
    var val = args.get_value(); //The tool that initiated the command

    switch (name) {
        case "Emoticons":
            //Set the background image to the head of the tool depending on the selected toolstrip item
            var tool = args.get_tool();
            var span = tool.get_element().getElementsByTagName("SPAN")[0];
            var fileName = val.substring(val.lastIndexOf('/') + 1, val.lastIndexOf('.'));
            span.style.backgroundImage = "url(" + val + ")";
            span.title = "Emoticons";
            //Paste the selected in the dropdown emoticon    
            editor.pasteHtml("<img src='" + val + "' title='" + fileName + "'>");

            //Cancel the further execution of the command
            args.set_cancel(true);
            break;
        case "ImageManager":
            var callbackFunction = function (sender, args) {
                //result holds the image element   
                var result = Telerik.Web.UI.Editor.Utils.getOuterHtml(args.get_value());
                var div = document.createElement("DIV");
                Telerik.Web.UI.Editor.Utils.setElementInnerHtml(div, result);

                //First child must be the image!    
                var img = div.firstChild;
                div.style.overflow = "hidden";
                div.style.width = "1px";
                div.style.height = "1px";

                document.body.appendChild(div);
                //GET THE INSERTED IMAGE WIDTH AND HEIGHT    
                //alert(img.offsetWidth + " -- " + img.offsetHeight);
                img.width = img.offsetWidth;
                img.height = img.offsetHeight;

                editor.pasteHtml(div.innerHTML, "ImageManager");
            };
            args.set_callbackFunction(callbackFunction);
            break;
    }
}