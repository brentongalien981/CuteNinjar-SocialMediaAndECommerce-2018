var userTopActivityContainerGapWidth = 10;

function getUserTopActivityContainerGapWidth() {
    return userTopActivityContainerGapWidth;
}

function setUserTopActivityPhotoHolderTemplateWidth (numOfUserTopActivities) {

    var containerWidth = $("#user-top-activities-container").width();
    var gapWidth = getUserTopActivityContainerGapWidth();
    var photoHolderWidth = (containerWidth - ((gapWidth) * (numOfUserTopActivities - 1) ) ) / numOfUserTopActivities;
    $("#user-top-activity-photo-holder-template").width(photoHolderWidth);
}