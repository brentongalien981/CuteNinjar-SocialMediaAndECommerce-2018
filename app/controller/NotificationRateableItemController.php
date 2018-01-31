<?php

namespace App\Controller;

use App\Core\Main\MainController;
use App\Controller\AjaxCrudHandlerInterface;
use App\Model\NotificationRateableItem;
use App\Controller\NotificationController;


class NotificationRateableItemController extends MainController implements AjaxCrudHandlerInterface
{
    public $fieldsAllowedForReturn;
    public $parentNotification;
    public $notificationController;
    private $notificationData;

    private $parentAdditionalData;

    public function __construct()
    {
//        $this->parentNotification = new Notification();
        parent::__construct();
    }


    /** @override */
    protected function setFieldsToBeValidated()
    {

        switch ($this->action) {
            case 'create':

                $this->validator->fieldsToBeValidated['rateable_item_id'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 12,
                    'blank' => 1,
                    'numeric' => 1
                ];

                $this->validator->fieldsToBeValidated['notification_msg_id'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 2,
                    'blank' => 1,
                    'numeric' => 1
                ];

                $this->validator->fieldsToBeValidated['rate_value'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 2,
                    'blank' => 1,
                    'numeric' => 1
                ];

            case 'update':
                break;
            case 'read':
                $this->validator->fieldsToBeValidated['earliestNotificationDate'] = [
                    'required' => 1,
                    'min' => 19,
                    'max' => 20,
                    'blank' => 1
                ];
                break;
            case 'delete':

                $this->validator->fieldsToBeValidated['notificationId'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 14,
                    'blank' => 1,
                    'numeric' => 1
                ];

                break;

            case 'fetch':

                $this->validator->fieldsToBeValidated['latestNotificationRateableItemElDate'] = [
                    'required' => 1,
                    'min' => 19,
                    'max' => 20,
                    'blank' => 1
                ];
                break;

            case 'patch':
                break;
        }
    }

    protected function setSpecificQueryClauses()
    {

        $this->parentAdditionalData['where_clause'] = "AND notification_msg_id = 4";


        switch ($this->action) {
            case 'read':

                // Further modify the query.
                if ($this->sanitizedFields['earliestNotificationDate'] == "0000-00-00 00:00:00") {
                    $this->sanitizedFields['earliestNotificationDate'] = "CURRENT_TIMESTAMP";
                }

                $this->parentAdditionalData['where_clause'] .= " AND initiation_date < '{$this->sanitizedFields['earliestNotificationDate']}'";
                break;

            case 'fetch':

                // Further modify the query.
                if ($this->sanitizedFields['latestNotificationRateableItemElDate'] == "0000-00-00 00:00:00") {
                    $this->sanitizedFields['latestNotificationRateableItemElDate'] = "CURRENT_TIMESTAMP";
                }

                $this->parentAdditionalData['where_clause'] .= " AND initiation_date > '{$this->sanitizedFields['latestNotificationRateableItemElDate']}'";
                break;

        }
    }


    /** @override */
    protected function read()
    {

        // Set the query clauses for reading the pseudo-parent-objs (Notification Objs).
        $notificationController = new \App\Controller\NotificationController();

        //
        $this->setSpecificQueryClauses();

        // Read the pseudo-parent-objs (Notification Objs).
        $parentObjs = $notificationController->read($this->parentAdditionalData);


        // For each pseudo-parent-obj, extend the reading of its attributes
        // by querying with the MainModel class's relationship-methods...
        foreach ($parentObjs as $parentObj) {
            $parentObj->isComposedOf("NotificationRateableItem");
            $parentObj->isCreatedBy("User");
            $parentObj->isComposedOf("Rate");
            $parentObj->isConnectedTo("RateableItem");
            $parentObj->isConnectedTo("TimelinePost");
        }

        // Filter the objs for json return.
        $fieldsAllowedForReturn = \App\Model\NotificationRateableItem::getFieldsAllowedForReturn();
        \App\Core\MainModel::filterFieldsForReturn($parentObjs, $fieldsAllowedForReturn);


        return $parentObjs;

    }

