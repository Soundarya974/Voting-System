<?php

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
        <link rel='stylesheet' href='votes.css'>
        <link rel='stylesheet' href='table.css'>
        <title>Votes Page</title>
    </head>";

echo "<body>";
echo "<h1> Welcome $username !!!</h1>";
echo    "<h1> Votes Details </h1>";
$mysqlQuery = "select votes.voterID, votes.candidateID, votes.electionID, voterlist.firstName, voterlist.middleName, voterlist.lastName, candidateList.symbol from votes join 
    voterList on votes.voterID=voterList.voterID join candidateList on candidateList.candidateId=votes.candidateId";
$result = $conn->query($mysqlQuery);

//select * from candidateList left outer join voterList on candidateList.voterID=voterList.voterId
echo "<table>";
echo "<thead>";
echo "<th  class='voterID'>VoterID</th>";
echo "<th  class='voterName'>Voter Name</th>";
echo "<th  class='candidateSymbol'>Candidate Symbol</th>";
//echo "<th  class='candidateName'> Name</th>";
echo "<th  class='electionID'>ElectionID</th>";

echo "</thead>";

while ($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td>" . $row['voterID'] . "</td>";
    echo "<td>".$row['firstName']." ".$row['middleName']." ".$row['lastName']."</td>";
    echo "<td><img height='10%' width='10%' src=".$row['symbol']." alt=".$row['symbol']."></td>";
    echo "<td>" . $row['electionID'] . "</td>";
    echo "</tr>";
}
echo "</table>";
echo "</html>";
?>


