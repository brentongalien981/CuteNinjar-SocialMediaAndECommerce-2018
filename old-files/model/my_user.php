<?php

// If it's going to need the database, then it's 
// probably smart to require it before we start.
require_once("my_database.php");

class User {

    protected static $table_name = "Users";
    protected static $db_fields = array("user_id", "user_name", "email", "hashed_password", "user_type_id", "signup_token");
    public static $searchable_fields = array("user_name", "email");
    public $user_id;
    public $user_name;
    public $email;
    public $hashed_password;
    public $user_type_id;
    public $signup_token;


    public static function read_by_id($id = 0) {

        $query = "SELECT * FROM " . self::$table_name;
        $query .= " WHERE user_id = {$id}";

        $result_set = self::read_by_query($query);

        //
        $an_obj = null;


        global $database;
        while ($row = $database->fetch_array($result_set)) {

            //
            $an_obj = array(
                "user_name" => $row["user_name"]
            );
        }

        //
        return $an_obj;
    }

    public static function read_by_query($query = "") {
        global $database;

        $result_set = $database->get_result_from_query($query);

        //
        return $result_set;
    }

    public static function read_by_query_and_instantiate($query = "") {
        global $database;

        $result_set = $database->get_result_from_query($query);

        $objects_array = array();

        while ($row = $database->fetch_array($result_set)) {
//            $objects_array[] = self::instantiate($row);
            array_push($objects_array, self::instantiate($row));
        }

        return $objects_array;
    }

//      public static function authenticate_with_user_object_return($user_name = "", $hashed_password = "") {
//        global $database;
//        
//        $user_name = $database->escape_value($user_name);
//        $hashed_password = $database->escape_value($hashed_password);
//
//        $query = "SELECT * FROM " . self::$table_name . " ";
//        $query .= "WHERE user_name = '{$user_name}' ";
//        $query .= "AND hashed_password = '{$hashed_password}' ";
//        $query .= "LIMIT 1";
//        
//        // TODO: DEBUG
//        echo "<br>QUERY query: {$query}<br>";
//        
//        $result_user_record = self::read_by_query($query);
//        
//        return !empty($result_user_record) ? array_shift($result_user_record) : false;
//    }

    //
    public static function authenticate_with_user_object_return($user_name = "") {
        global $database;

        $user_name = $database->escape_value($user_name);
//        $hashed_password = $database->escape_value($hashed_password);

        $query = "SELECT * FROM " . self::$table_name . " ";
        $query .= "WHERE user_name = '{$user_name}' ";
//        $query .= "AND hashed_password = '{$hashed_password}' ";
        $query .= "LIMIT 1";

        // TODO: DEBUG
        echo "<br>QUERY query: {$query}<br>";

        $result_user_record = self::read_by_query_and_instantiate($query);

        return !empty($result_user_record) ? array_shift($result_user_record) : false;
    }

    public static function read_all() {
        $query = "SELECT * FROM " . self::$table_name;

        $objects_array = self::read_by_query($query);

        return $objects_array;
    }

    private function has_attribute($attribute) {
        // We don't care about the value, we just want to know if the key exists
        // Will return true or false
        return array_key_exists($attribute, $this->get_attributes());
    }
    
    public static function create_by_query($query = "") {
        global $database;

        $result_set = $database->get_result_from_query($query);


        //
        if ($database->get_num_of_affected_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public static function update_by_query($query = "") {
        global $database;

        $result_set = $database->get_result_from_query($query);


        //
        if ($database->get_num_of_affected_rows() == 1) {
            return true;
        } else {
            return false;
        }
    }

    // Returns bool.
    public function create_with_bool() {
        global $database;
        // Don't forget your SQL syntax and good habits:
        // - INSERT INTO table (key, key) VALUES ('value', 'value')
        // - single-quotes around all values
        // - escape all values to prevent SQL injection

        $attributes = $this->get_sanitized_attributes();

        $query = "INSERT INTO " . self::$table_name . " (";
        $query .= join(", ", array_keys($attributes));
        $query .= ") VALUES ('";
        $query .= join("', '", array_values($attributes));
        $query .= "')";

        $query_result = $database->get_result_from_query($query);

        if ($query_result) {
            $this->user_id = $database->get_last_inserted_id();
            return true;
        } else {
            return false;
        }
    }

    public static function make_query($query = "") {
        global $database;

        $result_set = $database->get_result_from_query($query);


        //
        if ($result_set) {
            return true;
        } else {
            return false;
        }
    }

    protected function get_sanitized_attributes() {
        global $database;
        $sanitized_attributes = array();
        // sanitize the values before submitting
        // Note: does not alter the actual value of each attribute
        foreach ($this->get_attributes() as $key => $value) {
            $sanitized_attributes[$key] = $database->escape_value($value);
        }
        return $sanitized_attributes;
    }

    protected function get_attributes() {
        // return an array of attribute names and their values
        $attributes = array();
        foreach (self::$db_fields as $field) {
            if (property_exists($this, $field)) {
                $attributes[$field] = $this->$field;
            }
        }
        return $attributes;
    }

    // This is called if you're reading the user db
    // and instantiating user objects, then displaying them.
    private static function instantiate($record) {
        $object = new self;

        foreach ($record as $attribute => $value) {
            if ($object->has_attribute($attribute)) {
                $object->$attribute = $value;
            }
        }

        // Because the class attribute $id is not included as a key
        // in this class's array $db_fields, we assign a value to the $id separately.
//        foreach ($record as $attribute => $value) {
//            if ($attribute == "user_id") {
//                $object->$attribute = $value;
//                break;
//            }
//        }
        return $object;
    }

}

?>