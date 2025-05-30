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
echo "<html lang='en'>";
echo "<link rel='stylesheet' href='addCandidate.css'>";
echo "<link rel='stylesheet' href='table.css'>";
echo "<body>";
echo "<div>";

echo "
<form action='admin.php' method='post'>
    <div class='box'>
        <h1>Add Candidate</h1>

        <div class='textbox'>
        <label for='voterID'>VoterID:</label>
            <input type='text' placeholder='voterID'
                   name='voterID'' value=''>
        </div>

        <div class='textbox'>
            <label for='symbol'>Symbol:</label>
                   <input type='file' id='img' placeholder='voterID' name='img' accept='image/*'>
        </div>

        <input class='button' type='submit' name='login' value='Submit'>
    </div>
</form>";
