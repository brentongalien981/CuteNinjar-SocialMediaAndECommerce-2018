<?php
/**
 * NOTE: There's a problem when updating using the transaction and
 * when you're in debug mode. Because of this limitation, I Just do the
 * update with simple codes...
 */

namespace App\Core;

use App\Core\Main\CNMain;
use App\Model\User;
use Carbon\Carbon;


class MainModel extends CNMain
{
    protected static $db_fields = array();
    protected static $table_name = "DEFAULT_TABLE_NAME";
    protected static $className = "DEFAULT_CLASS_NAME";

    // Override this if the pk-field is not named "id". Ex. "user_id", "product_id", etc...
    public static $searchable_fields = array();
    public $primary_key_id_name = "id";

    protected static function instantiate($record)
    {
        $classModel = "\\App\\Model\\" . static::$className;
        $object = new $classModel;

        foreach ($record as $attribute => $value) {
            if ($object->has_attribute($attribute)) {
                $object->$attribute = $value;
            }
        }
        return $object;
    }

    public static function read_by_query($query = "")
    {
        return self::execute_by_query($query);
    }

    public static function execute_by_query($query = "")
    {
        global $database;

        $result_set = $database->get_result_from_query($query);

        //
        return $result_set;
    }


    public function init()
    {
        // TODO: Override this.
    }

    public function __construct()
    {
        parent::__construct();
        $this->init();
    }


    /**
     * Dynamically create public properties/attributes/variable for the child class
     * extending this MainModel class.
     * @deprecated
     */
    private function create_properties()
    {
        foreach (static::$db_fields as $property) {
            $this->{$property} = null;
        }

        $this->create_primary_key_id_name();
    }

    /**
     * Basically create this so that for ex:
     *      aClassObj->id = $this->database->get_last_inserted_id()
     *      aClassObj->user_id = $this->database->get_last_inserted_id()
     *      aClassObj->product_id = $this->database->get_last_inserted_id()
     *
     * will be user for aClassObj->create(), aClassObj->update(), etc...
     * @deprecated
     */
    private function create_primary_key_id_name()
    {
        $this->{$this->primary_key_id_name} = null;
    }

    protected function has_attribute($attribute)
    {
        // We don't care about the value, we just want to know if the key exists
        // Will return true or false
        return array_key_exists($attribute, $this->get_attributes());
    }


    protected function get_attributes()
    {
        // return an array of attribute names and their values
        $attributes = array();
        foreach (static::$db_fields as $field) {
            if (property_exists($this, $field)) {
                $attributes[$field] = $this->$field;
            }
        }
        return $attributes;
    }

    protected function get_sanitized_attributes()
    {
        $sanitized_attributes = array();
        // sanitize the values before submitting
        // Note: does not alter the actual value of each attribute
        foreach ($this->get_attributes() as $key => $value) {
            $sanitized_attributes[$key] = $this->database->escape_value($value);
        }
        return $sanitized_attributes;
    }


    /**
     * NOTE: Override this method if the PK field is not named "id". For ex. "user_id", "store_id"...
     * @return bool
     */
    public function create()
    {
        // Don't forget your SQL syntax and good habits:
        // - INSERT INTO table (key, key) VALUES ('value', 'value')
        // - single-quotes around all values
        // - escape all values to prevent SQL injection

        $attributes = $this->get_sanitized_attributes();


        $query = "INSERT INTO " . static::$table_name . " (";
        $query .= join(", ", array_keys($attributes));
        $query .= ") VALUES ('";
        $query .= join("', '", array_values($attributes));
        $query .= "')";

        //
        $query = self::update_query_with_current_time_stamp($query);

        $query_result = self::execute_by_query($query);

        if ($query_result) {
            $this->{$this->primary_key_id_name} = $this->database->get_last_inserted_id();
            return true;
        } else {
            return false;
        }
    }


    public function update()
    {
        // Don't forget your SQL syntax and good habits:
        // - UPDATE table SET key='value', key='value' WHERE condition
        // - single-quotes around all values
        // - escape all values to prevent SQL injection
        $attributes = $this->get_sanitized_attributes();
        $attribute_pairs = array();

        foreach ($attributes as $key => $value) {
            // Don't include the password for the update or
            // if the value is null.
            if ($key == "hashed_password" || $value == null) {
                continue;
            }

            $attribute_pairs[] = "{$key}='{$value}'";
        }

        $query = "UPDATE " . static::$table_name . " SET ";
        $query .= join(", ", $attribute_pairs);
        $query .= " WHERE {$this->primary_key_id_name} =" . $this->database->escape_value($this->{$this->primary_key_id_name});


        //
        $query = self::update_query_with_current_time_stamp($query);

        //
        $result_set = self::execute_by_query($query);

        if (!$result_set) {
            return false;
        }

        //
        return ($this->database->get_num_of_affected_rows() == 1) ? true : false;

    }


