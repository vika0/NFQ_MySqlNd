<?php
include 'Book.php';
?>

<html>
<head>
<title>Knygu sarasas</title>
</head>
<body>
<?php
$Book = new Book();
$id = $_GET['id'];
$Book->loadAll();
echo $Book->getTitle().$Book->getBookId();
?>
</body>
</html>
