<?php
include 'Book.php';
include 'Repository.php';
?>

<html>
<head>
<title>Knyga paga id</title>
</head>
<body>
<?php

$Repository = new Repository();

$id = $_GET['id'];

$Book = new Book();

$Book = $Repository->GetById($id);
//echo 'nuorodoje ivesti: ';
//echo 'http://localhost:8003/DDD/details.php?id=2'; //id = kelinto elemento norim
echo '<br>';
echo $Book->getTitle().$Book->getBookId();
?>
</body>
</html>
