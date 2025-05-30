<?php
include_once('validate_login.php');

$row = $result->fetch_assoc();

echo "<html lang='en'>";
echo "<link rel='stylesheet' href='voter.css'>";
echo "<link rel='stylesheet' href='table.css'>";
echo "<body>";
echo "<div>";
$voterId = $row["voterID"];
echo "<h1>Welcome $row[firstName] $row[middleName] $row[lastName] !!!</h1>";

//$sql = "SELECT * FROM candidateList where electionId=(SELECT electionID from electionList WHERE isActive=true)";
$sql = "select * from candidateList left outer join voterList on candidateList.voterID=voterList.voterId where electionId=(SELECT electionID from electionList WHERE isActive=true)";

$result = $conn->query($sql);
if($result->num_rows==0){
    throw new Exception("No active Election or Candidates.");
}
echo "<table>";
echo "<thead>";
echo "<th class='candidateID'>CandidateID</th>";
echo "<th class='candidate-name'>CandidateName</th>";
echo "<th class='symbol'>Symbol</th>";
echo "<th>Voting Button</th>";
echo "</thead>";
while ($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td style='width: 10%'>".$row['candidateID']."</td>";
    echo "<td>".$row['firstName']." ".$row['middleName']." ".$row['lastName']."</td>";
//    echo "<td style='width: 40%'>".$row['candidateName']."</td>";
    echo "<td><img height='10%' width='10%' src=".$row['symbol']." alt=".$row['symbol']."></td>";
    echo "<td>
        <form action='voted.php' method='post'>
        <input type='number' hidden='hidden' name='candidateID' value=".$row['candidateID'].">
        <input type='number' hidden='hidden' name='electionID' value=".$row['electionID'].">
        <input type='text' hidden='hidden' name='voterID' value=".$voterId.">
        <button type='submit' class='button'>Vote</button>
        </form>
    <td/>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";
echo "</body>";
echo "</html>"

?>
