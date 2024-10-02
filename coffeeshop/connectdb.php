<?php

    $host = "localhost";
    $user = "root";
    $pass = "";
    $db = "coffeeshopdb";

    $conn = new mysqli($host, $user, $pass, $db);

    if($conn->connect_errno) {
        echo "Error: " . $conn->errno;
        exit;
    }
?>