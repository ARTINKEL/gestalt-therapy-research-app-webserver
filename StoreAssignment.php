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

$json = file_get_contents("C:\Users\smjon\Documents\Test.json");
$data = json_encode(json_decode($json), JSON_PRETTY_PRINT);
$sql = $conn -> prepare("insert into Assignment(Assign) values(:d);");
$sql -> bindValue("d", $data);
$sql -> execute();
$sql2 = $conn -> prepare("select * from Assignment");
$sql2 -> execute();
$result2 = $sql2 -> fetchAll();
foreach($result2 as $r2){
    echo $r2["ID"] . $r2["Assign"] . "<br>";
}
?>