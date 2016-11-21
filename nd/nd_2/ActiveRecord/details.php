<?php
include 'Book.php';
?>

<html>
<head>
<title>Knyga pagal id</title>
</head>
<body>
<?php
$Book = new Book();
$id = $_GET['id'];
$Book->loadById($id);;
echo $Book->getTitle().$Book->getBookId();
?>
</body>
</html>
