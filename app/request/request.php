<?php //require_once('../../vendor/autoload.php'); ?>
<?php require_once __DIR__ . '/../../vendor/autoload.php'; ?>

<?php
function isRequestAjax()
{
    if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
        return true;
    }

    return false;

}

function setRequestVars(&$menu, &$action)
{
    $requested_url = $_SERVER['REQUEST_URI'];
    $requested_url_tokens = explode("/", $requested_url);

    $numOfTokens = count($requested_url_tokens);
    $requestedMenu = $requested_url_tokens[$numOfTokens - 2];
    $requestedActionRaw = $requested_url_tokens[$numOfTokens - 1];

    //
    $strLenOfActualAction = null;

    // If it's in debug mode, remove the "DEBUG_SESSION" suffix.
    $index_of_xdebug_mode_url_suffix = strpos($requestedActionRaw, ".");
    $strLenOfActualAction = $index_of_xdebug_mode_url_suffix;

    $requestedAction = substr($requestedActionRaw, 0, $strLenOfActualAction);


    $menu = $requestedMenu;
    $action = $requestedAction;
}

function isInDisregardedClasses($menu) {
    switch ($menu) {
        case 'Public':
            return true;
        default:
            return false;
    }
}

function getModifiedMenuName($menu) {

    $modifiedMenuName = null;

    switch ($menu) {
        case 'public':
            $modifiedMenuName = "Public";
            break;
        case 'user':
            $modifiedMenuName = "User";
            break;
        case 'profile':
            $modifiedMenuName = "Profile";
            break;
        case 'timeline-post':
            $modifiedMenuName = "TimelinePost";
            break;
        case 'timeline-post-reply':
            $modifiedMenuName = "TimelinePostReply";
            break;
        case 'timeline-post-user-subscription':
            $modifiedMenuName = "TimelinePostUserSubscription";
            break;
        case 'rateable-item':
            $modifiedMenuName = "RateableItem";
            break;
        case 'rateable-item-user':
            $modifiedMenuName = "RateableItemUser";
            break;
        case 'notification':
            $modifiedMenuName = "Notification";
            break;
        case 'notification-rateable-item':
            $modifiedMenuName = "NotificationRateableItem";
            break;
        case 'notification-timeline-post-reply';
            $modifiedMenuName = "NotificationTimelinePostReply";
            break;
        case 'photo';
            $modifiedMenuName = "Photo";
            break;
        case 'my-photo';
            $modifiedMenuName = "MyPhoto";
            break;
        case 'user-social-media-account';
            $modifiedMenuName = "UserSocialMediaAccount";
            break;
        case 'user-top-activity';
            $modifiedMenuName = "UserTopActivity";
            break;
        case 'work';
            $modifiedMenuName = "Work";
            break;
        case 'friendship';
            $modifiedMenuName = "Friendship";
            break;
        case 'friend';
            $modifiedMenuName = "Friend";
            break;

    }

    return $modifiedMenuName;
}

?>


<?php
$menu = null;
$action = null;

if (isRequestAjax()) {
    if (is_request_post()) {
//        $menu = $_POST['menu'] . 'Controller';
        $menu = $_POST['menu'];
        $action = $_POST['action'];
    } else {
//        $menu = $_GET['menu'] . 'Controller';
        $menu = $_GET['menu'];
        $action = $_GET['action'];
    }
} else {
    setRequestVars($menu, $action);
    $menu = getModifiedMenuName($menu);
}


//$menu = ucfirst($menu);


if (!isInDisregardedClasses($menu)) {

    $class = "App\\Controller\\{$menu}Controller";

//    $menu_controller = null;
//    if (isRequestAjax()) {
//        $menu_controller = new $class();
//    }
//    else {
//        $menu_controller = new $class($menu, $action);
//    }
    $menu_controller = new $class($menu, $action);


    $menu_controller->doAction();
}