<?php

use PHPUnit\Framework\TestCase;

class CommentTest extends TestCase
{
    /** @test */
    public function returns_shit()
    {
        $comment = new \App\Model\Comment();

        $this->assertEquals('shit', $comment->getShit());
    }
}
