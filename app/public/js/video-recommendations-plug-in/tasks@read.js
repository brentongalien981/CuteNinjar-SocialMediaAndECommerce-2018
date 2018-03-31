function initVideoRecommendationsPlugInContainer(videoRecommendationsPlugInContainer) {

    var videoRecommendationsPlugIn = $("#video-recommendations-plug-in");
    $(videoRecommendationsPlugInContainer).append($(videoRecommendationsPlugIn));
    // $("#cn-center-col").append($(videoRecommendationsPlugInContainer));


    /* TODO: Delete this. */
    for (i = 0; i < 3; i++) {

        // Clone the #video-recommendation-item-template.
        var videoRecommendationItemEl = cnCloneTemplateEl("video-recommendation-item-template");
        initVideoRecommendationItemEl(videoRecommendationItemEl);

        // Append to DOM.
        var actualItemsContainer = $("#video-recommendations-plug-in").find(".actual-items-container").append($(videoRecommendationItemEl));

        // Add resize-listener.
        addResizeListenerToVideoRecommendationItemEl(videoRecommendationItemEl);
    }
}