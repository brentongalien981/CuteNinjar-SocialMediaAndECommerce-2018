function doUserTopActivityPreAfterEffects(className, crudType, json, xObj) {

    //
    switch (crudType) {
        case "read":

            // Unset loader el.
            var loaderEl = $("#loader-for-user-top-activity-xxx");
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

function doUserTopActivityAfterEffects(className, crudType, json, xObj) {
    switch (crudType) {
        case "read":

            displayUserTopActivities(json);

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

function displayUserTopActivities(json) {

    var userTopActivities = json.objs;
    var numOfUserTopActivities = userTopActivities.length;

    // setUserTopActivityContainerParameters();
    setUserTopActivityPhotoHolderTemplateWidth(numOfUserTopActivities);
    // setUserTopActivityPhotoHolderTemplateHeight (numOfUserTopActivities);


    //
    for (i = 0; i < numOfUserTopActivities; i++) {
        var userTopActivity = userTopActivities[i];

        //
        var userTopActivityHolder = $("#user-top-activity-photo-holder-template").clone(true);
        $(userTopActivityHolder).removeAttr("id");
        $(userTopActivityHolder).removeClass("cn-template");
        $(userTopActivityHolder).addClass("user-top-activity-photo-holder-templates");

        // Add margin to the holder.
        if (i > 0) {
            $(userTopActivityHolder).css("margin-left", getUserTopActivityContainerGapWidth() + "px");
        }

        var userTopActivityPhoto = $(userTopActivityHolder).find("img");
        $(userTopActivityPhoto).attr("src", userTopActivity["photo_link"]);

        $("#user-top-activities-container").append($(userTopActivityHolder));


        //
        enableDragAndCropFeature(userTopActivityPhoto);
    }

}

function enableDragAndCropFeature(userTopActivityPhoto) {

    $(userTopActivityPhoto).dragncrop({
        overflow: true,
        overlay: true
    });
}