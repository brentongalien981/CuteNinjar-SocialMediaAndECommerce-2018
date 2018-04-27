<?php

use PHPUnit\Framework\TestCase;

class CategoryTest extends TestCase
{
    /** @test */
    public function method_readByWhereClause_returns_at_most_x_category_objs()
    {
        /* Given */
        $readData = [
            'orderByFields' => 'name',
            'orderArrangement' => 'ASC',
            'limit' => 2
        ];


        /* When */
        $categories = \App\Model\Category::readByWhereClause($readData);
        $maxNumOfReadObjs = 2;


        /* Then */
        $this->assertInternalType('array', $categories);
        $this->assertCount($maxNumOfReadObjs, $categories);

        foreach ($categories as $category) {
            $this->assertInstanceOf(\App\Model\Category::class, $category);
        }
    }


    /** @test */
    public function returned_category_objs_have_name_attributes() {

        /* Given */


        /* When */
        $categories = \App\Model\Category::readStatic();


        /* Then */
//        $this->assertTrue(count($categories) > 0);
        foreach ($categories as $category) {
            $this->assertInstanceOf(\App\Model\Category::class, $category);
            $this->assertObjectHasAttribute('name', $category);
        }
    }


    /** @test */
    public function does_not_return_categories_with_category_ids_that_have_already_been_read()
    {

        /**/
        $categoryIdsThatAlreadyBeenRead = [1, 2, 3];

        $dataForProducingReadQuery = [
            'earliest_el_date' => '0000-00-00 00:00:00',
            'limit' => 5,
            'stringifiedIdsOfAlreadyBeenReadCategories' => "1,2,3,"
        ];


        /**/
        $readQuery = \App\Model\CategoryQueryProducer::getReadQuery($dataForProducingReadQuery);

        $instantiateObjsToBeRead = true;
        $categories = \App\Model\Category::readByRawQuery($readQuery, $instantiateObjsToBeRead);



        /**/
        foreach ($categories as $category) {
            $this->assertFalse(in_array($category->id, $categoryIdsThatAlreadyBeenRead));

        }
    }
}
