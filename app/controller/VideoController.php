<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2018-02-18
 * Time: 03:33
 */

namespace App\Controller;

use App\Core\Main\MainController;

class VideoController extends MainController implements AjaxCrudHandlerInterface
{
    public function __construct($menu = null, $action = null)
    {
        parent::__construct($menu, $action);

        //
        $this->checkIsRequestShow();

    }

    protected function checkIsRequestShow()
    {
        //
        if (isset($_GET['id'])) {
            $this->setAction('show');
        }
    }

    protected function setSpecificQueryClauses()
    {

        switch ($this->action) {
            case 'read':

//                $this->sanitizedFields['where_clause'] = "WHERE created_at < '{$this->sanitizedFields['earliestElDate']}'";
                $this->sanitizedFields['where_clause'] = "WHERE private = 0";

                if (strlen($this->sanitizedFields['displayedVideoIds']) != 0) {
                    $this->sanitizedFields['where_clause'] .= " AND id NOT IN(" . $this->sanitizedFields['displayedVideoIds'] . ")";
                }


                $this->sanitizedFields['order_by_field'] = "created_at";
                $this->sanitizedFields['limit'] = 6;

                break;

        }
    }

    /**
     * @return mixed
     */
    public function doSpecificAjaxCrudAction()
    {
        // TODO: Implement doSpecificAjaxCrudAction() method.
    }


    /** @override */
    protected function setFieldsToBeValidated()
    {

        switch ($this->action) {
            case 'create':

            case 'update':

            case 'delete':

            case 'patch':
            case 'fetch':
            case 'index':
                break;
            case 'read':

                $this->validator->fieldsToBeValidated['displayedVideoIds'] = [
                    'min' => 0,
                    'max' => 320,
                    'areNumeric' => 1
                ];

                break;
            case 'show':
                //
                $this->validator->fieldsToBeValidated['id'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 12,
                    'blank' => 1
                ];

                break;
        }
    }


    /** @override */
    protected function show()
    {

        require_once(PUBLIC_PATH . "video/show.php");
    }

    /** @override */
    public function index()
    {

        require_once(PUBLIC_PATH . "video/read.php");
    }
}