<?php require_once('../../vendor/autoload.php'); ?>

<?php
function isRequestAjax()
{
    if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
        return true;
    }

    return false;

}
?>


<?php
$menu = null;
$action = null;

if (is_request_post()) {
    $menu = $_POST['menu'] . 'Controller';
    $action = $_POST['action'];
}
else {
    $menu = $_GET['menu'] . 'Controller';
    $action = $_GET['action'];
}


$class = "App\\Controller\\{$menu}";
$menu_controller = new $class();

//
//if (isRequestAjax()) { $menu_controller->doAjaxAction(); }
//else { $menu_controller->$action(); }
$menu_controller->doAction();
