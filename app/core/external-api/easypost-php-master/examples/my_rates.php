<?php

//require_once("../vendor/autoload.php");
require_once("../lib/easypost.php");
\EasyPost\EasyPost::setApiKey('cueqNZUb3ldeWTNX7MU3Mel8UXtaAMUi');

//\EasyPost\EasyPost::setApiKey('1SEVj2JbQefTe0JxShMtiw');


//\EasyPost\EasyPost::setApiKey('BCZMVeLiKaUJbW9jlZhNyw');

//$to_address = \EasyPost\Address::create(
//    array(
//        "name"    => "Dirk Diggler",
//        "street1" => "1111 S Figueroa St",
//////        "street2" => "Apt 20",
//        "city"    => "Los Angeles",
//        "state"   => "CA",
//        "zip"     => "90015",
//        "country" => "US",
////        "phone"   => "415-456-7890"
//    )
//);



$to_address = \EasyPost\Address::create(
    array(
        "name"    => "Dirk Diggler",
        "street1" => "78 Monkhouse Rd",
//        "street2" => "Apt 20",
        "city"    => "Markham",
        "state"   => "ON",
        "zip"     => "L6E 1V5",
        "country" => "CA",
//        "phone"   => "415-456-7890"
    )
);


$from_address = \EasyPost\Address::create(
    array(
        "company" => "Simpler Postage Inc",
        "street1" => "105-50 Thorncliffe Park Dr",
        "city"    => "East York",
        "state"   => "ON",
        "zip"     => "M4H 1K4",
        "country" => "CA",
        "phone"   => "620-123-4567"
    )
);

$parcel = \EasyPost\Parcel::create(array(
  "length" => 10.2,
  "width" => 7.9,
  "height" => 3,
  "weight" => 55
));

//$parcel = \EasyPost\Parcel::create(
//    array(
//        "predefined_package" => "LargeFlatRateBox",
//        "weight" => 76.9
//    )
//);
$shipment = \EasyPost\Shipment::create(
    array(
        "to_address"   => $to_address,
        "from_address" => $from_address,
        "parcel"       => $parcel
    )
);

//$shipment->buy($shipment->lowest_rate());
//
//$shipment->insure(array('amount' => 100));
//
//echo $shipment->postage_label->label_url;


// TODO: DEBUG

//$shipments = \EasyPost\Shipment::all(array(
//  "page_size" => 2,
//  "start_datetime" => "2016-01-02T08:50:00Z",
//    "purchased" => false
//));
//var_dump($shipment->get_rates());
echo "<br><br>";
//echo $shipment["rates"][0]["delivery_days"];
//echo "count: " . count($shipment["rates"]);
var_dump(count($shipment["rates"]));
foreach ($shipment["rates"] as $rates) {
    echo "<br>{$rates['carrier']}: {$rates['rate']}: {$rates['delivery_days']}: {$rates['service']}<br>";
}


//echo "count(shipments['shipments]): " . count($shipments["shimpments"]);
