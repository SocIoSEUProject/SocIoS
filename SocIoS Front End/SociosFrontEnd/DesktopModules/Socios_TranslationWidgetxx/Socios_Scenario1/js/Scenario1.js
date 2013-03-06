var prm;

$(document).ready(function () {
    // $('#contact-user-form').fadeOut();

    $('.green-info-box').delay(500).fadeIn('fast').delay(3000).fadeOut();

    $('.message-user').click(function () {
        // $('#contact-user-form').dialog({ modal: true, minHeight: 0, title: 'Contact user', show: "fadeIn", hide: "fadeOut" });

        // var dialog = $(this).parent().find(".user-consent-form").dialog({ modal: true, minHeight: 0, title: 'Contact user', show: "fadeIn", hide: "fadeOut" });
        // dialog.parent().appendTo(jQuery("form:first"));
    })



    $('.media-item-add-user').live('click', function () {



        var usernameToAdd = $(this).parent().parent().find('.author-username span:eq(0)').html();
        var sourceToAdd = $(this).parent().parent().find('.author-username .source-wrap').html();
        var nameToAdd = $(this).parent().parent().find('.author-username span:eq(1)').html();



        $('#AddPersonIdAnchorElement').next().val(usernameToAdd);
        $('#AddPersonIdAnchorElement').next().next().val(sourceToAdd);
        $('#AddPersonIdAnchorElement').next().next().next().val(nameToAdd);
        var dialog = $('#add-to-group-form').dialog({ modal: true, minHeight: 0, title: 'Add user to a group', show: "fadeIn", hide: "fadeOut" });
        dialog.parent().appendTo(jQuery("form:first"));
    });

    $('.GetUserDetails').live('click', function () {
        $(this).parent().parent().find('.authorLoading').removeClass('hidden');
    });



    $('.person-container-item .add-user').live('click', function () {

        var usernameToAdd = $(this).parent().parent().find('.author-username span').html();
        var sourceToAdd = $(this).parent().parent().find('.author-username .source-wrap').html();
        var nameToAdd = $(this).parent().parent().find('.author-username .name-wrap').html();



        $('#AddPersonIdAnchorElement').next().val(usernameToAdd);
        $('#AddPersonIdAnchorElement').next().next().val(sourceToAdd);
        $('#AddPersonIdAnchorElement').next().next().next().val(nameToAdd);
        var dialog = $('#add-to-group-form').dialog({ modal: true, minHeight: 0, title: 'Add user to a group', show: "fadeIn", hide: "fadeOut" });
        dialog.parent().appendTo(jQuery("form:first"));
    });

    $(".media-item-ranking-control input").live('click', function () {
        $(this).parent().parent().hide();
        //$(this).val("Loading");
        $(this).parent().parent().parent().next().removeClass("hidden");
        //getRatingBtnWrap
        //$(this).addClass('loading');
        // $(this).val('Loading rating...');
    });

    $(".negotiateUsageWrap input").live('click', function () {
        $(this).parent().parent().hide();
        //$(this).val("Loading");
        $(this).parent().parent().next().removeClass("hidden");
        //getRatingBtnWrap
        //$(this).addClass('loading');
        // $(this).val('Loading rating...');
    });

    $('.remove-user').click(function () {
        $('#remove-from-group-form').dialog({ modal: true, minHeight: 0, title: 'Remove user from a group', show: "fadeIn", hide: "fadeOut" });
    })

    $('.media-item-thumb').click(function () {
        //        var test2 = $(this);
        //        var test1 = $(this).next();
        //        var test3 = $(this).next().find(".view-media-item");
        //        $(this).next().find(".view-media-item").dialog({ modal: true, minHeight: 0, width: '580px', title: 'Media item view', show: "fadeIn", hide: "fadeOut" });
    })

    $('[title="contact-user"]').live('click', function () {
        $('#user-consent-form').dialog({ modal: true, minHeight: 0, width: '580px', title: 'User contact form', show: "fadeIn", hide: "fadeOut" });
    })

    $('[title="request-consent-user"]').live('click', function () {
        $('#user-consent-form').dialog({ modal: true, minHeight: 0, width: '580px', title: 'User consent request form', show: "fadeIn", hide: "fadeOut" });
    })

    //    $('#contact-user-form input').get(1).click(function () {
    //        $('#user-consent-form').dialog({ modal: true, minHeight: 0, width: '580px', title: 'User consent request form', show: "fadeIn", hide: "fadeOut" });
    //    })

    

    $('#search-wrap  input[type=text]').focus();

    $('.narrowResultsPane').stickyfloat({ duration: 150, tartOffset: 0 });

    // $(".GetUserDetails").each(function () {

    //   eval($(this).attr('href'));
    // });



    prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(beginRequest);

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

    $(".GetUserDetails").first().each(function () {
        $(this).trigger('click');
        eval($(this).attr('href'));
    });

    $('.toTop').live('click',function () {
        $('body,html').animate({ scrollTop: 10 }, 800);
    });

    $('#search-wrap a, .networksTree .rtIn, .sortingOption').live('click', function () {

        $('#mediaItemsList').hide();
        $('#loadingMediaItems').removeClass('hidden');
        $('.pnlBeforeFirstSearch').hide();

    });

});

function EndRequestHandler(sender, args) {
   $(".GetUserDetails").first().each(function () {
        $(this).trigger('click');
        eval($(this).attr('href'));
    });
    initialiseTranslators();
    $('.expandable').expander({ slicePoint: 400 });
}




function beginRequest() {
    prm._scrollPosition = null;
    // READ MORE
   
    
}

function initialiseTranslators() {
    //jQuery('.translatable').parent().parent().parent().find(".group-wrap").parent().append(jQuery('#translator-ddl').html());

    var translationsCount = jQuery('.translatable').length;
    var originalContent = new Array(translationsCount);
    translatedContent = new Array(translationsCount);
    var i = 0;
    var j = 0;
    jQuery('.translatable').each(function () {
        originalContent[i] = jQuery(this).html();
        i++;
    })

    jQuery(".translateLanguage").live("change", function () {
        if (jQuery(this).val() != "x") {
            if (jQuery(this).val() == "-") {
                if (originalContent.length != 0) {
                    revertToOriginal(originalContent);
                }
            }
            else {
                jQuery("#translating-complete").hide();
                jQuery('.translateLanguage').attr("disabled", true);


                jQuery(this).parent().parent().parent().find('.translatable').addClass("translating");
                jQuery(this).parent().parent().parent().find('.translatable').removeClass("hidden");

                jQuery(this).parent().addClass('translator-ddl-wrap-loading');
                jQuery(this).parent().parent().parent().find('.expandable').addClass('hidden');

                Translate2.translate(jQuery(this).parent().parent().parent().find('.translatable').html(),
               "en", jQuery(this).val(), "mycallback");

            }
        }
    });
}