    protected function fetch()
    {

        // Set the query clauses for reading the pseudo-parent-objs (Notification Objs).
        $notificationController = new \App\Controller\NotificationController();

        //
        $this->setSpecificQueryClauses();

        // Read the pseudo-parent-objs (Notification Objs).
        $parentNotificationObjs = $notificationController->fetch($this->parentAdditionalData);


        // For each pseudo-parent-obj, extend the reading of its attributes
        // by querying with the MainModel class's relationship-methods...
        foreach ($parentNotificationObjs as $parentObj) {
            $parentObj->isComposedOf("NotificationRateableItem");
            $parentObj->isCreatedBy("User");
            $parentObj->isComposedOf("Rate");
            $parentObj->isConnectedTo("RateableItem");
            $parentObj->isConnectedTo("TimelinePost");
        }

        // Filter the objs for json return.
        $fieldsAllowedForReturn = \App\Model\NotificationRateableItem::getFieldsAllowedForReturn();
        \App\Core\MainModel::filterFieldsForReturn($parentNotificationObjs, $fieldsAllowedForReturn);


        return $parentNotificationObjs;

    }


    protected function delete()
    {

        // Delete this pseudo-child-obj first (NotificationRateableItemController)
        $isDeletionOk = $this->menuObj->deleteByPk();


        /* Then delete the pseudo-parent-obj (Notification). */
        if ($isDeletionOk) {

            // Get the FK
            $pseudoChildPkName = $this->menuObj->primary_key_id_name;
            $pseudoChildPkValue = $this->menuObj->$pseudoChildPkName;

            // Create the pseudo-parent obj.
            $pseudoParentNotification = new \App\Model\Notification();

            // Assign the PK for the pseudo-parent obj based on the
            // pseudo-child's FK.
            $pseudoParentPkName = $pseudoParentNotification->primary_key_id_name;
            $pseudoParentNotification->$pseudoParentPkName = $pseudoChildPkValue;


            //
            $isDeletionOk = $pseudoParentNotification->deleteByPk();
        }

        return $isDeletionOk;
    }


    /** @implement */
    public function doSpecificAjaxCrudAction()
    {
        switch ($this->action) {
            case 'create':

                //
                $this->menuObj->rateable_item_id = $this->sanitizedFields['rateable_item_id'];
                $this->menuObj->rate_value = $this->sanitizedFields['rate_value'];

                //
                $this->notificationData['notification_msg_id'] = $this->sanitizedFields['notification_msg_id'];


                // For update.
                if ($this->menuObj->doesRecordExist()) {
                    // Change the request action.
                    $this->action = "update";
                    // Recursive call.
                    $this->doSpecificAjaxCrudAction();
                }

                break;

            case 'update':

                $this->menuObj->notification_id = $this->menuObj->getExistingRecordId();
                $this->notificationData['id'] = $this->menuObj->notification_id;
                break;
            case 'read':
            case 'fetch':
                break;

            case 'delete':

                $this->menuObj->notification_id = $this->sanitizedFields["notificationId"];
                break;
        }
    }

    /** @override */
    protected function create()
    {

        // Create the pseudo-parent class first "Notification".
        $this->notificationController = new NotificationController();
        $this->notificationController->setAction($this->action);
        $this->notificationController->overrideSanitizedFields($this->notificationData);
        $notificationId = $this->notificationController->create();
        $isCreationOk = false;


        //ish
        if ($notificationId) {
            $this->menuObj->notification_id = $notificationId;
            $isCreationOk = $this->menuObj->create();
        }


        return $isCreationOk;
    }

    /** @override */
    protected function update()
    {

        // Update the pseudo-parent class first "Notification".
        $this->notificationController = new NotificationController();
        $this->notificationController->setAction($this->action);
        $this->notificationController->overrideSanitizedFields($this->notificationData);
        $isUpdateOk = $this->notificationController->update();


        //
        if ($isUpdateOk) {
            $isUpdateOk = $this->menuObj->update();
        }


        return $isUpdateOk;
    }

}