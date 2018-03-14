function showPlaylistVideoThumbnails() {

    var isOkToProceed = doPreShowPlaylistVideoThumbnails();

    if (!isOkToProceed) { return; }

    doRegularShowPlaylistVideoThumbnails();
    doPostShowPlaylistVideoThumbnails();
}

function doPreShowPlaylistVideoThumbnails() {
    //
    if (getIsPlaylistShowing() || (getNumOfFailedPlaylistAjaxShow() >= 3)) { return false; }
    setIsPlaylistShowing(true);

    return true;
}

function doRegularShowPlaylistVideoThumbnails() {

    // App extracts video-id from the url.
    var url = window.location.href;
    var videoId = extractValueFromUrl(url, "id");

    // App extracts playlist-id from the url.
    var playlistId = extractValueFromUrl(url, "playlist_id");

    //
    if (videoId == false || playlistId == false) { return; }

    var crud_type = "show";
    var request_type = "GET";
    var earliestElDate = getLimitDateOfDomElement("earliest", "video-recommendation-item");


    var key_value_pairs = {
        show: "yes",
        video_id: videoId,
        playlist_id: playlistId,
        earliest_el_date: earliestElDate,
        read_video_for_what: READ_VIDEO_FOR_VIDEO_PLAYLIST
    };



    var obj = new Playlist(crud_type, request_type, key_value_pairs);
    obj.show();

}

function doPostShowPlaylistVideoThumbnails() {}