    /**
     * Replace the word "CURRENT_TIMESTAMP" in the $query string by "NOW()".
     * @param $query
     * @return updated query
     */
    protected static function update_query_with_current_time_stamp($query)
    {
        $newQuery = str_replace("'CURRENT_TIMESTAMP'", "NOW()", $query);
        $newQuery = str_replace("'0000-00-00 00:00:00'", "NOW()", $newQuery);
        return $newQuery;
    }

    public function fetch($data) {
        return $this->read($data);
    }


    /**
     * @deprecated
     * @param $data
     * @return array
     */
    public function read_by_where_clause($data)
    {
        return $this->read($data);
    }

    public function read_by_id($data)
    {
//        $data['pk_name'] = $this->primary_key_id_name;
        return $this->read($data);
    }

    /**
     * Delete by Primary Key
     */
    public function deleteByPk() {

        $pkName = $this->primary_key_id_name;
        $pk = $this->$pkName;

        $query = "DELETE FROM " . static::$table_name;
        $query .= " WHERE {$pkName} = " . $this->database->escape_value($pk);
        $query .= " LIMIT 1";


        self::execute_by_query($query);
        $isDeletionOk = ($this->database->get_num_of_affected_rows() == 1) ? true : false;


        return $isDeletionOk;
    }


    public function read($data = null)
    {
//        //
//        $this->init();

        $id = null;
        $pk_name = null;
        $id = (isset($data['id']) ? $data['id'] : null);
        $pk_name = $this->primary_key_id_name;

        $where_clause = (isset($data['where_clause']) ? $data['where_clause'] : null);
        $groupByClause = (isset($data['groupByClause']) ? $data['groupByClause'] : null);
        $fields = (isset($data['fields']) ? $data['fields'] : '*');
        $limit = (isset($data['limit']) ? $data['limit'] : 4);
        $order_by_field = (isset($data['order_by_field']) ? $data['order_by_field'] : null);
        $order_arrangement = (isset($data['order_arrangement']) ? $data['order_arrangement'] : 'DESC');

        //
        $doNotInstantiate = (isset($data['doNotInstantiate']) ? $data['doNotInstantiate'] : null);

        //
        $q = "SELECT {$fields} FROM " . static::$table_name;


        // Additional query with id.
        if (isset($id)) {
            $q .= " WHERE {$pk_name} = {$id}";
        }

        // Additional query with where clause.
        if (isset($where_clause)) {
            $q .= " " . $where_clause;
        }

        // group-by-clause.
        if (isset($groupByClause)) {
            $q .= " " . $groupByClause;
        }

        // // Additional query "ORDER BY {$field} {ASC}.
        if (isset($order_by_field)) {
            $q .= " ORDER BY {$order_by_field} {$order_arrangement}";
        }

        $q .= " LIMIT {$limit}";


        //
        $q = $this->update_query_with_current_time_stamp($q);



        //
        $result_set = self::execute_by_query($q);


        $array_of_objs = array();

        while ($row = $this->database->fetch_array($result_set)) {

            $an_obj = null;

            if (isset($doNotInstantiate)) {
                $an_obj = $this->createPseudoObj($data, $row);
            } else {
                $an_obj = static::instantiate($row);
            }

//            // Convert obj to an array.
//            $objInArrayForm = get_object_vars($an_obj);

            //
            array_push($array_of_objs, $an_obj);
        }

        return $array_of_objs;
    }

    public static function delete($data)
    {
        global $database;

        $q = "DELETE FROM " . static::$table_name;
        $q .= " WHERE id = " . $database->escape_value($data['id']);
        $q .= " LIMIT 1";


//        $this->database->get_result_from_query($q);
        self::execute_by_query($q);


        return ($database->get_num_of_affected_rows() == 1) ? true : false;
    }

    /**
     * Modify the instantiated obj by appending properties
     * from the producer obj.
     */
    public function isProducedBy($producerType)
    {
        $producerTypeClass = "\\App\\Model\\" . $producerType;
//        $producerObj = new $producerTypeClass;

        $producerId = $this->poster_user_id;
        $data['id'] = $producerId;
        $userObj = (new $producerTypeClass)->read_by_id($data)[0];

        $this->updateMeAsPseudoObj($userObj);
    }

