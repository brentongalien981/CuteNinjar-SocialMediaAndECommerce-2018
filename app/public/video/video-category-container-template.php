<div id="video-category-container-template" class="container-fluid">

    <h3 class="video-category-title">[Recommended for You]</h3>
    <hr>

    <div class="videos-sections row">

        <?php require_once(PUBLIC_PATH . "video/video-recommendation-item-template.php"); ?>

    </div>

    <button type="button" class="btn mx-auto btn-outline-info show-more-playlist-btn">show more</button>

</div>




<style>

    #video-category-container-template .show-more-playlist-btn,
    .video-category-containers .show-more-playlist-btn {
        display: block;
        padding: 10px 100px;
        margin-top: 30px;
    }

    #video-category-container-template,
    .video-category-container {
        padding: 20px 8%;
    }
</style>