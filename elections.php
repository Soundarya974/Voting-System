<?php

include_once 'validateAdminSession.php';

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


echo "<html lang='en'>
    <head>
        <meta charset='UTF-8'>
        <link rel='stylesheet' href='elections.css'>
        <link rel='stylesheet' href='table.css'>
        <title>Elections Page</title>
        <script>
            function openForm() {
                document.getElementById('createElectionForm').style.display = 'block';
                document.getElementById('mainContent').style.display = 'none';
            }

            function closeForm() {
                document.getElementById('createElectionForm').style.display = 'none';
                document.getElementById('mainContent').style.display = 'block';
            }
        </script>
    </head>";

echo "<body>";
echo "<div id='mainContent'>";
//echo "<h1> Welcome $username !!!</h1>";
echo "<h2>Elections</h2>";

$votersCountQuery = "select * from voterList";
$votersCount = mysqli_num_rows($conn->query($votersCountQuery));

$mysqlQuery = "select * from electionlist";
$result = $conn->query($mysqlQuery);

echo "<table>";
echo "<thead>";
echo "<th  class='electionName'>Election Name</th>";
echo "<th  class='electionStartDate'>Start Date</th>";
echo "<th  class='electionEndDate'>End Date</th>";
echo "<th  class='votingPercentage'>Voting Percentage</th>";
echo "<th  class='endElection'>End Election</th>
  
</>";
echo "</thead>";
while($row = mysqli_fetch_array($result)){
    echo "<tr>";
    echo "<td>".$row["electionName"]."</td>";
    echo "<td>".$row["startDate"]."</td>";
    echo "<td>".$row["enddate"]."</td>";
    $votesCountQuery = "select * from votes where electionId=".$row["electionID"];
    $votesCount = mysqli_num_rows($conn->query($votesCountQuery));
    $percentage=round(100*$votesCount/$votersCount,2);
    echo "<td><a href='votes.php'>".$percentage."</a></td>";
    echo "<td>
        <button type='submit' class='button'>End</button>
        </form>
    <td/>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";


echo "</body>";
echo "</html>";
?>