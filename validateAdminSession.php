<?php
session_start();

if (!isset($_SESSION["username"])) {
    header("Location: admin.html"); // Redirect to the admin login page
    exit();
}
?>