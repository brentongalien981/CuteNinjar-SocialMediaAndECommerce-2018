function addClickListenerToShowMoreVideosBtn(btn) {

    if ($(btn).attr("hasClickHandler") == "yes") { return; }
    else {
        $(btn).attr("hasClickHandler", "yes");
    }

    $(btn).click(function () {

        // var videoCategoryCntainer = $(this).closest(".video-category-containers");
        // var pageSection = $(videoCategoryCntainer).attr("pageSection");

        readVideos(this);
    });
}