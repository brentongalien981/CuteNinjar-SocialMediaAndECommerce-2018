function displayContactInformation(json) {

    //
    var profiles = json.objs;

    //
    for (i = 0; i < profiles.length; i++) {
        var profile = profiles[i];

        // pic-url
        if (profile["pic_url"] == "0") { profile["pic_url"] = get_default_pic_url(); }
        $("#profile-photo").attr("src", profile["pic_url"]);


        //
        $("#profile-full-name").html("TODO: profile-full-name");
        $("#profile-user-name").html("@" + profile["user_name"]);
        $("#profile-phone-number").html(profile["phone"]);
        $("#profile-email").html("TODO: email");

        $("#profile-street1").html(profile["street1"]);

        if (profile["street2"] != null) {
            $("#profile-street2").html(profile["street2"]);
        }

        $("#profile-city").html(profile["city"]);
        $("#profile-state").html(" " + profile["state"]);
        $("#profile-zip").html(" " + profile["zip"]);

    }
}

// TODO: displaySocialMediaContacts().
function displaySocialMediaContacts() {

    var socialMediaItem = $(".social-media-entry").clone();
    $(socialMediaItem).removeClass("cn-template");

    $(socialMediaItem).find(".social-media-icon").addClass("fa fa-twitter");
    $(socialMediaItem).find(".social-media-user-link").html("@bren");

    $("#profile-social-media-info-section").append($(socialMediaItem));
}