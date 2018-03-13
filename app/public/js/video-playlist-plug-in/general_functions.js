function doPlaylistAfterEffects(className, crudType, json, xObj) {

    switch (crudType) {
        case "read":
            break;
        case "show":
            displayPlaylistVideoThumbnails(json);
            break;
        case "create":
            break;
        case "update":
            break;
        case "delete":
            break;
        case "fetch":
            break;
        case "patch":
            break;
    }
}

function displayPlaylistVideoThumbnails(json) {
    doPreDisplayPlaylistVideoThumbnails(json);
    doRegularDisplayPlaylistVideoThumbnails(json);
    doPostDisplayPlaylistVideoThumbnails();
}

function doPreDisplayPlaylistVideoThumbnails(json) {

    // Set the title element of the playlist.
    var playlist = json.objs;

    $(".video-playlist-items-container-title").html(playlist.title);
}

function doRegularDisplayPlaylistVideoThumbnails(json) {

    //
    var playlist = json.objs;
    var videos = playlist.videos;

    // Loop through the returned video-objs.
    for (var i = 0; i < videos.length; i++) {

        var video = videos[i];

        // Clone the #video-recommendation-item-template.
        var videoRecommendationItem = cnCloneTemplateEl("video-recommendation-item-template");

        // Fill-in the cloned template with details from the
        // currently iterated video-json-obj.
        setVideoRecommendationItem(videoRecommendationItem, video);

        // Append the cloned template to the video-recommendation-items-container.
        var videoRecommendationItemContainer = $("#video-playlist-plug-in").find(".video-recommendation-items-container")[0];
        $(videoRecommendationItemContainer).append($(videoRecommendationItem));


    }
}

function doPostDisplayPlaylistVideoThumbnails() {

    setPlaylistVideoThumbnailsDimensions();
}

function setPlaylistVideoThumbnailsDimensions() {

    setPlaylistVideoThumbnailContainersWidth();
    setPlaylistVideoThumbnailContainersHeight();

    setPlaylistVideoThumbnailMasks();
}

function setPlaylistVideoThumbnailMasks() {

    var videoThumbnailContainers = $(".video-thumbnail-containers");

    var videoThumbnailContainerHeight = $(videoThumbnailContainers).height();


    var videoThumbnailMasks = $(".video-thumbnail-masks");

    $(videoThumbnailMasks).css("margin-top", "-" + videoThumbnailContainerHeight + "px");
}
function setPlaylistVideoThumbnailContainersHeight() {

    var videoThumbnailContainers = $(".video-thumbnail-containers");

    var width = $(videoThumbnailContainers).width();
    var height = width * 0.5625;
    height = roundToTwo(height);

    $(videoThumbnailContainers).height(height);
}

function setPlaylistVideoThumbnailContainersWidth() {

    //video-recommendation-item-template
    var videoRecommendationItems = $(".video-recommendation-item");

    var videoThumbnailContainers = $(".video-thumbnail-containers");

    var width = $(videoRecommendationItems).width();
    width = roundToTwo(width);

    $(videoThumbnailContainers).width(width);
}