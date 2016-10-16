"use strict";
var vid;
function GetHeightCss() {
    var h = window.innerHeight
|| document.documentElement.clientHeight
|| document.body.clientHeight;

    var w = window.innerWidth
|| document.documentElement.clientWidth
|| document.body.clientWidth;
    var css = "";
    var fullh = 0;
    var fullhSingle = 0;
    var guttersize = 0;
    var mobile_guttersize = 0;
    fullh = h - (guttersize * 2);
    fullhSingle = h - mobile_guttersize;
    var smallh = h / 2;
    var halfh = fullh;
    if ((halfh % 2) == 0) {halfh = halfh / 2; }
    else {halfh = (halfh - 1) / 2; }
    css = ' .height-one-one { height: ' + fullh + 'px;}';
    css += '.height-one-half { height: ' + halfh + 'px;}';
    css += '@media screen and (max-width:1024px){';
    //css += '.height-one-one {height: auto;}';
    //css += '.height-one-half {height: auto;}';
    css += '}';
    var cssEle = document.getElementById('heightStyle');

    if (cssEle == null) {
        var head = document.head || document.getElementsByTagName('head')[0],
            style = document.createElement('style');
        style.type = 'text/css';
        style.setAttribute("id", "heightStyle");
        if (style.styleSheet) {
            style.styleSheet.cssText = css;
        } else {
            style.appendChild(document.createTextNode(css));

        }
        head.appendChild(style);
    }
    else {
        cssEle.innerHTML = css;
    }
}
GetHeightCss();
$(window).resize(function () {
    GetHeightCss();
});
$(window).load(function () {
    $(".se-pre-con").fadeOut("slow");
});
$(function () {
	vid = document.getElementById("bgvid");
    // Nice Scroll javascript 
    $('.NiceScrollbar').niceScroll();
    $(".NiceScrollbar").getNiceScroll().hide();
    // Nice Scroll javascript 


    // page Change script 
	
	
	
	// Next page button Click Start
    $(".page-transition-buttons .next-page").on("click", function (e) {
		e.preventDefault();
        hideSidebarIfOpen();
		
		var page_section = $(".page-section.pages",".main-site-container");
		var page_container_height_one_one = $(this).parents(".page-container.height-one-one");
		
        var currentDivScroll = page_section.scrollLeft();
        var currentDivPosition = page_container_height_one_one.offset().left;
        var sidebarWidth = $(".col-md-2.page-section",".main-site-container").width();
        page_section.animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) });
        $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
        page_container_height_one_one.addClass("is-selected");
        $(".main-site-container","body").removeClass("homepage");
		vid.pause();
        refreshScroll();
		return false;
    });
	// Next page button Click End
	
	// Previous page button Click Start
	$(".page-transition-buttons .prev-page").on("click", function (e) {
		e.preventDefault();
        hideSidebarIfOpen();
		var page_section = $(".page-section.pages",".main-site-container");
		var pagetoDisplay = $(this).attr("href");
		
		var currentDivScroll = page_section.scrollLeft();
        var currentDivPosition = $(pagetoDisplay).offset().left;
        var sidebarWidth = $(".col-md-2.page-section",".main-site-container").width();
        page_section.animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) });
        $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
        $(pagetoDisplay).addClass("is-selected");
		if(pagetoDisplay == "#home")
		{
			$(".main-site-container","body").addClass("homepage");
		}
		else{
			$(".main-site-container","body").removeClass("homepage");
		}
        refreshScroll();
		return false;
    });
	// Previous page button Click End
	
	// Logo/Home button Click Start
    $(".main-profile-image,.logo-home-link",".user-profile").on("click", function () {

        hideSidebarIfOpen();


        $(".page-section.pages",".main-site-container").animate({ scrollLeft: (0) });
        $(".page-section.pages .page-container.height-one-one").removeClass("is-selected");
        $(".page-section.pages .page-container.height-one-one:first").addClass("is-selected");
        $(".main-site-container","body").addClass("homepage");
        vid.play();
        refreshScroll();
		return false;
    });
	// Logo/Home button Click End
	
    // page Change script 



    // page Change MOBILE script 


    $(".top-menu-menu-appear",".top-menu-position-right").on("click", function (a) {
        a.preventDefault();

        hideSidebarIfOpen();



        if ($(this).hasClass("opened")) {
            $(this).removeClass("opened");
            $("body").removeClass("top-menu-menu-from-right-oppened");
        }
        else {
            $(this).addClass("opened");
            $("body").addClass("top-menu-menu-from-right-oppened");
        }
		return false;
    });


    $(".mobile-menu-link").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();
		var top_menu_menu_appear = $(".top-menu-menu-appear",".top-menu-position-right");

        if (top_menu_menu_appear.hasClass("opened")) {
            top_menu_menu_appear.removeClass("opened");
            $("body").removeClass("top-menu-menu-from-right-oppened");
        }
        var pageReq = $(this).attr("href");
		var page_section = $(".page-section.pages",".main-site-container");
		var page_container_height_one_one_pageReq = $(".page-container.height-one-one" + pageReq,".page-section.pages");
        $(".main-site-container","body").removeClass("homepage");
        vid.pause();
        $(".mobile-menu-link",".menu-main-menu").removeClass("active");
        $(this).addClass("active");
        var currentDivScroll = page_section.scrollLeft();
        var currentDivPosition = page_container_height_one_one_pageReq.offset().left;
        page_section.animate({ scrollLeft: (currentDivScroll + currentDivPosition) }, 500);
        $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
        page_container_height_one_one_pageReq.addClass("is-selected");

        refreshScroll();
		return false;
    });
    $(".home-mobile-menu-link").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();
		var top_menu_menu_appear = $(".top-menu-menu-appear",".top-menu-position-right");

        if (top_menu_menu_appear.hasClass("opened")) {
            top_menu_menu_appear.removeClass("opened");
            $("body").removeClass("top-menu-menu-from-right-oppened");
        }
        var pageReq = $(this).attr("href");
        $(".mobile-menu-link",".menu-main-menu").removeClass("active");
        $(".page-section.pages",".main-site-container").animate({ scrollLeft: (0) }, 500);
        $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
        $(".page-container.height-one-one" + pageReq,".page-section.pages").addClass("is-selected");
        setTimeout(function () { $(".main-site-container","body").addClass("homepage"); vid.play(); }, 350);
        refreshScroll();
		return false;
    });

    // page Change MOBILE script 


    // sidebar animation  MOBILE script 
    $(".logo-home-mobile-link").on("click", function (e) {

        $(this).addClass("hide-animation");
        setTimeout(function () {
            $(".main-site-container .page-section.profile-sidebar").addClass("animateShow");
            $('body').addClass("sidebar-open");
            refreshScroll();
        }, 200);
		return false;

    });
    $(".hide-profile-sidebar-link").on("click", function (e) {
        $(".main-site-container .page-section.profile-sidebar").removeClass("animateShow");
        $('body').removeClass("sidebar-open");
        setTimeout(function () {
            $(".logo-home-mobile-link").removeClass("hide-animation");
        }, 200);
        refreshScroll();
		return false;
    });

    // sidebar animation  MOBILE script 





    // Profile content Change script 
    $(".profile-detail-tabs").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();


        $(".profile-detail-tabs",".user-profile").removeClass("active");
        $(this).addClass("active");
        $(".page-section.pages",".main-site-container").animate({ scrollLeft: (0) });
        $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
        $(this).parents(".page-container.height-one-one").addClass("is-selected");
		$(".main-site-container","body").addClass("homepage");
        var displaybox = $(this).attr("href");
        $(".page-cotnent-tabs").fadeOut(500);
        setTimeout(function () {
            $(displaybox).fadeIn();
        }, 500);
        refreshScroll();
		return false;
    });
    // Profile content Change script 



    // Page Expand/Colapse script 
    $(".change-page-state").on("click", function () {

        hideSidebarIfOpen();
		var page_section = $(".page-section.pages",".main-site-container");
		var col_md_2_page_section = $(".col-md-2.page-section",".main-site-container");
		var page_container_height_one_one  = $(this).parents(".page-container.height-one-one");
        if ($(this).html().toString().toLowerCase() == "expand") {
            var currentDivScroll = page_section.scrollLeft();
            var currentDivPosition = page_container_height_one_one.offset().left;
            var sidebarWidth = col_md_2_page_section.width();
            page_section.animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) });
            if (!$(this).parent().parent().hasClass("is-selected")) {
                $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
                page_container_height_one_one.addClass("is-selected");
            }
            $(this).parent().parent().addClass("col-md-10 ").addClass("col-lg-10 ").addClass("expanded").removeClass("col-lg-5").removeClass("col-md-7");
            $(this).html("COLLAPSE");
            $(this).addClass("expanded");
            currentDivScroll = page_section.scrollLeft();
            currentDivPosition = page_container_height_one_one.offset().left;
            sidebarWidth = col_md_2_page_section.width();

            setTimeout(function () { $(".page-section.pages",".main-site-container").animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) }); }, 600);
        }
        else if ($(this).html().toString().toLowerCase() == "collapse") {
            $(this).parent().parent().addClass("col-md-7").addClass("col-lg-5").removeClass("col-md-10").removeClass("col-lg-10").removeClass("expanded");
            $(this).html("EXPAND");
            $(this).removeClass("expanded");
        }
        refreshScroll();
		return false;
    });
    // Page Expand/Colapse script 


    // Blog Item script 
    $(".blog-post-link").on("click", function (e) {
        e.preventDefault();
        hideSidebarIfOpen();
		var page_section_pages = $(".page-section.pages",".main-site-container");
		var page_container_height_one_one = $(this).parents(".page-container.height-one-one");
        var wi_blog = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        if (wi_blog > 1024) {
            var currentDivScroll = page_section_pages.scrollLeft();
            var currentDivPosition = page_container_height_one_one.offset().left;
            var sidebarWidth = $(".col-md-2.page-section",".main-site-container").width();
            page_section_pages.animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) }, 1000);
        }

        if (!page_container_height_one_one.hasClass("is-selected")) {

            $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
            page_container_height_one_one.addClass("is-selected");
        }

        var BlogToOpen = $(this).attr("href");
        var blogitem = $(this).parents(".blog-item");
        $(blogitem).addClass("CurrentPost");
		var blogitem_parents_NiceScrollbar = $(blogitem).parents(".NiceScrollbar");
        var currentBlogDivScrollTop = blogitem_parents_NiceScrollbar.scrollTop();
        var currentBlogDivPosition = $(blogitem).offset().top;
        blogitem_parents_NiceScrollbar.animate({ scrollTop: (currentBlogDivScrollTop + currentBlogDivPosition) });

        var blogImageContainer = $(blogitem).parents(".blog-container.blog-image-post");
        var blogMainContainer = $(blogitem).parents(".page-container.blog");
        var blogInnerContainer = $(blogMainContainer).find(".blog-container.blog-inner-post");

        $(blogInnerContainer).find(BlogToOpen + ".blog-item").addClass("CurrentPost");
        setTimeout(function () {
            $(blogMainContainer).addClass("show-inner-post");
            setTimeout(function () {
                $(blogMainContainer).addClass("animate-inner-post");
                setTimeout(function () {
                    $(blogMainContainer).addClass("hide-image-post");
                    $(".height-one-one.blog-container.blog-inner-post").niceScroll();
                    refreshPostScroll();
                }, 100);
            }, 100);
        }, 500);
		return false;
    });
    $(".page-blog-close").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();

        var blogInnerContainer = $(this).parents(".blog-container.blog-inner-post");
        var blogMainContainer = $(this).parents(".page-container.blog");
        var blogImageContainer = $(blogMainContainer).find(".blog-container.blog-image-post");
        var blogitem = $(blogImageContainer).find(".blog-item.CurrentPost");
        var blogInneritem = $(blogInnerContainer).find(".blog-item.CurrentPost");

        setTimeout(function () {
            $(blogMainContainer).removeClass("hide-image-post");
            setTimeout(function () {
                $(blogMainContainer).removeClass("animate-inner-post");
                setTimeout(function () {
                    $(blogMainContainer).removeClass("show-inner-post");
                    $(blogInneritem).removeClass("CurrentPost");
                    setTimeout(function () {
                        $(blogitem).removeClass("CurrentPost");
                    }, 500);
                }, 500);
            }, 500);
        }, 100);
		return false;
    });




    $(".blog-item-filter-link").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();

        var portfolioInnerContainer = $(this).parents(".blog-container.blog-image-post");
        var filterby = $(this).attr("data-filter");
        if (filterby != "" && filterby == "all") {
            $(portfolioInnerContainer).find(".blog-item-container .blog-item").fadeIn();
        }
        else {
            var allposts = $(portfolioInnerContainer).find(".blog-item-container .blog-item");
            $(allposts).not("." + filterby).fadeOut();
            $(".blog-item-container .blog-item." + filterby).fadeIn();
        }
		return false;
    });

    // Blog Item script 






    // Portfolio Item script 
    $(".portfolio-item-link").on("click", function (e) {
        e.preventDefault();
        hideSidebarIfOpen();
        $(".main-site-container","body").removeClass("homepage");
        vid.pause();
        var wi_portfolio = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		
		var page_section_pages = $(".page-section.pages",".main-site-container");
		var page_container_height_one_one = $(this).parents(".page-container.height-one-one");
		var col_md_2_page_section = $(".col-md-2.page-section",".main-site-container");
		
        if (wi_portfolio > 1024) {

            var currentDivScroll = page_section_pages.scrollLeft();
            var currentDivPosition = page_container_height_one_one.offset().left;
            var sidebarWidth = col_md_2_page_section.width();
            page_section_pages.animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) });
            if (!page_container_height_one_one.hasClass("is-selected")) {
                $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
                page_container_height_one_one.addClass("is-selected");
            }

            if (!page_container_height_one_one.hasClass("expanded")) {
                page_container_height_one_one.addClass("col-md-10 ").addClass("col-lg-10 ").addClass("expanded").removeClass("col-lg-5").removeClass("col-md-7");
                page_container_height_one_one.find(".change-page-state").html("COLLAPSE").addClass("expanded");
                currentDivScroll = page_section_pages.scrollLeft();
                currentDivPosition = $(this).parents(".page-container.height-one-one").offset().left;
                sidebarWidth = col_md_2_page_section.width();
                setTimeout(function () { page_section_pages.animate({ scrollLeft: (currentDivScroll + currentDivPosition - sidebarWidth) }); }, 600);
            }
        }


        if (!page_container_height_one_one.hasClass("is-selected")) {
            $(".page-container.height-one-one",".page-section.pages").removeClass("is-selected");
            page_container_height_one_one.addClass("is-selected");
        }

        var portfolioToOpen = $(this).attr("href");
        var portfolioitem = $(this).parents(".portfolio-item");
        $(portfolioitem).addClass("CurrentPost");


        var portfolioImageContainer = $(portfolioitem).parents(".portfolio-container.portfolio-image-post");
        var portfolioMainContainer = $(portfolioitem).parents(".page-container.portfolio");
        var portfolioInnerContainer = $(portfolioMainContainer).find(".portfolio-container.portfolio-inner-post");

        $(portfolioInnerContainer).find(portfolioToOpen + ".portfolio-item").addClass("CurrentPost");
        $(portfolioInnerContainer).find(portfolioToOpen + ".portfolio-item .portfolio-item-image:first").addClass("CurrentPost");
        setTimeout(function () {
            $(portfolioMainContainer).addClass("show-inner-post");
            setTimeout(function () {
                $(portfolioMainContainer).addClass("animate-inner-post");
                setTimeout(function () {
                    $(portfolioMainContainer).addClass("hide-image-post");
                }, 500);
            }, 100);
        }, 100);
		return false;
    });
    $(".page-portfolio-close").on("click", function (e) {
        e.preventDefault();
        hideSidebarIfOpen();

        var portfolioInnerContainer = $(this).parents(".portfolio-container.portfolio-inner-post");
        var portfolioMainContainer = $(this).parents(".page-container.portfolio");
        var portfolioImageContainer = $(portfolioMainContainer).find(".portfolio-container.portfolio-image-post");
        var portfolioitem = $(portfolioImageContainer).find(".portfolio-item.CurrentPost");
        var portfolioInneritem = $(portfolioInnerContainer).find(".portfolio-item.CurrentPost");

        setTimeout(function () {
            $(portfolioMainContainer).removeClass("hide-image-post");
            setTimeout(function () {
                $(portfolioMainContainer).removeClass("animate-inner-post");
                setTimeout(function () {
                    $(portfolioMainContainer).removeClass("show-inner-post");
                    $(portfolioInneritem).removeClass("CurrentPost");
                }, 500);
            }, 100);
        }, 100);
		return false;
    });
    $(".portfolio-inner-post  .portfolio-item-image").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();

        var portfolioInnerContainer = $(this).parents(".portfolio-container.portfolio-inner-post");

        var portfolioitems = $(portfolioInnerContainer).find(".portfolio-item.CurrentPost .portfolio-item-image");
        var portfolioitemsImageContainer = $(portfolioInnerContainer).find(".portfolio-item-image-container");
        var portfolioCurrentitem = $(portfolioInnerContainer).find(".portfolio-item.CurrentPost .portfolio-item-image.CurrentPost");
        var portfolioOverly = $(portfolioInnerContainer).find(".portfolio-item-image-overly-container");

        var totalImage = $(portfolioitems).length;
        var currentImage = $(portfolioitems).index(portfolioCurrentitem);
        currentImage++;
        if (totalImage == currentImage) {
            currentImage = 0;
        }



        $(portfolioitemsImageContainer).addClass("transationanimation");
        $(portfolioitems).removeClass("CurrentPost");
        $(portfolioitems).eq(currentImage++).addClass("CurrentPost");
        $(portfolioOverly).fadeIn(200, function () {
            $(portfolioOverly).fadeOut(100);
            $(portfolioitemsImageContainer).removeClass("transationanimation");
        });
		return false;
    });



    $(".portfolio-item-filter-link").on("click", function (e) {
        e.preventDefault();

        hideSidebarIfOpen();

        var portfolioInnerContainer = $(this).parents(".portfolio-container.portfolio-image-post");
        var filterby = $(this).attr("data-filter");
        if (filterby != "" && filterby == "all") {
            $(portfolioInnerContainer).find(".portfolio-item-container .portfolio-item").fadeIn();
        }
        else {
            var allposts = $(portfolioInnerContainer).find(".portfolio-item-container .portfolio-item");
            $(allposts).not("." + filterby).fadeOut();
            $(".portfolio-item-container .portfolio-item." + filterby).fadeIn();
        }
		return false;
    });
    // Portfolio Item script 



    $(".contact-form-field-input").on("blur", function () {
        if ($(this).val() != "") {
            if ((!$(this).hasClass("small"))) {
                $(this).addClass("small");
            }
        }
        else {
            $(this).removeClass("small");
        }
    });
});


