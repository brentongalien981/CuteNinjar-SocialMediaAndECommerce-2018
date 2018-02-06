var userTopActivityContainerGapWidth = 10;

function getUserTopActivityContainerGapWidth() {
    return userTopActivityContainerGapWidth;
}

function setUserTopActivityPhotoHolderTemplateWidth(numOfUserTopActivities) {

    // my_sleep(3);
    // $("#user-top-activities-container").css("width", "100%");
    $('#user-top-activities-container').width($(this).width());
    var containerWidth = $('#user-top-activities-container').width();
    var gapWidth = getUserTopActivityContainerGapWidth();
    var photoHolderWidth = (containerWidth - ((gapWidth) * (numOfUserTopActivities - 1) ) ) / numOfUserTopActivities;
    $("#user-top-activity-photo-holder-template").width(photoHolderWidth);
}