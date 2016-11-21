<?php
include 'Book.php';
include 'Repository.php';
?>

<html>
<head>
<title>Knygu sarasas</title>
</head>
<body>
<?php
    $Repository = new Repository();
    $Book = new Book();
    $Book = $Repository->GetAll();
    echo "<tr>";
    foreach ($Books as $elem) {
        echo "<td>" . $row['title'] . "</td>";
        echo "<td>" . $row['author'] . "</td>";
    }
    echo '</tr>';
?>
</body>
</html>
