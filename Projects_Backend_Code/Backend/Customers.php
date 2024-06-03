<?php
header('Access-Control-Allow-Origin: http://localhost:5174');
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
// Database configuration
$servername = "192.168.30.4";
$username = "root";
$password = "Bv#426G3!";
$dbname = "groep3db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if ID is provided in the query parameters
if(isset($_GET['id'])) {
    // Prepare SQL statement to retrieve data for a specific ID
    $id = $_GET['id'];
    $sql = "SELECT * FROM klanten WHERE ID = $id";
} else {
    // Prepare SQL statement to retrieve all data
    $sql = "SELECT * FROM klanten";
}

// Execute the statement
$result = $conn->query($sql);

// Check if any rows were returned
if ($result->num_rows > 0) {
    // Fetch the results
    $data = array();
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    // Output the results as JSON
    header('Content-Type: application/json');
    echo json_encode($data);
} else {
    echo json_encode(array('message' => 'No results found'));
}

// Close connection
$conn->close();
