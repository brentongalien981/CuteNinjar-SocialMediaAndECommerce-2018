<?php
/*
 * $loader needs to be a relative path to an autoloader script.
 * Swift Mailer's autoloader is swift_required.php in the lib directory.
 * If you used Composer to install Swift Mailer, use vendor/autoload.php.
 */
//$loader = __DIR__ . '/../../private/external_api/swiftmailer/vendor/autoload.php';

//require_once $loader;
require_once(CORE_PATH . "external-api/swiftmailer/vendor/autoload.php");



/*
 * Email addresses for testing
 * The first two are associative arrays in the format
 * ['email_address' => 'name']. The rest contain just
 * an email address as a string.
 */
//$from = ['bren@fatninjar.sytes.net' => 'FatNinjar'];
//$to = ['brenallen1.1x10e11@gmail.com' => 'Bren Allen', 'odox700@gmail.com' => 'Odox'];
$test1 = [];
$testing = '';
$test2 = '';
$test3 = '';
$secret = '';
$private = '';
//MyDebugMessenger::add_debug_message("YEAH you called config.php");
?>