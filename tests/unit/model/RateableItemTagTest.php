<?php

use PHPUnit\Framework\TestCase;

class RateableItemTagTest extends TestCase
{
    /** @test */
    public function method_staticCreatePseudoObj_eliminates_numeric_indexes_from_a_record()
    {
        $initialRecord = [
            0 => 'value1',
            'field1' => 'value1',
            1 => 'value2',
            'field2' => 'value2'
        ];


        $finalRecord = \App\Model\RateableItemTag::staticCreatePseudoObj($initialRecord);



        $this->assertCount(4, $initialRecord);
        $this->assertCount(2, $finalRecord);
        $this->assertArrayHasKey(0, $initialRecord);
        $this->assertArrayNotHasKey(0, $finalRecord);
    }


    /** @test */
    public function returns_an_array_of_records_that_each_has_a_video_id_field()
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
        //
        $videoRecommendationItemQ = \App\Model\RecommendationItemQueryProducer::getQuery($queryData);

        //
        $videoRecommendationItemRecords = \App\Model\RateableItemTag::readByRawQuery($videoRecommendationItemQ);


        /* Then */
        $this->assertInternalType('array', $videoRecommendationItemRecords);

        foreach ($videoRecommendationItemRecords as $recommendationItemRecord) {
            $this->assertInternalType('array', $recommendationItemRecord);
            $this->assertArrayHasKey("video_id", $recommendationItemRecord);
        }
    }
}
