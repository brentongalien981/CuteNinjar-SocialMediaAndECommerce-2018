$(document).ready(function(){
    showPlaylistVideoThumbnails();
});

function initVideoPlaylistPlugIn() {

    var videoPlaylistPlugIn = $("#video-playlist-plug-in");
    $("#cn-center-col").append($(videoPlaylistPlugIn));

    $(videoPlaylistPlugIn).removeClass("initially-hidden-el");
}