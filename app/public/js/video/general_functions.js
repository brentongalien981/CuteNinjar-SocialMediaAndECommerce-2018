function setVideoThumbnailHoldersHeight() {
    var width = $(".video-thumbnails").width();
    var height = width * 0.5625;

    $(".video-thumbnails").height(height);

    cnLog("width: " + width);
    cnLog("height: " + height);

}