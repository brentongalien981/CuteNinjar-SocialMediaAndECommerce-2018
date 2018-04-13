function readVideoUserPlaylists() {

    // TODO: Remove this.
    return;


    var isOkToProceed = doPreReadComments(loaderContainer);

    if (!isOkToProceed) { return; }

    doRegularReadComments();
    doPostReadComments();
}