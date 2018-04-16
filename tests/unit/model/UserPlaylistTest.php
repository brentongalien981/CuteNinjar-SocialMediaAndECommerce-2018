<?php

use PHPUnit\Framework\TestCase;

class UserPlaylistTest extends TestCase
{
    /** @test */
    public function reads_an_array_of_user_playlist_objs()
    {
        /* Given */
        $currentlyViewedUserId = 8;
        $readData = [
            'user_id' => $currentlyViewedUserId
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
        $this->assertInternalType('array', $userPlaylists);

        foreach ($userPlaylists as $userPlaylist) {
            $this->assertInstanceOf(\App\Model\UserPlaylist::class, $userPlaylist);
        }
    }


    /** @test */
    public function reads_by_where_clause_an_array_of_user_playlist_objs()
    {
        /* Given */
        $currentlyViewedUserId = 8;
        $earliest_el_date = "0000-00-00 00:00:00";

        $readData = [
            'user_id' => $currentlyViewedUserId,
            'created_at' => [
                'comparisonOperator' => '<',
                'value' => $earliest_el_date
            ],
            'orderByFields' => 'created_at'
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
        $this->assertInternalType('array', $userPlaylists);

        foreach ($userPlaylists as $userPlaylist) {
            $this->assertInstanceOf(\App\Model\UserPlaylist::class, $userPlaylist);
        }
    }


    /** @test */
    public function read_a_playlist_obj_based_on_the_playlist_id_of_user_playlist()
    {
        /* Given */
        $currentlyViewedUserId = 8;
        $readData = [
            'user_id' => $currentlyViewedUserId
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
        foreach ($userPlaylists as $userPlaylist) {

            $playlist = \App\Model\Playlist::readById(['id' => $userPlaylist->playlist_id])[0];

            $this->assertInstanceOf(\App\Model\Playlist::class, $playlist);
        }
    }


    /** @test */
    public function playlist_obj_filter_includes_only_its_title_property()
    {
        /* Given */
        $currentlyViewedUserId = 8;
        $readData = [
            'user_id' => $currentlyViewedUserId
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
        foreach ($userPlaylists as $userPlaylist) {

            $playlist = \App\Model\Playlist::readById(['id' => $userPlaylist->playlist_id])[0];

            $playlist->filterInclude(['title']);


            $this->assertObjectHasAttribute('title', $playlist);
            $this->assertFalse(isset($playlist->description));
            $this->assertTrue(isset($playlist->title));

        }
    }


    /** @test */
    public function user_playlist_obj_has_property_playlist()
    {
        /* Given */
        $currentlyViewedUserId = 8;
        $readData = [
            'user_id' => $currentlyViewedUserId
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
        foreach ($userPlaylists as $userPlaylist) {

            $playlist = \App\Model\Playlist::readById(['id' => $userPlaylist->playlist_id])[0];

            $userPlaylist->playlist = $playlist;
        }

        foreach ($userPlaylists as $userPlaylist) {
            $this->assertObjectHasAttribute('playlist', $userPlaylist);
            $this->assertInstanceOf(\App\Model\Playlist::class, $userPlaylist->playlist);
            $this->assertTrue(isset($userPlaylist->playlist->title));
        }
    }


    /** @test */
    public function filter_exclude_user_playlist_obj() {

        /* Given */
        $currentlyViewedUserId = 8;
        $readData = [
            'user_id' => $currentlyViewedUserId
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
        foreach ($userPlaylists as $userPlaylist) {

            $userPlaylist->filterExclude(['user_id', 'updated_at']);

            $this->assertFalse(isset($userPlaylist->user_id));
            $this->assertFalse(isset($userPlaylist->updated_at));
            $this->assertTrue(isset($userPlaylist->playlist_id));
        }
    }


    /** @test */
    public function unset_a_private_user_playlist_from_the_read_user_playlist_arrays()
    {
        /* Given */
        $actualUserId = 8;
        $currentlyViewedUserId = 8;
        $readData = [
            'user_id' => $currentlyViewedUserId
        ];


        /* When */
        $userPlaylists = \App\Model\UserPlaylist::readByWhereClause($readData);


        /* Then */
//        echo "userPlaylist count before: " . count($userPlaylists) . "<br>";



        foreach ($userPlaylists as $userPlaylist) {
            $userPlaylist->filterExclude();
        }
//        var_dump($userPlaylists);


        for ($i = 0; $i < count($userPlaylists); $i++) {

            $userPlaylist = $userPlaylists[$i];

            $playlist = \App\Model\Playlist::readById(['id' => $userPlaylist->playlist_id])[0];

            if ($playlist->isGuardedForPrivacy()) {
                unset($userPlaylists[$i]);
                continue;
            }

            $userPlaylist->playlist = $playlist;
        }

        $this->assertCount(2, $userPlaylists);

//        var_dump($userPlaylists);
//        echo "userPlaylist count after: " . count($userPlaylists);
    }


//    /** @test */
//    public function method_isGuarded()
//    {
//
//    }
}
