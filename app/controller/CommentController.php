<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2018-03-27
 * Time: 23:59
 */

namespace App\Controller;

use App\Core\Main\MainController;

class CommentController extends MainController implements AjaxCrudHandlerInterface
{
    public function __construct($menu = null, $action = null)
    {
//        sleep(1);
        parent::__construct($menu, $action);

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
                break;

            case 'read':

                $this->validator->fieldsToBeValidated['rateable_item_id'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 12,
                    'blank' => 1,
                    'numeric' => 1
                ];

                $this->validator->fieldsToBeValidated['earliest_el_date'] = [
                    'required' => 1,
                    'min' => 19,
                    'max' => 20,
                    'blank' => 1
                ];

                break;

            case 'update':
            case 'delete':
            case 'patch':
            case 'fetch':
            case 'index':
            case 'show':
                break;
        }
    }

    /** @override */
    protected function read()
    {
        // Find main-objs.
        $data = [
            'rateable_item_id' => $this->sanitizedFields['rateable_item_id'],
            'created_at' => [
                'comparisonOperator' => '<',
                'value' => $this->sanitizedFields['earliest_el_date']
            ]
        ];

        $comments = \App\Model\Comment::readByWhereClause($data);



        foreach ($comments as $comment) {

            // Find extentional-objs.
            $commentPosterUser = $comment->getPosterUser();
            $posterUserProfile = $commentPosterUser->getProfile();


            // Filter
            $comment->filterExclude();
            $commentPosterUser->filterInclude(['user_name']);
            $posterUserProfile->filterInclude(['pic_url']);

            // Refine

            // Combine
            $comment->commentPosterUser = $commentPosterUser;
            $comment->posterUserProfile = $posterUserProfile;

            /* Add a carbon-date field to the obj. */
            $rawDateTimeFieldName = "created_at";
            $comment->addReadableDateField($rawDateTimeFieldName);
        }


        //
        return $comments;

    }
}