function hideSidebarIfOpen() {

    if ($('body').hasClass("sidebar-open")) {
        $(".main-site-container .page-section.profile-sidebar").removeClass("animateShow");
        $('body').removeClass("sidebar-open");
        setTimeout(function () {
            $(".logo-home-mobile-link").removeClass("hide-animation");
        }, 200);
        refreshScroll();
    }
}
function refreshScroll() {
    setTimeout(function () {
        $(".NiceScrollbar").getNiceScroll().resize();
    }, 500);
    setTimeout(function () {
        $(".NiceScrollbar").getNiceScroll().resize();
    }, 800);
}
function refreshPostScroll() {
    setTimeout(function () {
        $(".height-one-one.blog-container.blog-inner-post").getNiceScroll().resize();
    }, 500);
    setTimeout(function () {
        $(".height-one-one.blog-container.blog-inner-post").getNiceScroll().resize();
    }, 800);
}
//Preload Images

$.preloadImages = function () {
    var str = '<div class="preload-images" >';
    for (var i = 0; i < arguments.length; i++) {
        str += '<img src="' + arguments[i] + '" />';
    }
    str += "</div>"
    $("body > .main-site-container ").append(str);
}

$.preloadImages("images/blog-1.jpg", "images/blog-2.jpg", "images/blog-3.jpg", "images/blog-4.jpg", "images/blog-5.jpg", "images/blog-6.jpg", "images/blog-7.jpg", "images/blog-8.jpg", "images/blog-9.jpg", "images/blog-10.jpg", "images/clients-1.png", "images/clients-2.png", "images/clients-3.png", "images/clients-4.png", "images/clients-5.png", "images/clients-6.png", "images/image-1.jpg", "images/image-3.jpg", "images/image-5.jpg", "images/portfolio-1.jpg", "images/portfolio-2.jpg", "images/portfolio-3.jpg", "images/portfolio-4.jpg", "images/portfolio-5.jpg", "images/portfolio-6.jpg", "images/portfolio-7.jpg", "images/portfolio-8.jpg", "images/portfolio-9.jpg", "images/portfolio-10.jpg", "images/portfolio-11.jpg", "images/portfolio-12.jpg", "images/portfolio-13.jpg", "images/portfolio-14.jpg", "images/portfolio-15.jpg", "images/portfolio-16.jpg", "images/portfolio-17.jpg", "images/portfolio-18.jpg", "images/portfolio-19.jpg");

//Preload Images
;
