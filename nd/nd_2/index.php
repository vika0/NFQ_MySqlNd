<?php
include 'database.php';
?>

<html>
<head>
<title>Book list</title>
</head>
<body>
<?php
if(isset($_GET['bookId'])){
	$res = $database->getBook($_GET['bookId']);
	echo "<a href=\"/\">Back</a>";
} else { 
	$res = $database->getBooks();
}
$res->data_seek(0);
echo "<table>";
echo "<th>bookId</th><th>authorId</th><th>title</th><th>year</th><th>genreId</th>";
if(!isset($_GET['bookId'])){
	echo "<th>action</th>";
} 
while ($row = $res->fetch_assoc()) {
	echo "<tr>";
	echo "<td>" . $row['bookId'] . "</td>";	
	echo "<td>" . $row['authorId'] . "</td>";	
	echo "<td>" . $row['title'] . "</td>";	
	echo "<td>" . $row['year'] . "</td>";	
	echo "<td>" . $row['genreId'] . "</td>";
	if(!isset($_GET['bookId'])){	
		echo "<td><form><input type=\"hidden\" name=\"bookId\" value=" . $row['bookId'] ."><input type=\"submit\" value=\"Submit\"></form></td>";
	}	
	echo "</tr>";
}
echo "</table>";
if(isset($_GET['bookId'])){
	echo "<a href=\"/\">Back</a>";
} 
?>
</body>
</html>
