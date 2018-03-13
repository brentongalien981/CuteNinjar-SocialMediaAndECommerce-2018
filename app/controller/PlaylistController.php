<?php
/**
 * Created by PhpStorm.
 * User: ops
 * Date: 2018-03-13
 * Time: 00:17
 */

namespace App\Controller;

use App\Core\Main\MainController;

class PlaylistController extends MainController implements AjaxCrudHandlerInterface
{
    public function __construct($menu = null, $action = null)
    {
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

                break;

            case 'update':

            case 'delete':

            case 'patch':
            case 'fetch':
            case 'index':
                break;

            case 'show':
                //
                $this->validator->fieldsToBeValidated['video_id'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 12,
                    'blank' => 1,
                    'numeric' => 1
                ];

                $this->validator->fieldsToBeValidated['playlist_id'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 12,
                    'blank' => 1,
                    'numeric' => 1
                ];

                $this->validator->fieldsToBeValidated['read_video_for_what'] = [
                    'required' => 1,
                    'min' => 1,
                    'max' => 12,
                    'blank' => 1,
                    'numeric' => 1
                ];

                break;
        }
    }

    /** @override */
    protected function show()
    {
        /* Check if that playlist-id contains that video-id. */
        $playlistId = $this->sanitizedFields['playlist_id'];
        $videoId = $this->sanitizedFields['video_id'];
        $playlist = null;

        if (\App\Model\Playlist::doesContainVideo($playlistId, $videoId)) {

            // Find
            $data = ['id' => $playlistId];
            $playlist = \App\Model\Playlist::readById($data)[0];

            $playlistVideos = $playlist->getVideos();

            // Filter
            $playlist->filterExclude();

            // Refine
            $playlist->replaceFieldNamesForAjax(['id' => 'playlist_id']);

            // Combine
            $playlist->videos = $playlistVideos;
        }

        //
        return $playlist;
    }

    /** @override */
    protected function doRequestFinalization($isCrudOk)
    {

        switch ($this->action) {
            case 'show':
                $isCrudOk ? $this->json['actual_user_id'] = $this->session->actual_user_id : null;
                break;
        }


        //
        parent::doRequestFinalization($isCrudOk);
    }
}