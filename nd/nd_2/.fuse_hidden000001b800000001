<?php
$mysqli = new mysqli("127.0.0.1", "root", "root", "Books", 3000);
if ($mysqli->connect_error) {
    echo("Connection failed: " . $mysqli->connect_error);
} 
echo $mysqli->host_info . "\n";

$sql = "select bookId, title, year from Books";
$result = $mysqli->query($sql);

if($result->num_rows > 0){
	while($row = $result->fetch_assoc()){
		echo "<br> bookId ". $row["bookId"]. " - title: ". $row["title"]. " " . $row["year"].  "<br>";
	}
} else{
	echo "0 results";
}
$mysqli->close();
?>

