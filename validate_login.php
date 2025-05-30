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


session_start();

$voterId = $_POST["voterId"];
$password = $_POST["password"];

try {
    $sql = "SELECT * FROM voterList WHERE voterID='$voterId' AND password='$password'";
    $result = $conn->query($sql);
    if($result->num_rows==0){
        throw new InvalidArgumentException();
    }
}catch (InvalidArgumentException $invalidArgumentException){
    die("Wrong Username Password. Please login again");
} catch (Exception $e){
    die("Something went wrong. Please try again after sometime");
}

$_SESSION["voterId"]=$voterId;
?>
