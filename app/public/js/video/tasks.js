$(document).ready(function () {

    setPageTitle("Videos | CuteNinjar");

    initPage();
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

function initCenterCol() {
    setVideoThumbnailHoldersHeight();
    setVideoThumbnailsDimensions();
    setVideoThumbnailMasks();
}

function setVideoThumbnailMasks() {

    var videoThumbnailWidth = $(".video-thumbnails").width();
    var videoThumbnailHeight = $(".video-thumbnails").height();

    $(".video-thumbnail-masks").width(videoThumbnailWidth);
    $(".video-thumbnail-masks").height(videoThumbnailHeight);

    $(".video-thumbnail-masks").css("margin-top", "-" + videoThumbnailHeight + "px");
}

function setVideoThumbnailsDimensions() {

    var videoThumbnailWidth = $(".video-thumbnails").width();
    var videoThumbnailHeight = $(".video-thumbnails").height();

    $(".video-thumbnails > iframe").width(videoThumbnailWidth);
    $(".video-thumbnails > iframe").height(videoThumbnailHeight);
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
    $("#cn-left-col").height($(this).outerHeight());
}

function setRightCol() {
    $("#cn-right-col").height($(this).outerHeight());
}

function initRightCol() {
    setRightCol();
}

