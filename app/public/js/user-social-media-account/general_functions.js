function doUserSocialMediaAccountPreAfterEffects(className, crudType, json, xObj) {

    //
    switch (crudType) {
        case "read":

            // Unset loader el.
            var loaderEl = $("#loader-for-profile-social-media-xxx");
            removeClonedLoaderEl(loaderEl);

            // readUserSocialMediaAccount();

            break;

        case "create":
        case "update":
        case "delete":
        case "fetch":
        case "patch":
            break;
    }
}

function doUserSocialMediaAccountAfterEffects(className, crudType, json, xObj) {
    switch (crudType) {
        case "read":

            displayUserSocialMediaAccounts(json);

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


function displayUserSocialMediaAccounts(json) {

    var socialMediaAccounts = json.objs;

    //
    for (i = 0; i < socialMediaAccounts.length; i++) {
        var socialMediaAccount = socialMediaAccounts[i];

        //
        var socialMediaItem = $("#social-media-entry-template").clone();
        $(socialMediaItem).removeAttr("id");
        $(socialMediaItem).removeClass("cn-template");

        $(socialMediaItem).find(".social-media-icon").addClass("fa fa-" + socialMediaAccount["social_media_company_name"]);
        $(socialMediaItem).find(".social-media-user-link").html("@" + socialMediaAccount["social_media_username"]);

        $("#profile-social-media-info-section").append($(socialMediaItem));
    }

}