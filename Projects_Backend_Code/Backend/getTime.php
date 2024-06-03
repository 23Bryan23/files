<?php

// Set header to allow requests from localhost:5173 and 5174
$allowedOrigins = array('http://localhost:5173', 'http://localhost:5174');
$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
if (in_array($origin, $allowedOrigins)) {
    header('Access-Control-Allow-Origin: ' . $origin);
} else {
    header('Access-Control-Allow-Origin: http://localhost'); // Change to 'null' for production
}

header('Content-Type: application/json');

// Database connection details (replace with your actual details)
$host = '192.168.30.4';
$username = 'root';
$password = 'Bv#426G3!';
$dbname = 'backend';

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die('Connection error: ' . mysqli_connect_error());
}

// SQL query to fetch all data from the timeinformation table
$sql = "SELECT * FROM timeinformation";
$result = mysqli_query($conn, $sql);

// Check if query was successful
if (!$result) {
    die('Query error: ' . mysqli_error($conn));
}

// Initialize empty array to store data
$data = array();

// Loop through each row in the result set and add data to the array
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

// Encode data as JSON and print the response
echo json_encode($data);

// Close database connection
mysqli_close($conn);

