var Script = function () {


// custom scrollbar
    $(".sidebar-scroll").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', background: '#404040', cursorborder: ''});

    $(".portlet-scroll-1").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', background: '#404040', cursorborder: ''});

    $(".portlet-scroll-2").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', autohidemode: false, cursorborder: ''});

    $(".portlet-scroll-3").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '5', cursorborderradius: '0px', background: '#404040', autohidemode: false, cursorborder: ''});

    $("html").niceScroll({styler:"fb",cursorcolor:"#4A8BC2", cursorwidth: '8', cursorborderradius: '0px', background: '#404040', cursorborder: '', zindex: '1000'});



// widget tools

    jQuery('.widget .tools .icon-chevron-down').click(function () {
        var el = jQuery(this).parents(".widget").children(".widget-body");
        if (jQuery(this).hasClass("icon-chevron-down")) {
            jQuery(this).removeClass("icon-chevron-down").addClass("icon-chevron-up");
            el.slideUp(200);
        } else {
            jQuery(this).removeClass("icon-chevron-up").addClass("icon-chevron-down");
            el.slideDown(200);
        }
    });

    jQuery('.widget .tools .icon-remove').click(function () {
        jQuery(this).parents(".widget").parent().remove();
    });

//    tool tips

    $('.element').tooltip();

    $('.tooltips').tooltip();

//    popovers

    $('.popovers').popover();

// scroller

 //   $('.scroller').slimscroll({
 //       height: 'auto'
 //   });

//  sidebar dropdown menu

    jQuery('#sidebar .subsub-menu > a').click(function () {
        var last = jQuery('.subsub-menu.open', $('#sidebar'));
        last.removeClass("open");
        jQuery('.arrow', last).removeClass("open");
        jQuery('.subsub', last).slideUp(200);
        var subsub = jQuery(this).next();
        if (subsub.is(":visible")) {
            jQuery('.arrow', jQuery(this)).removeClass("open");
            jQuery(this).parent().removeClass("open");
            subsub.slideUp(200);
        } else {
            jQuery('.arrow', jQuery(this)).addClass("open");
            jQuery(this).parent().addClass("open");
            subsub.slideDown(200);
        }
        var o = ($(this).offset());
        diff = 200 - o.top;
        if(diff>0)
            $(".sidebar-scroll").scrollTo("-="+Math.abs(diff),500);
        else
            $(".sidebar-scroll").scrollTo("+="+Math.abs(diff),500);
    });


}();