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

    // CONSTANTS
    const ITEM_X_TYPE_ID_TIMELINE_POST = 1;
    const ITEM_X_TYPE_ID_VIDEO = 2;

    protected static $db_fields = array(
        "id",
        "item_x_id",
        "item_x_type_id"
    );
    protected static $table_name = "RateableItems";
    protected static $className = "RateableItem";

    public $id;
    public $item_x_id;
    public $item_x_type_id;

    /** @override */
    public function init() {


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

    public function getXRateableItem() {

        //
        $modelPath = "\\App\\Model\\";

        //
        switch ($this->item_x_type_id) {
            case self::ITEM_X_TYPE_ID_TIMELINE_POST:
                $modelPath .= 'TimelinePost';
                break;
            default:
                return null;
        }


        //
        $data = [
            'id' => $this->item_x_id
        ];


        //
        return $modelPath::readById($data)[0];
    }

    public function doesRecordExist() {
        $data['where_clause'] = "WHERE item_x_id = {$this->item_x_id}";
        $data['where_clause'] .= " AND item_x_type_id = {$this->item_x_type_id}";


        $objs = $this->read_by_where_clause($data);
        return (count($objs) > 0) ? true : false;
    }

}