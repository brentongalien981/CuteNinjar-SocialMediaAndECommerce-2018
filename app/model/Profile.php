<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2017-12-12
 * Time: 03:43
 */

namespace App\Model;

use App\Core\MainModel;


class Profile extends MainModel
{
    public $user_id;
    public $description;
    public $pic_url;

    public function init()
    {
        self::$table_name = "Profile";
        self::$className = "Profile";
        self::$db_fields = array("user_id", "description", "pic_url");
        $this->primary_key_id_name = "user_id";

    }

    public function __construct()
    {
        parent::__construct();
    }

    public function getAddress() {

        $fkUserId = $this->user_id;
        return $this->newHasOne("Address", ['user_id' => $fkUserId]);
    }

    public function getUserAccount() {

        $fkUserId = $this->user_id;
        return $this->newHasOne("User", ['user_id' => $fkUserId]);
    }
}