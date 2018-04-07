<?php

use PHPUnit\Framework\TestCase;

class RecommendationItemQueryProducerTest extends TestCase
{
    /** @test */
    public function returns_valid_query_string_based_on_data()
    {
        /* Given */
        $referenceVideoId = 14;
        $video = \App\Model\Video::readById(['id' => $referenceVideoId])[0];

        $rateableItemId = $video->getRateableItem()->rateable_item_id;
        $rateableItemData = ['id' => $rateableItemId];
        $rateableItem = \App\Model\RateableItem::readById($rateableItemData)[0];
        $arrayOfTags = $rateableItem->getTags();

        $queryData = [
            'itemXTypeId' => $rateableItem->item_x_type_id,
            'tags' => $arrayOfTags,
            'referenceVideoId' => $referenceVideoId
        ];


        /* When */


        /* Then */
        //
        $expectedQuery = "SELECT rateable_item_id, count(*) AS 'count', v.id AS 'video_id', ri.item_x_type_id, v.title";
        $expectedQuery .= " FROM RateableItemsTags rit";
        $expectedQuery .= " INNER JOIN RateableItems ri ON rit.rateable_item_id = ri.id";
        $expectedQuery .= " INNER JOIN Videos v ON ri.item_x_id = v.id";
        $expectedQuery .= " WHERE tag_id IN (1,2,3,12)";
        $expectedQuery .= " AND v.id NOT IN (14)";

        $expectedQuery .= " AND item_x_type_id = 2";
        $expectedQuery .= " GROUP BY rateable_item_id";
        $expectedQuery .= " ORDER BY count DESC";
        $expectedQuery .= " LIMIT 10";

        //
        $actualQuery = \App\Model\RecommendationItemQueryProducer::getQuery($queryData);

        //
        $this->assertEquals($expectedQuery, $actualQuery);
    }


    /** @test */
    public function returns_valid_query_string_that_reads_zero_records_even_an_invalid_argument_is_passed_in()
    {
        $queryData = [
            'itemXTypeId' => 5,
            'cats',
            'dogs' => 'bambi'
        ];


        $expectedQuery = "SELECT * FROM RateableItemsTags LIMIT 0";

        //
        $actualQuery = \App\Model\RecommendationItemQueryProducer::getQuery($queryData);

        //
        $this->assertEquals($expectedQuery, $actualQuery);
    }
}