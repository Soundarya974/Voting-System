<?php
include_once 'validateVoterSession.php';

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
$voterID=$_POST["voterID"];
$electionID=$_POST["electionID"];
$candidateID=$_POST["candidateID"];

$sqlquery= " INSERT INTO votes VALUES ('$voterID','$electionID','$candidateID')";

try {
    $conn->query($sqlquery);
    echo"Voted Successfully!";
} catch (Exception $e){
    die("You have Already Voted");
}

?>