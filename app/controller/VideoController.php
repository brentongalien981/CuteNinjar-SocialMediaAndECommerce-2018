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

    /** @override */
    protected function read()
    {

        $videos = parent::read();

        /**/
        foreach ($videos as $video) {

            // Find the extentional obj.
            $posterUser = $video->getPosterUser();

            // Filter the main obj.

            // Refine the main obj.

            // Combine the extentional and main obj.
            $video->combineWithObj($posterUser);
        }



        /*
    Remove all the static fields of the newly morphed profile obj.
    NOTE that I do this removing of static fields in another loop and not also in
    the previous loop because doing so in the previous loop would remove the static
    vars of each userProfile obj. As a result, there would be a problem when subsequent
    lines of codes uses the static vars, like calling static::class_name will no longer
    give a value of "Profile", but a MainController default value of "DEFAULT_CLASS_NAME".
*/
        foreach ($videos as $video) {
            $video->removeStaticFields();
        }

        //
        return $videos;

    }
}