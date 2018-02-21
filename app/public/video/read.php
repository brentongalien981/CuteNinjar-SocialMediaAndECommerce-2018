<div id="main-content" class="">


    <div id="cn-left-col" class="cn-col animated">

        <div id="playlists-container">
            <?php require_once(PUBLIC_PATH . "video/playlist-container-template.php"); ?>
        </div>

    </div>


    <div id="cn-right-col" class="cn-col animated">

        <div id="page-outline-container">
            <?php require_once(PUBLIC_PATH . "video/page-outline-section-container-template.php"); ?>
        </div>

    </div>


    <div id="cn-center-col" class="cn-col">
        <?php require_once(PUBLIC_PATH . "video/video-category-container-template.php"); ?>
    </div>


    <!-- Reference-->
    <div id="" class="reference-for-loading-more-objs"></div>
</div>


<link rel="stylesheet" type="text/css" href="<?= PUBLIC_LOCAL . "css/video/read.css"; ?>">