<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2017-12-29
 * Time: 21:21
 */

namespace App\Controller;

use App\Core\Main\MainController;
use App\Controller\AjaxCrudHandlerInterface;


class NotificationController extends MainController implements AjaxCrudHandlerInterface
{
    public function __construct()
    {
        parent::__construct();
    }


    protected function setSpecificQueryClauses($data = null) {

        $this->sanitizedFields['where_clause'] = "WHERE notified_user_id = {$this->session->actual_user_id}";

        if (isset($data['where_clause'])) {
            $this->sanitizedFields['where_clause'] .= " " . $data['where_clause'];
        }

        $this->sanitizedFields['order_by_field'] = "initiation_date";

    }

    /** @deprecated  */
    public function overrideSanitizedFields($value) {
        $this->sanitizedFields = $value;
    }

    /** @implement */
    public function doSpecificAjaxCrudAction()
    {
        switch ($this->action) {
            case 'create':
            case 'update':
                $this->menuObj->id = ($this->action == "create") ? null : $this->sanitizedFields['id'];
                $this->menuObj->notified_user_id = $this->session->currently_viewed_user_id;
                $this->menuObj->notifier_user_id = $this->session->actual_user_id;
                $this->menuObj->notification_msg_id = $this->sanitizedFields['notification_msg_id'];
                $this->menuObj->initiation_date = 'CURRENT_TIMESTAMP';
                $this->menuObj->is_deleted = false;
                break;
            case 'read':
            case 'fetch':
                break;
        }
    }

    public function read($data = null) {

        $this->setSpecificQueryClauses($data);

        $objs = $this->menuObj->read_by_where_clause($this->sanitizedFields);

        //ish
        $this->setDateForHumansAttrib("initiation_date", $objs);

        return $objs;

    }

    public function fetch($data = null) {
        return $this->read($data);
    }

    /**
     * Instantiate the relative-specific menu obj for any controller.
     * For ex, if the request-url is ajax_handler.php?menu=TimelinePost&action=create,
     * then this will be like
     *      $menuObj = new TimelinePost()
     * ...
     * @override
     */
    protected function setMenuObject()
    {
        $this->menuObj = new \App\Model\Notification();
    }

    /** @override */
    protected function setMenu()
    {
        $this->menu = "Notification";
    }

    /** @override */
    public function setAction($value = null)
    {
        $this->action = $value;
    }

    /** @override */
    protected function create() {

        $this->doSpecificAjaxCrudAction();

        $crudAction = $this->action;
        $isCrudOk = $this->menuObj->$crudAction();

        if ($isCrudOk) {
            return $this->menuObj->id;
        }

        return false;
    }

    /** @override */
    protected function update() {

        $this->doSpecificAjaxCrudAction();

        $crudAction = $this->action;
        $isCrudOk = $this->menuObj->$crudAction();

        return $isCrudOk;
    }
}