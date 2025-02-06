<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Database Connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "outpass1";

$action = isset($_POST["action"]) ? $_POST["action"] : "";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ("GET_ALL" == $action) {
    $db_data = array();
    $sql = "SELECT id, name, admno FROM outpasstb";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $db_data[] = $row;
        }
        echo json_encode($db_data);
    } else {
        echo json_encode(array("error" => "No data found"));
    }
} else {
    echo json_encode(array("error" => "Invalid action"));
}

$conn->close();
?>
