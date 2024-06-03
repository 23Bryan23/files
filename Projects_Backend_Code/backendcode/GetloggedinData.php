<?php
// Start session
session_start();

header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json'); // Set response content type to JSON

// Assuming you have a database connection established already
// Replace these variables with your actual database connection details
$servername = "192.168.30.4";
$username = "root";
$password = "Bv#426G3!";
$dbname = "groep3db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$connection) {
    die(json_encode(["message" => "Connection failed: " . mysqli_connect_error()]));
}

// Check if the request method is GET
if ($_SERVER["REQUEST_METHOD"] === "GET") {
    // Check if sessionId is provided in the GET request
    if(isset($_GET['sessionId'])) {
        // Retrieve sessionId from GET parameters
        $sessionId = mysqli_real_escape_string($connection, $_GET['sessionId']);

        // SQL query to check if the session ID exists in the sessions table
        $query = "SELECT * FROM sessions WHERE session_id = '$sessionId'";

        // Perform the query
        $result = mysqli_query($connection, $query);

        // Check if there is a row returned
        if(mysqli_num_rows($result) > 0) {
            // Session ID exists in the sessions table
            $row = mysqli_fetch_assoc($result);

            // Retrieve user_id from the sessions table
            $user_id = $row['user_id'];

            // Query to fetch user information from medewerkers table
            $userQuery = "SELECT * FROM medewerkers WHERE ID = '$user_id'";

            // Perform the query
            $userResult = mysqli_query($connection, $userQuery);

            // Check if there is a row returned
            if(mysqli_num_rows($userResult) > 0) {
                // User information found in the medewerkers table
                $userData = mysqli_fetch_assoc($userResult);

                // Prepare response data
                $responseData = [
                    "success" => true,
                    "user" => $userData // Include user information in the response
                ];

                // Encode response data as JSON
                $jsonResponse = json_encode($responseData);

                // Echo the JSON response
                echo $jsonResponse;

                exit();
            } else {
                // User information not found
                $responseData = [
                    "success" => false,
                    "message" => "User information not found"
                ];

                echo json_encode($responseData);
            }
        } else {
            // Session ID not found
            $responseData = [
                "success" => false,
                "message" => "Session ID not found"
            ];

            echo json_encode($responseData);
        }
    } else {
        // Session ID not provided in the GET request
        echo json_encode(["message" => "Session ID not provided"]);
    }
} else {
    // Handle invalid request method
    echo json_encode(["message" => "Invalid request method"]);
}

// Close the database connection
mysqli_close($connection);