<?php
 
// Importing DBConfig.php file.
include 'DBConfig.php';

// Creating connection.
 $con = new mysqli($HostName,$HostUser,$HostPass,$DatabaseName);
 
 // Check connection
 if ($con->connect_error){
     die("Connection failed: " . $con->connect_error);
 }

 // Getting the received JSON into $json variable.
 $json = file_get_contents('php://input');

 // decoding the received JSON and store into $obj variable.
 $obj = json_decode($json,true);

// Populate User email from JSON $obj array and store into $email.
$id = $obj['id'];
//$id = '123';

// Populate Password from JSON $obj array and store into $password.
$password = $obj['password'];
//$password = '123';

//Applying User Login query with email and password match.
$Sql_Query = "select Admin from user where id = '$id' and password = '$password' ";

// Executing SQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$Sql_Query));
$result = $con->query($Sql_Query);

if(isset($check)){
 
 while($row = $result->fetch_assoc()) {
     $admin = $row['Admin'];
 }

 $DataArray = array('response' => 'data_matched', 'admin' => $admin);

 //$SuccessLoginMsg = 'Data Matched';
 
 // Converting the message into JSON format.
 $SuccessLoginJson = json_encode($DataArray);
 
// Echo the message.
 echo $SuccessLoginJson ; 

 }
 
 else {
 
 // If the record inserted successfully then show the message.
$InvalidMSG = 'Invalid Username or Password Please Try Again' ;
 
// Converting the message into JSON format.
$InvalidMSGJSon = json_encode($InvalidMSG);
 
// Echo the message.
 echo $InvalidMSGJSon ;
 
 }
 
 $con->close();

?>