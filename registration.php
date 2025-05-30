<?php
$conn = "";
$servername = "localhost";
$dbname = "voting";
$username = "root";
$password = "2412";

try {
    $conn = mysqli_connect($servername, $username, $password, $dbname);
} catch (Exception $e) {
    die("Connection to the database failed");
}

$firstName =$_POST["first"];
$middleName =$_POST["middle"];
$lastName =$_POST["last"];
$dateOfBirth = $_POST["dateOfBirth"];
$email =$_POST["email"];
$password =$_POST["password"];
$confirmPassword =$_POST["repassword"];
$mobileNo =$_POST["mobileNo"];
$aadhaarNo =$_POST["aadhaarNo"];
$gender =$_POST["gender"];

$sqlquery = "INSERT INTO registration VALUES('$firstName','$middleName','$lastName','$dateOfBirth','$email','$password','$mobileNo','$aadhaarNo','$gender')";

if ($conn->query($sqlquery) == TRUE) {
    echo "record inserted successfully";
} else {
    echo "Error: " . $sqlquery . "<br>" . $conn->error;
}

