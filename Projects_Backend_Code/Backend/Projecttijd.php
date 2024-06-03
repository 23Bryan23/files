<?php
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Connect to your database
$servername = "192.168.30.4"; // Change this to your server name
$username = "root"; // Change this to your database username
$password = "Bv#426G3!"; // Change this to your database password
$dbname = "groep3db"; // Change this to your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get JSON data from the form
$json_data = file_get_contents('php://input');
$data = json_decode($json_data, true);

// Extract session ID from JSON data
// Extract session ID from JSON data
if (isset($data['session'])) {
    $session_id = $data['session'];
} else {
    echo "Session ID is missing.";
    exit; // Stop further execution
}

if (isset($data['aantalUren'])) {
    $aantalUren = $data['aantalUren'];
} else {
    echo "Aantal uren is missing.";
    exit; // Stop further execution
}

if (isset($data['projectnaam'])) {
    $projectnaam = $data['projectnaam'];
} else {
    echo "Projectnaam is missing.";
    exit; // Stop further execution
}

if (isset($data['omschrijvingWerkzaamheden'])) {
    $omschrijving = $data['omschrijvingWerkzaamheden'];
} else {
    echo "Omschrijving werkzaamheden is missing.";
    exit; // Stop further execution
}


// Prepare SQL statement to check if session exists
$sql = "SELECT user_id FROM sessions WHERE session_id = ?";

// Prepare and bind parameters
$stmt = $conn->prepare($sql);
if (!$stmt) {
    die("Error: " . $conn->error);
}

$stmt->bind_param("s", $session_id);

// Execute the statement
$result = $stmt->execute();

// Check if execution was successful
if (!$result) {
    die("Error: " . $stmt->error);
}

// Bind the result variable
$stmt->bind_result($userId);

// Fetch the result
$stmt->fetch();

// Check if a row was returned
if ($userId !== null) {
    // Session exists, store userId in a variable
    $medewerkerId = $userId;

    // Close the statement for SELECT query
    $stmt->close();

    // Now, insert the user ID into the projecttijd table
    $sql_insert = "INSERT INTO projecttijd (MedewerkerId, AantalGewerktUren, Projectnaam, Omschrijving) VALUES (?,?,?,?)";

    // Prepare and bind parameters for insertion
    $stmt_insert = $conn->prepare($sql_insert);
    if (!$stmt_insert) {
        die("Error: " . $conn->error);
    }

    $stmt_insert->bind_param("isss", $medewerkerId, $aantalUren, $projectnaam, $omschrijving); // Assuming MedewerkerId is an integer

    // Execute the insertion statement
    $result_insert = $stmt_insert->execute();

    // Check if insertion was successful
    if ($result_insert) {
        $response = array("success" => true, "message" => "succesvol ingevoegd");
        echo json_encode($response);
    } else {
        $response = array("success" => false, "message" => "Fout bij het invoegen van gebruikers-ID in projecttijdtabel: " . $stmt_insert->error);
        echo json_encode($response);
    }

    // Close the insertion statement
    $stmt_insert->close();
} else {
    // Session does not exist
    echo "Session not found.";
}

// Close the connection
$conn->close();