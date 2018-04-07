<?php

use PHPUnit\Framework\TestCase;

class RateableItemTest extends TestCase
{
    /** @test */
    public function returns_an_array_of_tag_objects()
    {
        /* Given */
        $rateableItemId = 14;
        $rateableItemData = ['id' => $rateableItemId];
        $rateableItem = \App\Model\RateableItem::readById($rateableItemData)[0];


        /* When */
        $arrayOfTags = $rateableItem->getTags();


        /* Then */
        //
        $this->assertInternalType('array', $arrayOfTags);

        //
        foreach ($arrayOfTags as $tag) {

            $this->assertInstanceOf(\App\Model\Tag::class, $tag);
        }

    }


    /** @test */
    public function returns_an_empty_array_when_reading_with_an_invalid_id()
    {
        /* Given */
        $rateableItemId = 417;
        $rateableItemData = ['id' => $rateableItemId];


        /* When */
        $rateableItems = \App\Model\RateableItem::readById($rateableItemData);


        /* Then */
        //
        $this->assertInternalType('array', $rateableItems);
        $this->assertCount(0, $rateableItems);
        $this->assertEquals([], $rateableItems);
        $this->assertNotEquals(null, $rateableItems);
    }
}
