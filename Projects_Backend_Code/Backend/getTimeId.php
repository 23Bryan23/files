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

// Check if an 'id' parameter is present in the URL
$userId = isset($_GET['id']) ? (int)$_GET['id'] : null; // Cast to integer for security

// Build the SQL query based on the presence of the 'id' parameter
$sql = "SELECT * FROM timeinformation";
if ($userId !== null) {
    $sql .= " WHERE memberId = $userId";
}

$result = mysqli_query($conn, $sql);

// Check if query was successful
if (!$result) {
    die('Query error: ' . mysqli_error($conn));
}

// Initialize an empty array to store data
$data = array();

// Check if any results were found
if (mysqli_num_rows($result) > 0) {
    // Loop through each row and add data to the array
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
} else {
    // If no user found with the provided ID, set an empty array or error message
    $data = array(); // or  $data = array('error' => 'User not found');
}

// Encode data as JSON and print the response
echo json_encode($data);

// Close database connection
mysqli_close($conn);


