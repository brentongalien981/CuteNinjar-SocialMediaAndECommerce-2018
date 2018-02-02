<!--mandatory-->
<?php require_once("../layout/master.php"); ?>

<!--css-->
<!--<link rel="stylesheet" type="text/css" href="--><?//= PUBLIC_LOCAL . "css/timeline-post/index.css"; ?><!--">-->


<!--CN-Header-->
<?php //require_once(PUBLIC_PATH . "timeline-post/menu-header.php"); ?>

<!--Main-->
<?php require_once(PUBLIC_PATH . "profile/read.php"); ?>

<!--Main extras-->
<?php require_once(PUBLIC_PATH . "profile/page-outline.php"); ?>
<?php require_once(PUBLIC_PATH . "profile/summary.php"); ?>


<!--Templates-->
<?php //require_once(PUBLIC_PATH . "rateable-item/templates/rate_bar.php"); ?>

<!--Extentional Menus-->
<!--profile-user-top-activity-->
<?php require_once(PUBLIC_PATH . "user-top-activity/read.php"); ?>

<?php require_once(PUBLIC_PATH . "contact-information/read.php"); ?>

<?php require_once(PUBLIC_PATH . "work/read.php"); ?>

<?php require_once(PUBLIC_PATH . "friend/read.php"); ?>





<!-- *** SCRIPTS ***-->
<!--Main Scripts-->
<?php tryLoadingJsFilesFor("profile"); ?>
