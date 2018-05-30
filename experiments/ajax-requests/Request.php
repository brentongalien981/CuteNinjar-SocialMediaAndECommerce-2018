<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2018-05-29
 * Time: 08:09
 */

class Request
{
    public function __construct()
    {
        echo "This is the request-data br <===> ";
        echo "{$_POST['request_data']}";
//        echo "shit";
    }
}

new Request();