<?php

include_once 'validateAdminSession.php';

$conn= "";
$servername = "localhost";
$dbname = "voting";
$username = "root";
$password = "2412";


try {
    $conn = mysqli_connect($servername, $username, $password, $dbname);
} catch (Exception $e) {
    die("Connection to the database failed");
}


echo "<html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='admin.css'>
        <link rel='stylesheet' href='table.css'>
        <title>Candidate List Page</title>
    </head>";

echo "<body>";
echo "<h1> Welcome $username !!!</h1>";
echo "<h2>Candidate List</h2>";

$mysqlQuery = "select * from candidateList left outer join voterList on candidateList.voterID=voterList.voterId";
$result = $conn->query($mysqlQuery);

echo "
 <form class= 'addCandidate' action='addCandidate.php' method='post'>
    <button class='button' onclick='openForm()'>Add</button> 
   </form>";
echo "<table>";
echo "<thead>";
echo "<th  class='voter-name'>Name</th>";
echo "<th  class='voter-gender'>Gender</th>";
echo "<th  class='voter-aadhaar'>Aadhaar Number</th>";
echo "<th  class='voter-email'>Email Id</th>";
echo "<th  class='voter-DOB'>DOB</th>";
echo "<th  class='voter-mobileNo'>Mobile Number</th>";
echo "<th  class='candidate-symbol'>Symbol</th>";


echo "</thead>";
while ($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td>".$row['firstName']." ".$row['middleName']." ".$row['lastName']."</td>";
    echo "<td>".$row['gender']."</td>";
    echo "<td>".$row['aadhaarNo']."</td>";
    echo "<td>".$row['emailID']."</td>";
    echo "<td>".$row['dateOfBirth']."</td>";
    echo "<td>".$row['mobileNo']."</td>";
    echo "<td><img height='100%' width='100%' src=".$row['symbol']." alt=".$row['symbol']."></td>";

    echo "</tr>";
}
echo "</table>";

echo "</html>";
?>