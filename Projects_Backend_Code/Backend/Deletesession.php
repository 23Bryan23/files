<?php

// Assuming you have a database connection established already
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

// Check if the request method is DELETE
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Decode the JSON data received
    $requestData = json_decode(file_get_contents('php://input'), true);

    // Check if sessionKey is set in the request data
    if (isset($requestData['sessionKey'])) {
        // Get the session key from the request data
        $sessionKey = $requestData['sessionKey'];

        // Assuming your sessions table name is 'sessions'
        $tableName = 'sessions';

        // Prepare and execute the DELETE query
        $query = "DELETE FROM $tableName WHERE session_id = ?";
        $statement = $conn->prepare($query);
        $statement->bind_param("s", $sessionKey);
        $statement->execute();

        // Check if any rows were affected
        if ($statement->affected_rows > 0) {
            // Respond with success message
            http_response_code(200);
            echo json_encode(array("message" => "Sessions associated with the session key $sessionKey have been deleted."));
        } else {
            // Respond with error message
            http_response_code(404);
            echo json_encode(array("message" => "No sessions found associated with the session key $sessionKey."));
        }
    } else {
        // Respond with error message
        http_response_code(400);
        echo json_encode(array("message" => "Invalid request data. 'sessionKey' not provided."));
    }
} else {
    // Respond with error message
    http_response_code(405);
    echo json_encode(array("message" => "Method Not Allowed. Only DELETE method is allowed for this endpoint."));
}