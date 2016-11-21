<?php

/**
 * Created by PhpStorm.
 * User: vika
 * Date: 16.11.15
 * Time: 18.33
 */
class Book
{
    private $bookId;
    private $authorId;
    private $title;
    private $year;
    private $author;
    private $gendre;
    private $MoreAuthors;

    /**
     * @return mixed
     */
    public function getBookId()
    {
        return $this->bookId;
    }

    /**
     * @param mixed $bookId
     */
    public function setBookId($bookId)
    {
        $this->bookId = $bookId;
    }

    /**
     * @return mixed
     */
    public function getAuthorId()
    {
        return $this->authorId;
    }

    /**
     * @param mixed $authorId
     */
    public function setAuthorId($authorId)
    {
        $this->authorId = $authorId;
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param mixed $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * @return mixed
     */
    public function getYear()
    {
        return $this->year;
    }

    /**
     * @param mixed $year
     */
    public function setYear($year)
    {
        $this->year = $year;
    }

    /**
     * @return mixed
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * @param mixed $author
     */
    public function setAuthor($author)
    {
        $this->author = $author;
    }

    /**
     * @return mixed
     */
    public function getGendre()
    {
        return $this->gendre;
    }

    /**
     * @param mixed $gendre
     */
    public function setGendre($gendre)
    {
        $this->gendre = $gendre;
    }

    /**
     * @return mixed
     */
    public function getMoreAuthors()
    {
        return $this->MoreAuthors;
    }

    /**
     * @param mixed $MoreAuthors
     */
    public function setMoreAuthors($MoreAuthors)
    {
        $this->MoreAuthors = $MoreAuthors;
    }
}