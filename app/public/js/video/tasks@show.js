$(document).ready(function () {
    setPageTitle("Videos | CuteNinjar");

    initPage();

    showVideo();
});


function initPage() {
    initContainers();
}

function initContainers() {
    // initCnHeader();
    initLeftCol();
    initCenterCol();
    initRightCol();
    initCnStickyBottom();
}


function initRightCol() {
    setRightCol();
}



function setRightCol() {

    setRightColHeight();

    initPageOutlinePlugIn();

    var forPage = "video@show";
    setPageOutlineItems(forPage);

    initVideoCategoriesPlugIn();

    readCategories();
}


function setPageOutlineItems(forPage) {

    // 1) Prepare the details for the page-outline-items.
    var pageOutlineItems = null;

    switch (forPage) {
        case "video@show":
            pageOutlineItems = [
                {
                    href: "shown-video-container",
                    outline_item_title: "The Video"
                },
                {
                    href: "video-meta-details-container",
                    outline_item_title: "Video Details"
                },
                {
                    href: "video-playlist-plug-in",
                    outline_item_title: "This video's playlist"
                },
                {
                    href: "comments-and-recommendations-container",
                    outline_item_title: "Comments and Recommendations"
                }

            ];
            break;
        case "video@zzz":
            break;
    }


    // 2) Remove the default page-outline-items.
    $(".page-outline-plug-in-item").remove();


    // 3) Set the page-outline-items.
    for (i = 0; i < pageOutlineItems.length; i++) {

        var pageOutlineItemEl = document.createElement("a");
        $(pageOutlineItemEl).addClass("page-outline-plug-in-item");

        var href = "#" + pageOutlineItems[i].href;
        $(pageOutlineItemEl).attr("href", href);

        var outlineTitle = pageOutlineItems[i].outline_item_title;
        $(pageOutlineItemEl).html(outlineTitle);


        $("#page-outline-plug-in").append($(pageOutlineItemEl));
    }
}


function setRightColHeight() {

    $("#cn-right-col").height($(this).outerHeight());
}


function initCnStickyBottom() {
    $("#center-col-toggle-btn").remove();

    $("#left-col-toggle-btn").trigger("click");
    $("#right-col-toggle-btn").trigger("click");

    $("#cn-left-col").css("display", "block");
    $("#cn-right-col").css("display", "block");
}


function initLeftCol() {
    setLeftCol();
}

function setLeftCol() {

    setLeftColHeight();

    initUserVideoPlaylistsPlugIn();

    readVideoUserPlaylists();
}

function setLeftColHeight() {

    $("#cn-left-col").height($(this).outerHeight());
}


function setVideoContainer() {

    //
    $(".video-item").css("width", "100%");
    var width = $(".video-item").width();
    $(".video-item").height(width * 0.5625);

}

function initCenterCol() {

    /**/
    setVideoContainer();
    setVideoMetaDetailsContainer();
    initRateStatusPlugIn();
    // initVideoPlaylistPlugIn();

    var commentsPlugInContainer = $("#comments-plug-in-container");
    initCommentsPlugIn(commentsPlugInContainer);

    var videoRecommendationsPlugInContainer = $("#video-recommendations-plug-in-container");
    initVideoRecommendationsPlugInContainer(videoRecommendationsPlugInContainer);



    /**/
    $("#cn-center-col").append($("#video-playlist-plug-in"));
    $("#cn-center-col").append($("#comments-and-recommendations-container"));

    $("#the_body").append($("#main-content"));

    //
    $("#the_body").append($("footer"));

}

function initRateStatusPlugIn() {

    var rateStatusPlugIn = cnCloneTemplateEl("rate-status-container-template");
    $(rateStatusPlugIn).addClass("rate-status-container");

    $("#cn-center-col").append($(rateStatusPlugIn));
}

function setVideoMetaDetailsContainer() {
    $("#cn-center-col").append($("#video-meta-details-container"));

    addClickListenersToMetaDetailsContainerBtns();
}