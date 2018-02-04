$(document).ready(function(){

    setPageTitle("Profile | CuteNinjar");

    initPage();

    readProfileSummary();

    readContactInformation();
});




function initPage() {
    initContainers();

    $("#center-col-toggle-btn").remove();
}

function initContainers() {
    $("#cn-center-col").append($("#user-top-activities-container"));
    $("#cn-center-col").append($("#user-summary-container"));
    $("#cn-center-col").append($("#work-container"));
    $("#cn-center-col").append($("#friend-container"));

    $("#cn-left-col").append($("#contact-information-container"));
    $("#cn-right-col").append($("#profile-page-outline-container"));
}