function setVideoThumbnailHoldersHeight() {
    var width = $(".video-thumbnails").width();
    var height = width * 0.5625;

    $(".video-thumbnails").height(height);

}

function doVideoPreAfterEffects(className, crudType, json, xObj) {

    //
    switch (crudType) {
        case "read":

            // Unset loader el.
            var loaderEl = $("#loader-for-video-xxx");
            removeClonedLoaderEl(loaderEl);
            break;

        case "create":
        case "update":
        case "delete":
        case "fetch":
        case "patch":
            break;
    }
}

function doVideoAfterEffects(className, crudType, json, xObj) {
    switch (crudType) {
        case "read":

            displayVideos(json);

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

function displayVideos(json) {

    var videos = json.objs;

    //
    var videoCategoryContainer = cnCloneTemplateEl("video-category-container-template");
    $(videoCategoryContainer).addClass("video-category-containers");


    //
    for (var i = 0; i < videos.length; i++) {
        var video = videos[i];

        // Clones a video-item-template.
        var videoItem = cnCloneTemplateEl("video-recommendation-item-template");
        $(videoItem).addClass("video-recommendation-item");


        //
        var videoFrame = $(videoItem).find("iframe")[0];
        var youtubeVideoSrcExtraDetails = "?rel=0&amp;controls=0&amp;showinfo=0";
        var videoSrc = video["url"] + youtubeVideoSrcExtraDetails;
        $(videoFrame).attr("src", videoSrc);


        //
        setVideoMaskHref(videoItem, videoSrc);


        //
        var videoThumbnailTitle = $(videoItem).find(".video-thumbnail-titles")[0];
        $(videoThumbnailTitle).html(video["title"]);


        //
        var posterUserNameEl = $(videoItem).find(".video-thumbnail-poster-user-names")[0];
        $(posterUserNameEl).html("TODO: " + video["owner_name"]);



        //
        var videosSection = $(videoCategoryContainer).find(".videos-sections")[0];
        $(videosSection).append($(videoItem));


        // //
        // setVideoThumbnailContainerHeight(videoItem);
        //
        // setVideoThumbnailMask(videoItem);
    }


    //
    $("#cn-center-col").append($(videoCategoryContainer));

    setCenterCol();
}

function setVideoThumbnailMask(videoItem) {

    var videoThumbnailContainer = $(videoItem).find(".video-thumbnail-containers")[0];

    var videoThumbnailContainerHeight = $(videoThumbnailContainer).height();


    var videoThumbnailMask = $(videoItem).find(".video-thumbnail-masks")[0];

    $(videoThumbnailMask).css("margin-top", "-" + videoThumbnailContainerHeight + "px");
}

function setVideoThumbnailMasks() {

    var videoThumbnailContainers = $(".video-thumbnail-containers");

    var videoThumbnailContainerHeight = $(videoThumbnailContainers).height();


    var videoThumbnailMasks = $(".video-thumbnail-masks");

    $(videoThumbnailMasks).css("margin-top", "-" + videoThumbnailContainerHeight + "px");
}





function setVideoThumbnailContainerHeight(videoItem) {

    var videoThumbnailContainer = $(videoItem).find(".video-thumbnail-containers")[0];

    var width = $(videoThumbnailContainer).width();
    var height = width * 0.5625;

    $(videoThumbnailContainer).height(height);
}

function setVideoThumbnailContainersHeight() {

    var videoThumbnailContainers = $(".video-thumbnail-containers");

    var width = $(videoThumbnailContainers).width();
    var height = width * 0.5625;

    $(videoThumbnailContainers).height(height);
}

function setVideoThumbnailContainersWidth() {

    //video-recommendation-item-template
    var videoRecommendationItems = $(".video-recommendation-item");

    var videoThumbnailContainers = $(".video-thumbnail-containers");

    var width = $(videoRecommendationItems).width();

    $(videoThumbnailContainers).width(width);
}

function setVideoMaskHref(videoItem, href) {

    var mask = $(videoItem).find(".video-thumbnail-masks")[0];

    $(mask).attr("href", href);
}