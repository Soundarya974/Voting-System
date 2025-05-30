<?php
session_start();
if(!isset($_SESSION["voterId"])){
    header("Location: voter.html");
    exit();
}
?>