    public function isCreatedBy($creatorType)
    {
        $creatorTypeClass = "\\App\\Model\\" . $creatorType;

        $notifierUserId = $this->notifier_user_id;
        $data['id'] = $notifierUserId;
        $userObj = (new $creatorTypeClass)->read_by_id($data)[0];

        $this->updateMeAsPseudoObj($userObj);
    }

    /**
     * Modify the instantiated obj by appending properties
     * from the extentional obj.
     */
    public function isComposedOf($extentionClassName)
    {
        $extentionalClass = "\\App\\Model\\" . $extentionClassName;

        //
        $parentObjId = null;
        $extentionalObj = null;

        switch ($extentionClassName) {
            case "NotificationRateableItem":
                //
                $parentObjId = $this->id;
                //
                $data['id'] = $parentObjId;
                //
                $extentionalObj = (new $extentionalClass())->read_by_id($data)[0];
                break;
            case "Rate":
                //
                $data['where_clause'] = "WHERE value = {$this->rate_value}";
                //
                $extentionalObj = (new $extentionalClass())->read_by_where_clause($data)[0];
                break;
        }


        //
        $this->updateMeAsPseudoObj($extentionalObj);
    }

    /**
     * Modify the instantiated obj by appending properties
     * from the extentional obj.
     */
    public function isConnectedTo($extentionClassName)
    {
        $extentionalClass = "\\App\\Model\\" . $extentionClassName;

        //
        $parentObjId = null;

        switch ($extentionClassName) {
            case "RateableItem":
                $parentObjId = $this->rateable_item_id;
                break;
            case "TimelinePost":
                $parentObjId = $this->item_x_id;
                break;
        }


        //
        $data['id'] = $parentObjId;
        //ish
        $extentionalObj = (new $extentionalClass())->read_by_id($data)[0];

        $this->updateMeAsPseudoObj($extentionalObj);
    }

    public function to_string()
    {
        $object_in_string = "";

        foreach (static::$db_fields as $field) {
            if (property_exists($this, $field)) {
                echo "{$field}: $this->$field<br>";
                $object_in_string .= "{$field}: $this->$field<br>";
            }
        }

        return $object_in_string;
    }


    /** @deprecateds */
    public function old_update()
    {
        // Don't forget your SQL syntax and good habits:
        // - UPDATE table SET key='value', key='value' WHERE condition
        // - single-quotes around all values
        // - escape all values to prevent SQL injection
        $attributes = $this->get_sanitized_attributes();
        $attribute_pairs = array();

        foreach ($attributes as $key => $value) {
            // Don't include the password for the update.
            if ($key == "hashed_password") {
                continue;
            }

            $attribute_pairs[] = "{$key}='{$value}'";
        }

        $query = "UPDATE " . self::$table_name . " SET ";
        $query .= join(", ", $attribute_pairs);
        $query .= " WHERE user_id =" . $this->database->escape_value($this->user_id);//uki


        // Start transaction.
        if (!$this->database->start_transaction()) {
            return false;
        }

        $this->database->get_result_from_query($query);

        //
        $is_update_ok = ($this->database->get_num_of_affected_rows() == 1) ? true : false;


        //
        if ($is_update_ok) {
            //
            if (!$this->database->commit()) {
                return false;
            }

            //
            return true;
        } else {
            //
            $this->database->rollback();

            //
            return false;
        }

    }

    public static function old_read($data)
    {
        //uki now
        $query = self::get_query_for_read($data);


        //
        $result_set = self::read_by_query($query);

        //
        $array_of_users = array();

        global $database;
        while ($row = $database->fetch_array($result_set)) {
            //
            $a_user = array(
                "user_id" => $row['user_id'],
                "user_name" => $row['user_name'],
                "email" => $row['email'],
                "private" => $row['private'],
                "account_status_id" => $row['account_status_id'],
                "user_type_id" => $row['user_type_id']
            );


            //
            array_push($array_of_users, $a_user);
        }

        return $array_of_users;
    }

    /**
     * Modify the instantiated obj by appending properties
     * from the producer obj. Ex, this timelinePostObj has properties like
     *      $this->post_id
     *      $this->message ...
     * And the producerObj (a user) has properties
     *      $producerObj->user_name
     *      $producerObj->user_id ...
     * Now, combine these objs and produce a new updated pseudo obj. So the
     * original obj now has properties
     *      $this->user_name
     *      $this->user_id ...
     * @deprecated
     */
    private function updateMeAsPseudoObj($joiningObj)
    {
        foreach ($joiningObj as $key => $value) {

            // Don't overwrite the primary keys.
            if ($key == "id") {
                continue;
            }

            $this->$key = $value;
        }
    }

