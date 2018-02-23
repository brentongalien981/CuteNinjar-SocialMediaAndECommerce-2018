$(document).ready(function () {

    setPageTitle("Videos | CuteNinjar");

    initPage();

    readVideos();
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
    // setVideoThumbnailHoldersHeight();
    // setVideoThumbnailsDimensions();
    // setVideoThumbnailMasks();
    //
    // setCenterCol()
}

function setCenterCol() {
    setVideoThumbnailContainersWidth();
    setVideoThumbnailContainersHeight();

    setVideoThumbnailMasks();
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

