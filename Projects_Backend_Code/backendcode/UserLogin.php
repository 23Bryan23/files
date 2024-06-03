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

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Read the raw POST data
    $data = file_get_contents("php://input");

    // Decode the JSON data
    $json_data = json_decode($data);

    // Check if JSON decoding was successful
    if ($json_data === null) {
        die(json_encode(["message" => "Error decoding JSON data"]));
    }

    // Extract studentNo and password from JSON data
    $studentNo = $json_data->studentNo;
    $password = $json_data->password;

    // Proceed with authentication
    if (!empty($studentNo) && !empty($password)) {
        // Sanitize inputs to prevent SQL injection
        $studentNo = mysqli_real_escape_string($connection, $studentNo);
        $password = mysqli_real_escape_string($connection, $password);

        // SQL query to check if the student number and password exist in the database
        $query = "SELECT * FROM medewerkers WHERE ID = '$studentNo' AND passwd = '$password'";

        // Perform the query
        $result = mysqli_query($connection, $query);

        // Check if there is a row returned
        if(mysqli_num_rows($result) > 0) {
            // Student number and password exist in the database
            $row = mysqli_fetch_assoc($result);

            // Generate a unique session ID
            $sessionId = uniqid();
            $_SESSION['sessionId'] = $sessionId;

            // Store user data in session variables
            $_SESSION['studentNo'] = $row['ID'];
            $_SESSION['isAdmin'] = $row['Admin'];

            // Calculate expiration time (current time + 5 hours)
            $expirationTime = date('Y-m-d H:i:s', strtotime('+5 hours'));

            // Insert session data into the sessions table
            $insertQuery = "INSERT INTO sessions (session_id, user_id, expiration_time) VALUES ('$sessionId', '$studentNo', '$expirationTime')";
            mysqli_query($connection, $insertQuery);

            $responseData = [
                "success" => true, // Indicate successful authentication
                "sessionId" => $sessionId,  // Include the generated session ID
                "userId" => $studentNo,
                "isAdmin" => $row['Admin'],  // Include admin status
            ];

            // Encode response data as JSON
            $jsonResponse = json_encode($responseData);

            // Echo the JSON response
            echo $jsonResponse;

            exit();
        } else {
            // Student number and/or password do not exist in the database
            $responseData = [
                "success" => false,
                "message" => "Authenticatie mislukt. Ongeldig studentnummer of wachtwoord."
            ];

            echo json_encode($responseData);
        }
    } else {
        $responseData = [
            "success" => false,
            "message" => "Invalid studentNo or password"
        ];

        echo json_encode($responseData);
    }
} else {
    // Handle invalid request method
    echo json_encode(["message" => "Invalid request method"]);
}

// Close the database connection
mysqli_close($connection);