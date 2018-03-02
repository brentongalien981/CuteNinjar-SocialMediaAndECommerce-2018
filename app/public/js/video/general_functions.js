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

        case "show":

            //
            var loaderEl = $("#loader-for-show-video-xxx");
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

            displayVideos(json, xObj);

            break;

        case "show":

            soloDisplayVideo(json);

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

function getVideoCategoryContainer(readForPageSection) {

    var videoCategoryContainer = null;

    // Checks if the video-category-container that is being populated has already done a previous read.
    if (readForPageSection == null) {

        videoCategoryContainer = cnCloneTemplateEl("video-category-container-template");
        $(videoCategoryContainer).addClass("video-category-containers");
        $(videoCategoryContainer).attr("pageSection", "recommended");
    }
    else {
        videoCategoryContainer = $("[pageSection=recommended]");
    }

    return videoCategoryContainer;
}

function soloDisplayVideo(json) {

    //
    var videos = json.objs;

    //
    for (var i = 0; i < videos.length; i++) {

        //
        var video = videos[i];

        //
        setSoloVideoItemEl(video);
        fillVideoMetaDetailsContainer(video);

    }
}

function setSoloVideoItemEl(video) {

    var videoFrame = $(".video-container").find(".video-item")[0];
    var youtubeVideoSrcExtraDetails = "?rel=0&amp;controls=0&amp;showinfo=0&amp;autoplay=1";
    // var youtubeVideoSrcExtraDetails = "?autoplay=1";
    var videoSrc = video["url"] + youtubeVideoSrcExtraDetails;
    $(videoFrame).attr("src", videoSrc);
    $(videoFrame).css("display", "block");
}

function fillVideoMetaDetailsContainer(video) {

    $("#video-meta-details-container h3").html(video["title"]);
    $("#video-meta-details-container .poster-user-name").html("by " + video["poster_user_name"]);
    $("#video-meta-details-container .upload-date").html("uploaded " + video["human_date"]);
    $("#video-meta-details-container .description").html(video["description"]);

    $("#video-meta-details-container").css("display", "block");
}

function displayVideos(json, xObj) {

    //
    var videos = json.objs;

    //
    var readForPageSection = xObj.key_value_pairs["readForPageSection"];

    //
    var videoCategoryContainer = getVideoCategoryContainer(readForPageSection);



    // Iterates through all the video-json-objects.
    for (var i = 0; i < videos.length; i++) {

        var video = videos[i];


        // Check if same video is already displayed.
        if (isVideoDisplayed(video["id"])) { continue; }


        // Clones a video-item-template.
        var videoItem = cnCloneTemplateEl("video-recommendation-item-template");

        //
        setVideoItemEl(videoItem, video);


        // Appends the cloned template to the video-item-container.
        var videosSection = $(videoCategoryContainer).find(".videos-sections")[0];
        $(videosSection).append($(videoItem));
    }


    //
    $("#cn-center-col").append($(videoCategoryContainer));

    //
    setCenterCol();


    //
    var showMoreVideosBtn = $(videoCategoryContainer).find("button");
    addClickListenerToShowMoreVideosBtn(showMoreVideosBtn);

    //
    setHasDoneInitialReadAttr(videoCategoryContainer);

}

/**
 * fills-in the cloned template with details from the currently iterated video-json-obj.
 * @param videoItem
 * @param video
 */
function setVideoItemEl(videoItem, video) {

    $(videoItem).addClass("video-recommendation-item");
    $(videoItem).attr("id", "video" + video["id"]);
    $(videoItem).attr("created-at", video["created_at"]);


    // Set the actual video-frame.
    var videoFrame = $(videoItem).find("iframe")[0];
    var youtubeVideoSrcExtraDetails = "?rel=0&amp;controls=0&amp;showinfo=0";
    var videoSrc = video["url"] + youtubeVideoSrcExtraDetails;
    $(videoFrame).attr("src", videoSrc);


    //
    // setVideoMaskHref(videoItem, videoSrc);
    setVideoMaskHref(videoItem, video["id"]);


    // Set the video title.
    var videoThumbnailTitle = $(videoItem).find(".video-thumbnail-titles")[0];
    $(videoThumbnailTitle).html(video["title"]);


    // Set the name of the poster (the user).
    var posterUserNameEl = $(videoItem).find(".video-thumbnail-poster-user-names")[0];
    $(posterUserNameEl).html(video["poster_user_name"]);
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

function setVideoMaskHref(videoItem, videoId) {

    var mask = $(videoItem).find(".video-thumbnail-masks")[0];

    var href = get_local_url() + "video/show.php?id=" + videoId;

    $(mask).attr("href", href);
}

function isVideoDisplayed(videoId) {

    var videoEls = $(".video-recommendation-item");

    for (var i = 0; i < videoEls.length; i++) {

        var currentVideoId = $(videoEls[i]).attr("id");

        if (currentVideoId === ("video" + videoId)) {
            cnLog("Video is already displayed");
            return true;
        }

    }

    cnLog("Video is NOT yet displayed");
    return false;
}

function setHasDoneInitialReadAttr(videoCategoryContainer) {

    $(videoCategoryContainer).attr("hasDoneInitialRead", "yes");
}