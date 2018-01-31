<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2017-12-19
 * Time: 13:40
 */

namespace App\Model;

use App\Core\MainModel;


class RateableItem extends MainModel
{
    public $id;
    public $item_x_id;
    public $item_x_type_id;

    /** @override */
    public function init() {
        self::$table_name = "RateableItems";
        self::$className = "RateableItem";

        self::$db_fields = array(
            "id",
            "item_x_id",
            "item_x_type_id"
        );
//        $this->primary_key_id_name = "user_id";

    }

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @override
     */
    public function create() {
        if ($this->doesRecordExist()) { return true; }

        $isCrudOk = parent::create();
        return $isCrudOk;
    }

    public function doesRecordExist() {
        $data['where_clause'] = "WHERE item_x_id = {$this->item_x_id}";
        $data['where_clause'] .= " AND item_x_type_id = {$this->item_x_type_id}";


        $objs = $this->read_by_where_clause($data);
        return (count($objs) > 0) ? true : false;
    }

}