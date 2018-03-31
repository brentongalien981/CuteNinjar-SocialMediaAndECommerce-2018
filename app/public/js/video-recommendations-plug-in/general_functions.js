function initVideoRecommendationItemEl(el) {

    setVideoRecommendationItemWidth(el);
    setVideoRecommendationItemHeight(el);
    setVideoRecommendationItemThumbnailMasks(el);

    setVideoRecommendationItemElOrientation(el, "portrait");
}

function setVideoRecommendationItemElOrientation(el, orientation) {

    //
    $(el).removeClass("col-md-6");

    //
    if (orientation == "landscape") {
        $(el).addClass("row");

        //
        $(el).find(".video-thumbnail-containers").removeClass("col-6");
        $(el).find(".video-thumbnail-containers").addClass("col-lg-6 col-md-7 col-sm-12");

        //
        $(el).find(".video-thumbnail-details-containers").removeClass("col-4");
        $(el).find(".video-thumbnail-details-containers").addClass("col-lg-5 col-md-5 col-sm-12");

    }


}