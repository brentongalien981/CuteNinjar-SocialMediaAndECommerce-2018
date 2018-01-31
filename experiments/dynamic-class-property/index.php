<?php
require_once("ClassA.php");

$obj = new ClassA();
$obj->primary_key_id =
$obj->{$obj->primary_key_id_name} = "user_id";
$obj->{$obj->fk_id_name} = "product-id-72";


echo "primary_key_id_name: $obj->primary_key_id_name<br>";
echo "\$obj->id: {$obj->id}<br>";
echo "\$obj->product_id: {$obj->product_id}<br>";

?>