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
//        sleep(3);
        parent::__construct();
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
                break;
            case 'read':

                //
                $this->validator->fieldsToBeValidated['for_section'] = [
                    'required' => 1,
                    'min' => 7,
                    'max' => 18,
                    'blank' => 1
                ];

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

    protected function setSpecificQueryClauses()
    {

        switch ($this->action) {
            case 'read':

                $this->sanitizedFields['where_clause'] = "WHERE user_id = {$this->session->currently_viewed_user_id}";


//                switch ($this->sanitizedFields['for_section']) {
//                    case 'contactInformation':
//
//                        $this->sanitizedFields['where_clause'] .= " AND user_id = {$this->session->currently_viewed_user_id}";
//                        break;
//
//                }

                break;

        }
    }

    /** @override */
    protected function read()
    {

        $profiles = parent::read();


        //
        if ($this->sanitizedFields['for_section'] == "summary") { return $profiles; }


        /*
         * Connect the profile obj with its related address obj.
         */
        foreach ($profiles as $userProfile) {

            /* Get the primary address for the profile. */
            $userAddress = $userProfile->getAddress();
            $userAccount = $userProfile->getUserAccount();


            /* Filter the extentional objs. */
            $userAddress->filterExclude(['user_id']);
            $userAccount->filterInclude(['user_name']);


            /* Replace some obj's field name to avoid confusion. */
            $userAddress->replaceFieldNamesForAjax(['id' => 'address_id']);


            /*
             * Decide the mainly-referenced-obj (Notification),
             * and combine it with all the necessary obs.
             */
            $userProfile->combineWithObj($userAddress);
            $userProfile->combineWithObj($userAccount);
        }



        /* Remove all the static fields of the newly morphed profile obj. */
        foreach ($profiles as $userProfile) {
            $userProfile->removeStaticFields();
        }

        //
        return $profiles;
    }

}