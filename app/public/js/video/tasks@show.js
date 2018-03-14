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
    // initLeftCol();
    initCenterCol();
    // initRightCol();
    // initCnStickyBottom();
}

function setVideoContainer() {

    //
    $(".video-item").css("width", "100%");
    var width = $(".video-item").width();
    $(".video-item").height(width * 0.5625);

}

function initCenterCol() {

    //
    setVideoContainer();
    setVideoMetaDetailsContainer();
    initRateStatusPlugIn();
    // initVideoPlaylistPlugIn();

    //
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