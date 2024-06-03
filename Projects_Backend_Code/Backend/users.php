<?php

// Access-Control-Allow-Origin (consider specific origin or use wildcards with caution)
header('Access-Control-Allow-Origin: http://localhost:5174');
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type'); // Adjust origin as needed
// Database connection details (replace with placeholders)
$servername = "192.168.30.4";
$username = "root"; // Use environment variable for username
$password = "Bv#426G3!"; // Use environment variable for password
$dbname = "backend";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Access the ID from the URL (check both query string and path info)
$id = isset($_GET['id']) ? $_GET['id'] : (isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : null);

// Validate and sanitize the ID (optional but recommended)
$id = intval($id); // Convert to integer for security

// Build the SQL query with prepared statement placeholder
$sql = ($id) ? "SELECT * FROM personalinformation WHERE authid = ?" : "SELECT * FROM personalinformation";

// Prepare the statement
$stmt = $conn->prepare($sql);

if ($id) {
    $stmt->bind_param("i", $id); // Bind integer parameter for ID (if provided)
}

// Execute the statement
$stmt->execute();

// Get the result (if using prepared statement)
$result = $stmt->get_result(); // Use for prepared statements

// Check if query was successful
if ($result->num_rows > 0) {
    $data = array();

    // Loop through each row and add it to the data array
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    // Encode the data array to JSON format
    $json_data = json_encode($data);

    // Output the JSON data
    echo $json_data;
} else {
    // No data found (either no ID provided or user not found)
    if ($id) {
        http_response_code(404); // Not Found
        echo "User not found";
    } else {
        echo "No data found in the table.";
    }
}

// Close connections
$conn->close();

// Close prepared statement (if used)
if (isset($stmt)) {
    $stmt->close();
}
