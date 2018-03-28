function doCommentPreAfterEffects(className, crudType, json, xObj) {

    //
    switch (crudType) {
        case "read":

            // Unset loader el.
            var loaderEl = $("#loader-for-comment-plug-in");
            removeClonedLoaderEl(loaderEl);


            //
            setIsCommentReading(false);

            //
            if (!isCnAjaxResultOk(json)) {
                setNumOfFailedCommentAjaxRead(parseInt(getNumOfFailedCommentAjaxRead()) + 1);
            }

            break;

        case "show":
            break;
        case "create":
        case "update":
        case "delete":
        case "fetch":
        case "patch":
            break;
    }
}

function doCommentAfterEffects(className, crudType, json, xObj) {

    switch (crudType) {
        case "read":
            displayComments(json);
            break;
        case "show":
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

function displayComments(json) {
    doPreDisplayComments();
    doRegularDisplayComments(json);
    doPostDisplayComments();
}

/**
 * App checks if there is at least one comment-item
 * displayed. If not, app shows the element
 * .no-comments-to-show-label.
 */
function doPostDisplayComments() {
    var commentItems = $(".comment-plug-in-item");

    if (commentItems.length == 0) {
        $("#comments-plug-in").find(".no-comments-to-show-label").css("display", "block");
    } else {
        $("#comments-plug-in").find(".no-comments-to-show-label").css("display", "none");
    }
}

function doRegularDisplayComments(json) {

    //
    var comments = json.objs;

    // App loops through the returned json-objs.
    for (var i = 0; i < comments.length; i++) {

        var comment = comments[i];

        // App clones the #comment-plug-in-item-template.
        var commentPlugInItem = cnCloneTemplateEl("comment-plug-in-item-template");

        // App fills-in the cloned template with details from the currently iterated json-obj.
        setCommentPlugInItem(commentPlugInItem, comment);

        // App appends the cloned template to
        // #comments-plug-in / .actual-comments-section.
        var commentItemContainer = $("#comments-plug-in").find(".actual-comments-section");
        $(commentItemContainer).append($(commentPlugInItem));
    }

}

/**
 * Fill-in the cloned template with details from the currently iterated json-obj.
 * @param commentPlugInItem is the cloned template.
 * @param comment is the json-obj.
 */
function setCommentPlugInItem(commentPlugInItem, comment) {

    // Initialize the commentPlugInItem (set the attributes).
    $(commentPlugInItem).addClass("comment-plug-in-item");


    // Set the poster-user-photo.
    var photoUrl = comment["posterUserProfile"]["pic_url"];
    if (photoUrl != null && photoUrl != "0") {
        $(commentPlugInItem).find(".comment-poster-user-photo").attr("src", photoUrl);
    }


    // Set the poster-user-name and her profile link.
    var userName = comment["commentPosterUser"]["user_name"];
    $(commentPlugInItem).find(".comment-poster-user-name").html(userName);
    var profileLink = get_local_url() + "profile/index.php?user_name=" + userName;
    $(commentPlugInItem).find(".comment-poster-user-name").attr("href", profileLink);


    // Set the comment-creation-date attribute (created_at).
    var creationDate = comment["created_at"];
    $(commentPlugInItem).attr("created-at", creationDate);


    // Set the human-readable-date when the comment was created.
    var readableCreationDate = comment["human_date"];
    $(commentPlugInItem).find(".comment-date").html(readableCreationDate);


    // Set the message of the comment.
    var message = comment["message"];
    $(commentPlugInItem).find(".comment-message").html(message);

}

function doPreDisplayComments() {
    
}