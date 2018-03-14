const READ_VIDEO_FOR_VIDEO_PLAYLIST = 1;

var isPlaylistShowing = false;
var numOfFailedPlaylistAjaxShow = 0;

function getIsPlaylistShowing() {
    return isPlaylistShowing;
}

function setIsPlaylistShowing(value) {
    isPlaylistShowing = value;
}

function getNumOfFailedPlaylistAjaxShow() {
    return numOfFailedPlaylistAjaxShow;
}

function setNumOfFailedPlaylistAjaxShow(value) {
    numOfFailedPlaylistAjaxShow = value;
}