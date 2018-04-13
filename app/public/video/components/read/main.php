<div id="main-content" class="">


    <div id="cn-left-col" class="cn-col animated">
        <div id="video-user-playlists-plug-in-container"></div>
    </div>


    <div id="cn-right-col" class="cn-col animated">

        <div id="page-outline-container">
            <?php require_once(PUBLIC_PATH . "video/page-outline-section-container-template.php"); ?>
        </div>

    </div>

    <!--*** NOTE ***-->
    <!--Make sure to always load this #cn-center-col the latest...-->
    <!--...later than the left and right cols, so that you won't have problem-->
    <!--...with the displaying of the DOM.-->
    <div id="cn-center-col" class="cn-col">
        <?php require_once(PUBLIC_PATH . "video/video-category-container-template.php"); ?>
    </div>


    <!-- Reference-->
    <div id="" class="reference-for-loading-more-objs"></div>
</div>