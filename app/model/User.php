<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2017-07-20
 * Time: 16:52
 */

namespace App\Model;

use App\Core\MainModel;


class User extends MainModel
{
    const GUEST_USER_TYPE = 2;
    const LOGGED_IN_USER_TYPE = 1;
    const ADMIN_USER_TYPE = 3;

//    protected static $table_name = "Users";
//    protected static $db_fields = array("user_id", "user_name", "email", "hashed_password", "user_type_id", "signup_token", "private", "account_status_id");
//    public static $searchable_fields = array("user_name", "email");
    public $user_id;
    public $user_name;
    public $email;
    public $hashed_password;
    public $user_type_id;
    public $signup_token;
    public $private;
    public $account_status_id;
    public $primary_key_id_name = "user_id";

    public function __construct()
    {
        parent::__construct();
    }

    public function init() {
        self::$table_name = "Users";
        self::$className = "User";
        self::$db_fields = array("user_id", "user_name", "email", "hashed_password", "user_type_id", "signup_token", "private", "account_status_id");
        self::$searchable_fields = array("user_name", "email");
        $this->primary_key_id_name = "user_id";

    }


    /**
     * @param string $user_name
     * @return userObj / bool
     */
    public static function authenticate_with_user_object_return($user_name = "") {
        global $database;

        $user_name = $database->escape_value($user_name);

        $data = array(
            'where_clause' => "WHERE user_name = '{$user_name}'",
            'limit' => 1
        );



        $users = (new self())->read_by_where_clause($data);
        $user = $users[0];

        return !empty($user) ? $user : false;
    }

    public static function get_user_type($type_id) {
        switch ($type_id) {
            case self::GUEST_USER_TYPE:
                return "guest";
                break;
            case self::LOGGED_IN_USER_TYPE:
                return "logged-in";
                break;
            case self::ADMIN_USER_TYPE:
                return "admin";
                break;
        }
    }










    /** TODO: Maybe refacor these. */
    public static function create_user_profile($user_id)
    {
//        global $session;
        global $database;
        $query = "INSERT INTO Profile(user_id) VALUES({$user_id})";

        $is_creation_ok = $database->get_result_from_query($query);

        if ($is_creation_ok) {
            return true;
        }

        return false;
    }
}