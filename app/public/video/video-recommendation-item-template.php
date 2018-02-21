<?php for ($i = 0; $i < 6; $i++) { ?>

    <div id="video-recommendation-item-template" class="col-md-4 col-sm-6">
<!--    <div id="video-recommendation-item-template" class="col col-md-4 col-sm-4">-->


        <div class="video-thumbnail-containers">

            <div class="video-thumbnails">
                <iframe src="https://www.youtube.com/embed/hHBnPey8CCQ?rel=0" frameborder="0" encrypted-media" allowfullscreen></iframe>
            </div>

            <a href="https://www.facebook.com" target="_blank" class="video-thumbnail-masks"></a>
        </div>

        <div class="video-thumbnail-details-containers">
            <a href="#cn" class="video-thumbnail-titles">Shaqtin' a fool</a>
            <a href="#cn" class="video-thumbnail-poster-names">Shaquille O'neal</a>
        </div>


    </div>

<?php } ?>

<style>
    #video-recommendation-item-template {
        /* min-width: 150px; */
        /*background-color: orange;*/
        /*min-height: 200px; */
        /* Should be the min-height of a youtube video. */
        /*padding: 0 10px;*/
        /*border: 1px solid gray;*/
    }

    .video-thumbnail-containers {
        margin-top: 40px;
    }

    .video-thumbnails {
        /*background-color: green;*/
        /*min-height: 150px;*/
    }

    .video-thumbnails > iframe {
        /*width: 230px;*/
        /*height = width * 0.5625*/
        /*height: 129px;*/
        /*height: 250px;*/
        /*width: -webkit-fill-available;*/
    }

    .video-thumbnail-details-containers {
        /*background-color: blue;*/
    }

    .video-thumbnail-details-containers a {
        display: block;
        color: black;
    }


    a.video-thumbnail-titles {
        font-size: 120%;
    }

    a.video-thumbnail-poster-user-names {

    }

    a.video-thumbnail-masks {
        /* width: 90%; */
        height: 187.989px;
        background-color: goldenrod;
        opacity: 0;
        margin-top: -187.989px;
        position: relative;
        display: block;
    }
</style>