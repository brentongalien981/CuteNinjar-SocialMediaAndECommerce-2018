<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2017-12-30
 * Time: 02:14
 */

namespace App\Model;

use App\Core\MainModel;


class Rate extends MainModel
{
    public $id;
    public $value;
    public $name;

    public function init() {
        self::$table_name = "Rates";
        self::$className = "Rate";
        self::$db_fields = array("id", "value", "name");
//        $this->primary_key_id_name = "notification_id";

    }

    public function __construct()
    {
        parent::__construct();
    }
}