<?php

$a = [];
$a['message'] = [
    'required' => 1,
    'min' => 1
];

$a['title'] = [
    'required' => 1,
    'min' => 1,
    'max' => 123
];

$a['date'] = [
    'required' => 1
];


var_dump($a);
?>