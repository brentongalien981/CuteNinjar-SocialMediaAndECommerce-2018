function readVideos() {

    //
    doPreReadVideos();

    //
    doRegularReadVideos();

    //
    // doPostReadVideos();
}

function doPreReadVideos() {

    // Set the loader element.
    var loaderMsg = "Loading videos..";
    var loaderId = "video-xxx";
    var clonedLoaderEl = getClonedLoaderEl(loaderId, loaderMsg);

    var loaderContainer = $("#cn-center-col");

    appendClonedLoaderEl(loaderContainer, clonedLoaderEl);
}

function doRegularReadVideos() {
    var crud_type = "read";
    var request_type = "GET";

    var key_value_pairs = {
        read : "yes"
    };


    var obj = new Video(crud_type, request_type, key_value_pairs);
    obj.read();
}