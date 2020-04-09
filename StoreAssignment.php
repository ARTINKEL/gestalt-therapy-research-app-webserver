<!--<script type="text/javascript" src="ParseJsonToAssignment.js"></script>-->

<?php
$serverName = "localhost";
$username = "root";
$password = "";
$dbName = "gestaltusers";
try{
    $conn = new PDO("mysql:host=$serverName;dbname=$dbName", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
    echo $e->getMessage();
}

//Insert the parsed JSON into the database
$json = file_get_contents("C:\Users\smjon\Documents\questions_demo.txt");
$sql = $conn -> prepare("insert into assignment(Assign) values(:d);");
$sql -> bindValue("d", $json);
$sql -> execute();
?>