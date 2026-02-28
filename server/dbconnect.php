<?php
$conn = new mysqli("localhost", "root", "", "school_db");
if ($conn->connect_error) {
    die(json_encode(['success' => false, 'message' => 'Connection failed']));
}
?>