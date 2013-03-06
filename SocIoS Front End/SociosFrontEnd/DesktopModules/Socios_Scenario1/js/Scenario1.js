var prm;

$(document).ready(function () {
    // $('#contact-user-form').fadeOut();

    if ($('.searchFilterSn li input[value="rdbtnCcLicense"]:checked').length > 0) {
        disableNonCCSns();
    }
    //$('.searchFilterSn li[value="rdbtnCcLicense"]').live('click', function () {
    $('.searchFilterSn li input[value="rdbtnCcLicense"]').live('click', function () {
        uncheckAllSearchSns();
        checkCCSns();
        disableNonCCSns();
    });
    $('.searchFilterSn li input[value="rdbtnAllLicenses"]').live('click', function () {
        $('#SearchOptionsSocialNetworks input').attr("disabled", false);
        $('#SearchOptionsSocialNetworks li').removeClass("disabledOption");
    });

    $(function () {

        $('#dnn_ctr389_View_Image2').click(function () {
            $("#privacyPolicyDialog").dialog({ title: "Privacy Policy reminder", width: "600px", buttons: {

                "I do not agree": function () {
                    $(this).dialog("close");
                },
                "I agree": function () {
                    window.location = $('#dnn_ctr389_View_hprlnk_goToGamesForCrowds').attr('href');
                    $(this).dialog("close");
                }

            }
            });
        })

        
    });

    $('#txtSearchTermsWrap input[id$="chkbx_OnlyRecommended"]').live('click', function () {
        var thisCheck = $(this);
        // thisCheck.hide();
        if (thisCheck.is(':checked')) {
            checkRecommendedSearchSns();
            //checkAllSns();
            disableAllSns();

            $('#dnn_ctr389_View_pnl_SearchOptionsLicense li').addClass('disabledOption');
            $('#dnn_ctr389_View_pnl_SearchOptionsLicense li input').attr("disabled", true);
            $('.searchFilterSn li input[value="rdbtnAllLicenses"]').prop('checked', true);

        }
        else {
            enableAllSns();


            $('#dnn_ctr389_View_pnl_SearchOptionsLicense li input').removeProp("disabled");
            $('#dnn_ctr389_View_pnl_SearchOptionsLicense li').removeClass('disabledOption');
        }
    });



    $('.narrowResultsPane h4').click(function () {

        $(this).next().slideToggle();
        $(this).toggleClass("min");
    });

    $('.green-info-box').delay(500).fadeIn('fast').delay(3000).fadeOut();

    $('.selectOptionsWrapFalse a, .selectOptionsWrapTrue a, .mediaItemCart a').live('click', function () {
        $('#MediaCartLoading').addClass('MediaCartLoading');
    });

    $('.media-item-add-user').live('click', function () {



        var usernameToAdd = $(this).parent().parent().find('.author-username span:eq(0)').html();
        var sourceToAdd = $(this).parent().parent().find('.author-username .source-wrap').html();
        var nameToAdd = $(this).parent().parent().find('.author-username span:eq(1)').html();
        var sourceToAddLower = sourceToAdd.toString().toLowerCase();

        if (sourceToAddLower == "twitter" || sourceToAddLower == "instagram" || sourceToAddLower == "myspace") {
            alert('You can not add ' + sourceToAddLower + ' users to Groups');
        }
        else {
            $('#AddPersonIdAnchorElement').next().val(usernameToAdd);
            $('#AddPersonIdAnchorElement').next().next().val(sourceToAdd);
            $('#AddPersonIdAnchorElement').next().next().next().val(nameToAdd);
            var dialog = $('#add-to-group-form').dialog({ modal: true, minHeight: 0, title: 'Add user to a group', show: "fadeIn", hide: "fadeOut" });
            dialog.parent().appendTo(jQuery("form:first"));
        }
    });

    $('.GetUserDetails').live('click', function () {
        $(this).parent().parent().find('.authorLoading').removeClass('hidden');
    });



    $('.person-container-item .add-user').live('click', function () {

        var usernameToAdd = $(this).parent().find('.author-username span').html();
        var sourceToAdd = $(this).parent().find('.author-username .source-wrap').html();
        var nameToAdd = $(this).parent().find('.author-username .name-wrap').html();



        $('#AddPersonIdAnchorElement').next().val(usernameToAdd);
        $('#AddPersonIdAnchorElement').next().next().val(sourceToAdd);
        $('#AddPersonIdAnchorElement').next().next().next().val(nameToAdd);
        var dialog = $('#add-to-group-form').dialog({ modal: true, minHeight: 0, title: 'Add user to a group', show: "fadeIn", hide: "fadeOut" });
        dialog.parent().appendTo(jQuery("form:first"));
    });

    $(".media-item-ranking-control input").live('click', function () {
        $(this).parent().parent().hide();
        $(this).parent().parent().parent().next().removeClass("hidden");

    });

    $(".negotiateUsageWrap input").live('click', function () {
        $(this).parent().parent().hide();
        $(this).parent().parent().next().removeClass("hidden");

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




    $('#search-wrap  input[type=text]').focus();

    // $('.narrowResultsPane').stickyfloat({ duration: 150, tartOffset: 0 });
    //$('.mediaItemCart').stickyfloat({ duration: 150, tartOffset: 0 });





    prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(beginRequest);

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

    $(".GetUserDetails").first().each(function () {
        $(this).trigger('click');
        eval($(this).attr('href'));
    });

    $('.toTop').live('click', function () {
        $('body,html').animate({ scrollTop: 10 }, 800);
    });

    $('#search-wrap a, .networksTree .rtIn, .sortingOption').live('click', function () {
        // Sys.WebForms.PageRequestManager.getInstance().abortPostBack();
        console.log('Postback Cancelled');
        $('#mediaItemsList').hide();
        $('#loadingMediaItems').removeClass('hidden');
        $('.pnlBeforeFirstSearch').hide();
        return true;

    });

});

// This flag allows a next person or rating to be loaded
// person1-rating1-person2-rating2
var personRatingFlag = true;
var foundAjaxButton;

function EndRequestHandler(sender, args) {

    foundAjaxButton = false;
    console.log("EndRequestHandler triggered..");
    if (personRatingFlag) {
        $(".GetUserDetails").first().each(function () {
            foundAjaxButton = true;
            $(this).trigger('click');
            console.log("Getting user details..");
            eval($(this).attr('href'));
        });
    }
    else {
        $(".GetItemRanking").first().each(function () {
            foundAjaxButton = true;
            $(this).trigger('click');
            console.log("Getting item ranking..");
            eval($(this).attr('href'));
        });
    }

    // When we reach the end of the list, we want
    // to start from getting the person again
    if (foundAjaxButton) {
        personRatingFlag = !personRatingFlag;
    }
    else {

    // Try one more time
        if (!personRatingFlag) {
            $(".GetUserDetails").first().each(function () {
                foundAjaxButton = true;
                $(this).trigger('click');
                eval($(this).attr('href'));
            });
        }
        else {
            $(".GetItemRanking").first().each(function () {
                foundAjaxButton = true;
                $(this).trigger('click');
                eval($(this).attr('href'));
            });
        }




        personRatingFlag = true;
    }


    initialiseTranslators();
 //   $('#advancedSearchOptions .rtIn').each(function () {
    //    $(this).html() = '<img src="http://localhost/Socios_Frontend/DesktopModules/Socios_Scenario1/Images/facebook.png" />' + $(this).html();
   // })
//    $('.container-item').each(function () { 
//        $(this).
//    })

   // $(".selectable").selectable();
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

function disableNonCCSns() {
    var a = '#SearchOptionsSocialNetworks';
    $(a + ' input[id*=Twitter], ' + a + ' input[id*=Facebook], ' + a + ' input[id*=Dailymotion], ' + a + ' input[id*=MySpace], ' + a + ' input[id*=Google], ' + a + ' input[id*=Instagram] ').each(function () {
        $(this).attr("disabled", true);
        $(this).parent().addClass('disabledOption');
    });
}

function checkCCSns() {
    var a = '#SearchOptionsSocialNetworks';
    $(a + ' input[id*=YouTube], ' + a + ' input[id*=FlickR] ').each(function () {
        $(this).prop('checked', true);
    });
}

function checkAllSns() {
    var a = '#SearchOptionsSocialNetworks';
    $(a + ' input[id*=Twitter], ' + a + ' input[id*=FlickR], ' + a + ' input[id*=YouTube], '  + a + ' input[id*=Facebook], ' + a + ' input[id*=Dailymotion], ' + a + ' input[id*=MySpace], ' + a + ' input[id*=Google], ' + a + ' input[id*=Instagram] ').each(function () {
       $(this).prop('checked', true);
    });
}

function disableAllSns() {
    var a = '#SearchOptionsSocialNetworks';
    $(a + ' input[id*=Twitter], ' + a + ' input[id*=FlickR], ' + a + ' input[id*=YouTube], ' + a + ' input[id*=Facebook], ' + a + ' input[id*=Dailymotion], ' + a + ' input[id*=MySpace], ' + a + ' input[id*=Google], ' + a + ' input[id*=Instagram] ').each(function () {
        $(this).attr("disabled", true);
        $(this).parent().addClass('disabledOption');
    });
}

function enableAllSns() {
    var a = '#SearchOptionsSocialNetworks';
    $(a + ' input[id*=Twitter], ' + a + ' input[id*=FlickR], ' + a + ' input[id*=YouTube], ' + a + ' input[id*=Facebook], ' + a + ' input[id*=Dailymotion], ' + a + ' input[id*=MySpace], ' + a + ' input[id*=Google], ' + a + ' input[id*=Instagram] ').each(function () {
        $(this).removeProp("disabled");
        $(this).parent().removeClass('disabledOption');
    });
}

function checkRecommendedSearchSns() {
    var a = '#SearchOptionsSocialNetworks';
    uncheckAllSearchSns();
    $(a + ' input[id*=Twitter], ' + a + ' input[id*=YouTube], ' +  a + ' input[id*=Instagram], ' + a + ' input[id*=Dailymotion]').each(function () {
        $(this).prop('checked', true);
    });

}


function uncheckAllSearchSns() {
    var a = '#SearchOptionsSocialNetworks';
    $(a + ' input[id*=Twitter], ' + a + ' input[id*=FlickR], ' + a + ' input[id*=YouTube], ' + a + ' input[id*=Facebook], ' + a + ' input[id*=Dailymotion], ' + a + ' input[id*=MySpace], ' + a + ' input[id*=Google], ' + a + ' input[id*=Instagram] ').each(function () {
        $(this).prop('checked', false);
    });
}



