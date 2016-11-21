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
$Book->loadAll();
echo $Book->getTitle().$Book->getAuthor();
?>
</body>
</html>
