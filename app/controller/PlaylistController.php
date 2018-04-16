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
                if (!isset($_GET['read_video_for_what'])) { return; }

                //
                if ($_GET['read_video_for_what'] == \App\Model\Playlist::READ_VIDEO_FOR_VIDEO_PLAYLIST_PLUG_IN) {

                    $this->validator->fieldsToBeValidated['video_id'] = [
                        'required' => 1,
                        'min' => 1,
                        'max' => 12,
                        'blank' => 1,
                        'numeric' => 1
                    ];
                }


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

                $this->validator->fieldsToBeValidated['earliest_el_date'] = [
                    'required' => 1,
                    'min' => 19,
                    'max' => 20,
                    'blank' => 1
                ];

                break;
        }
    }

    /** @override */
    protected function show()
    {
        //
        if (!isset($_GET['read_video_for_what'])) { return null; }

        //
        $isRequestForPlugIn = ($_GET['read_video_for_what'] == \App\Model\Playlist::READ_VIDEO_FOR_VIDEO_PLAYLIST_PLUG_IN) ? true : false;
        $playlist = null;
        $playlistId = $this->sanitizedFields['playlist_id'];


        /**/
        $isOkToProceed = true;
        if ($isRequestForPlugIn) {

            $videoId = $this->sanitizedFields['video_id'];

            // Check if that playlist-id contains that video-id.
            if (!\App\Model\Playlist::doesContainVideo($playlistId, $videoId)) {
                $isOkToProceed = false;
            }
        }


        /**/
        if ($isOkToProceed) {

            // Find
            $data = ['id' => $playlistId];
            $playlist = \App\Model\Playlist::readById($data)[0];

            $dataForPivotTable = [
                'created_at' => [
                    'comparisonOperator' => '<',
                    'value' => $this->sanitizedFields['earliest_el_date']
                ],
                'orderByFields' => 'created_at',
                'includedPivotFields' => [
                    [
                        'fieldName' => 'created_at',
                        'toBeNamed' => 'dateAddedToPlaylist'
                    ]
                ]
            ];

            $playlistVideos = $playlist->getVideos($dataForPivotTable);

            // Filter
            $playlist->filterExclude();

            // Refine
            $playlist->replaceFieldNamesForAjax(['id' => 'playlist_id']);

            // Combine
            $playlist->videos = $playlistVideos;
        }

        //
        if (count($playlist->videos) == 0) { $playlist = null; }
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