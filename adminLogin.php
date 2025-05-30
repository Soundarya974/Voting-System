<?php
session_start();

$conn = "";
$servername = "localhost";
$dbname = "voting";
$username = $_POST["username"];
$password = $_POST["password"];

try {
    $conn = mysqli_connect($servername, $username, $password, $dbname);
}catch (Exception $e){
    die("Connection failed: wrong username password");
}
$_SESSION["username"] = $username; // Store username in the session
?>
