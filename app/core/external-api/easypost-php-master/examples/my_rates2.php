<?php

//require_once("../vendor/autoload.php");
require_once("../lib/easypost.php");

// Key from github.
\EasyPost\EasyPost::setApiKey('cueqNZUb3ldeWTNX7MU3Mel8UXtaAMUi');

// Test Key from odox700@gmail.com account.
//\EasyPost\EasyPost::setApiKey('1SEVj2JbQefTe0JxShMtiw');

// Production Key from odox700@gmail.com account.
//\EasyPost\EasyPost::setApiKey('BCZMVeLiKaUJbW9jlZhNyw');

$to_address = \EasyPost\Address::create(
    array(
        "name"    => "Dirk Diggler",
        "street1" => "1111 S Figueroa St",
////        "street2" => "Apt 20",
        "city"    => "Los Angeles",
        "state"   => "CA",
        "zip"     => "90015",
        "country" => "US",
//        "phone"   => "415-456-7890"
    )
);


$to_address = \EasyPost\Address::create(
    array(
        "name"    => "Dirk Diggler",
        "street1" => "78 Monkhouse Rd",
//        "street2" => "Apt 20",
        "city"    => "Markham",
        "state"   => "ON",
        "zip"     => "L6E1V5",
        "country" => "CA",
//        "phone"   => "415-456-7890"
    )
);



$from_address = \EasyPost\Address::create(
    array(
        "company" => "Simpler Postage Inc",
        "street1" => "50 Thorncliffe Park Dr",
        "city"    => "East York",
        "state"   => "ON",
        "zip"     => "M4H1K5",
        "country" => "CA",
        "phone"   => "620-123-4567"
    )
);





// TODO: Don't forget to add the object "Customs"
// for international shipping.


$parcel = \EasyPost\Parcel::create(array(
  "length" => 10.2,
  "width" => 7.9,
  "height" => 3, // inches
  "weight" => 55 // ounce
));



$shipment = \EasyPost\Shipment::create(
    array(
        "to_address"   => $to_address,
        "from_address" => $from_address,
        "parcel"       => $parcel
    )
);





echo "<br><br>";






// 
$cheapest_days_and_rate_pair_array = array();

// 
$current_delivery_carrier;
$current_delivery_service;
$current_delivery_days;
$current_delivery_rate;
$new_delivery_option;
$count = -1;

foreach ($shipment["rates"] as $rates) {
//    echo "<br>{$rates['carrier']}: {$rates['rate']}: {$rates['delivery_days']}: {$rates['service']}<br>";
    
    
    
    // If there's no delivery days listed,
    // don't include it in the list.
//    if ((empty($rates['delivery_days'])) && ($rates['carrier'] != "UPS")) {
//        continue;
//    } 
    if (empty($rates['delivery_days'])) {
        continue;
    } 
    
    
    $current_delivery_carrier = $rates["carrier"];
    $current_delivery_service = $rates["service"];
    $current_delivery_days = $rates["delivery_days"];
    $current_delivery_rate = $rates["rate"];
    
    $new_delivery_option = array($current_delivery_carrier, $current_delivery_service, $current_delivery_days, $current_delivery_rate);
    
    // This only happens once in this loop.
    if ($count == -1) {
        array_push($cheapest_days_and_rate_pair_array, $new_delivery_option);
        ++$count;
        continue;
    }
    
    
    
    $isThereReplacement = false;
    
    for ($i = 0; $i < count($cheapest_days_and_rate_pair_array); $i++) {
        if (($cheapest_days_and_rate_pair_array[$i][0] == $current_delivery_carrier) &&
            ($cheapest_days_and_rate_pair_array[$i][2] == $current_delivery_days)) {
            
            
            if (($cheapest_days_and_rate_pair_array[$i][3] > $current_delivery_rate)) {
                // This means there's a cheaper option with the same delivery days.
                // So set the name of the old option to "zZz" which will be a flag
                // next to this chunk of code to be disregarded.
                $cheapest_days_and_rate_pair_array[$i][0] = "zZz";
                
                // Add the new and better delivery option.
                array_push($cheapest_days_and_rate_pair_array, $new_delivery_option);
//                $isThereReplacement = true;
            }
            
            break;
            
        }
        
        if ($i == (count($cheapest_days_and_rate_pair_array)) - 1) {
            array_push($cheapest_days_and_rate_pair_array, $new_delivery_option);
        }
    }    
}
?>






<?php
echo "<select>";

foreach ($cheapest_days_and_rate_pair_array as $a_verified_delivery_option) {
    if ($a_verified_delivery_option[0] == "zZz") {
        continue;
    }
    
    echo "<option>{$a_verified_delivery_option[0]} - {$a_verified_delivery_option[1]} - Ships in {$a_verified_delivery_option[2]} days - USD \${$a_verified_delivery_option[3]}</option>";
}

echo "</select>";
?>
