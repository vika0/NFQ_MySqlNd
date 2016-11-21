<?php
class Database
{
  private $connection;
  public function __construct(){
    $this->connection = new mysqli("127.0.0.1", "root", "root", "Books", 3000);
    if ($this->connection->connect_errno) {
      echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    }
    echo $this->connection->host_info . "\n";
  }
  
  public function getBooks(){
	return $this->connection->query('SELECT * FROM Books');
  }
  
  public function getBook($id){
    return $this->connection->query('SELECT * FROM Books WHERE Books.bookId=' . $id);
  }
}
$database = new Database();
?>
