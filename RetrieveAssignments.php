<?php
 
// Importing DBConfig.php file.
include 'DBConfig.php';
 
// Creating connection.
$con = new mysqli($HostName,$HostUser,$HostPass,$DatabaseName);
 
 // Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

// Getting the received JSON into $json variable.
$json = file_get_contents('php://input');

// decoding the received JSON and store into $obj variable.
$obj = json_decode($json,true);

$id = $obj['userID'];

$sql = "select assignment.Assign from assignment, user where user.id = $id and user.AssignmentData = $id";
$result = mysqli_query($con, $sql);

// Executing SQL Query.
$check = mysqli_fetch_array($result);

if($check != null) {
    echo $check[0];
}
else {
    echo json_encode('Data pull failed');
}

//$resultJson = json_encode($assignmentData);
$con->close();

?>