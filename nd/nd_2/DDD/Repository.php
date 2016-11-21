<?php

/**
 * Created by PhpStorm.
 * User: vika
 * Date: 16.11.15
 * Time: 18.35
 */
class Repository
{

    function GetById($id){

        $connection = new mysqli("127.0.0.1", "root", "root", "Books", 3000);
        if ($connection->connect_errno) {
            echo "Failed to connect to MySQL: (" . $connection->connect_errno . ") " . $connection->connect_error;
        }
        //echo $connection->host_info . "\n";

        $rezUzklaus = $connection->query('SELECT * FROM Books WHERE Books.bookId='.$id);

        $rez = $rezUzklaus -> fetch_assoc();


        $Book = new Book();

        $Book->setBookId($rez['bookId']);
        $Book->setAuthorId($rez['authorId']);
        $Book->setTitle($rez['title']);
        $Book->getYear($rez['year']);
        $Book->getAuthor($rez['author']);
        $Book->getGendre($rez['gendre']);
        $Book->getMoreAuthors($rez['MoreAuthors']);

        return $Book;
    }
    function  GetAll(){
        $connection = new mysqli("127.0.0.1", "root", "root", "Books", 3000);
        if ($connection->connect_errno) {
            echo "Failed to connect to MySQL: (" . $connection->connect_errno . ") " . $connection->connect_error;
        }
        $query = "SELECT bookId, title FROM Books";
        $result = mysqli_query($this->connection, $query);
        $num = mysqli_num_rows($result);
        $books = [];
        for($i = 1; $i <= $num; $i++) {
            $row = mysqli_fetch_row($result);
            $book = new Book();
            $book->setTitle($row[0]);
            $book->setAuthor($row[1]);
            $books[] = $book;
        }
        return $books;
    }
}