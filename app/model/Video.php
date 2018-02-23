<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2018-02-06
 * Time: 07:16
 */

namespace App\Model;

use App\Core\MainModel;


class Video extends MainModel
{
    protected static $table_name = "Videos";
    protected static $className = "Video";

    protected static $db_fields = array(
        "id",
        "user_id",
        "title",
        "description",
        "url",
        "owner_name",
        "private",
        "created_at",
        "updated_at"
    );

    public $id;
    public $user_id;
    public $title;

    public $description;
    public $url;
    public $owner_name;
    public $private;
    public $created_at;
    public $updated_at;

}