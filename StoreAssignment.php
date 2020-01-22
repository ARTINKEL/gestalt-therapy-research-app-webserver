<?php
$serverName = "localhost";
$username = "root";
$password = "";
$dbName = "GestaltUsers";
try{
    $conn = new PDO("mysql:host=$serverName;dbname=$dbName", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
    echo $e->getMessage();
}

//read the JSON file
$json = file_get_contents("C:\Users\smjon\Documents\Test.json");
$sql = $conn -> prepare("insert into Assignment(Assign) values(:d);");
$sql -> bindValue("d", $data);
$sql -> execute();
?>