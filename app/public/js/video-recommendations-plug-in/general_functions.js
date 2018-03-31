function initVideoRecommendationItemEl(el) {
    setVideoRecommendationItemElOrientation(el, "landscape");
}

function setVideoRecommendationItemElOrientation(el, orientation) {

    //
    if (orientation == "landscape") {
        $(el).removeClass("col-md-6");
        $(el).addClass("row");

        //
        $(el).find(".video-thumbnail-containers").removeClass("col-6");
        $(el).find(".video-thumbnail-containers").addClass("col-lg-6 col-md-7 col-sm-12");

        //
        $(el).find(".video-thumbnail-details-containers").removeClass("col-4");
        $(el).find(".video-thumbnail-details-containers").addClass("col-lg-5 col-md-5 col-sm-12");

    }


}