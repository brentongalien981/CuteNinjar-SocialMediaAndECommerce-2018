<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2018-02-03
 * Time: 18:05
 */

namespace App\Controller;

use App\Core\Main\MainController;

class ProfileController extends MainController implements AjaxCrudHandlerInterface
{
    public function __construct()
    {
        sleep(3);
        parent::__construct();
    }

    /**
     * @return mixed
     */
    public function doSpecificAjaxCrudAction()
    {
        // TODO: Implement doSpecificAjaxCrudAction() method.
    }

    protected function setSpecificQueryClauses()
    {

        switch ($this->action) {
            case 'read':
                $this->sanitizedFields['where_clause'] = "WHERE user_id = {$this->session->currently_viewed_user_id}";
                break;

        }
    }

}