    /**
     * Modify the instantiated obj by appending properties
     * from the producer obj. Ex, this timelinePostObj has properties like
     *      $this->post_id
     *      $this->message ...
     * And the producerObj (a user) has properties
     *      $producerObj->user_name
     *      $producerObj->user_id ...
     * Now, combine these objs and produce a new updated pseudo obj. So the
     * original obj now has properties
     *      $this->user_name
     *      $this->user_id ...
     */
    public function combineWithObj($joiningObj)
    {
        foreach ($joiningObj as $key => $value) {
            $this->$key = $value;
        }
    }

    /** @deprecated  */
    public function hasOne($producerType)
    {
        $producerTypeClass = "\\App\\Model\\" . $producerType;
//        $producerObj = new $producerTypeClass;

        $producerId = $this->poster_user_id;
        $data['id'] = $producerId;
        $profileObj = (new $producerTypeClass)->read_by_id($data)[0];

        $this->updateMeAsPseudoObj($profileObj);
    }

    /** TODO: Rename newHasOne(). */
    public function newHasOne($class, $fk) {


        $path = "\\App\\Model\\" . $class;
        $extentionalObj = new $path;

        $data = null;

        // If the sent argument $fk is an array, that means
        // we would like to read a table record using other key (probably a fk)
        // instead of reading by the pk id.
        if (is_array($fk)) {

            foreach ($fk as $field => $value) {
                $data['where_clause'] = "WHERE {$field} = {$value}";
                break;
            }

        }
        else {
            $data['id'] = $fk;
        }

        $data['limit'] = 1;

        $obj = $extentionalObj->read($data)[0];

        return $obj;
    }

    public function hasMany($class, $fk, $data) {


        $path = "\\App\\Model\\" . $class;
        $extentionalObj = new $path;


        // If the sent argument $fk is an array, that means
        // we would like to read a table record using other key (probably a fk)
        // instead of reading by the pk id.
        if (is_array($fk)) {

            foreach ($fk as $field => $value) {
                $data['where_clause'] = "WHERE {$field} = {$value}";
                break;
            }

        }
        else {
            $data['id'] = $fk;
        }


        $objs = $extentionalObj->read($data);

        return $objs;
    }

    public function belongsTo($class, $pk) {

        return $this->newHasOne($class, $pk);
    }

    public static function filterFieldsForReturn(&$objs, $fieldsAllowedForReturn)
    {
        foreach ($objs as $obj) {

            foreach ($obj as $field => $value) {

                if (!in_array($field, $fieldsAllowedForReturn)) {
                    unset($obj->$field);
                }
            }

            // Also remove the static fields.
            if (isset($obj::$db_fields)) {
                $obj::$db_fields = null;
                $obj::$table_name = null;
                $obj::$className = null;
                $obj::$searchable_fields = null;
            }

        }
    }

    public static function getMyCarbonDate($rawDatetime) {

        $date = Carbon::createFromFormat('Y-m-d H:i:s', $rawDatetime, '-4');
        $date->setTimezone('UTC');

        return $date->diffForHumans();
    }

    public function addReadableDateField($rawDateTimeFieldName) {

        $carbonDate = self::getMyCarbonDate($this->$rawDateTimeFieldName);
        $this->human_date = $carbonDate;
    }

    public function filterInclude($includedFields = []) {

        foreach ($this as $field => $value) {

            if (!in_array($field, $includedFields)) {
                unset($this->$field);
            }
        }
        
//        $this->removeStaticFields();
    }

    public function filterExclude($excludedFields) {

        // Other default excluded fields.
        array_push($excludedFields, 'primary_key_id_name');
        array_push($excludedFields, 'session');
        array_push($excludedFields, 'database');

        foreach ($this as $field => $value) {

            if (in_array($field, $excludedFields)) {
                unset($this->$field);
            }
        }

//        $this->removeStaticFields();
    }
    
    public function removeStaticFields() {

        if (isset($this::$db_fields)) {
            $this::$db_fields = null;
            $this::$table_name = null;
            $this::$className = null;
            $this::$searchable_fields = null;
        }
    }

    public function replaceFieldNamesForAjax($keyValuePairs) {

        foreach ($keyValuePairs as $oldFieldName => $newFieldName) {

            if (isset($this->$oldFieldName)) {

                $this->$newFieldName = $this->$oldFieldName;
                unset($this->$oldFieldName);
            }
        }
    }

}