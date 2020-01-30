<?php
 
// Importing DBConfig.php file.
include 'DBConfig.php';
 
// Creating connection.
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
 
 // Check connection
 if ($con->connect_error){
     die("Connection failed: " . $con->connect_error);
 }

 // Getting the received JSON into $json variable.
 $json = file_get_contents('php://input');

 // decoding the received JSON and store into $obj variable.
 $obj = json_decode($json,true);

//$id = $obj['Id'];

$sql = "select assignment.Assign from assignment, user where user.id = 123 and user.AssignmentData = 123";

// Executing SQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$sql));

if($check != null){
	
	echo $check[0]; 

 }
 
 else{
 
 echo("Data pull failed");
 
 }
 $resultJson = json_encode($check);
 mysqli_close($con);

?>