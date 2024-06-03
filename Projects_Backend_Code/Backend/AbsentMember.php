<?php
header('Access-Control-Allow-Origin: http://localhost:5174');
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
// Database connection parameters
$servername = "192.168.30.4";
$username = "root";
$password = "Bv#426G3!";
$database = "groep3db";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get JSON data from POST request
$json_data = file_get_contents('php://input');

// Decode JSON data
$data = json_decode($json_data, true);

// Prepare SQL statement to check if the ID exists
$check_sql = "SELECT COUNT(*) as count FROM medewerkers WHERE ID = ?";
$check_stmt = $conn->prepare($check_sql);
$check_stmt->bind_param("i", $data['ID']);
$check_stmt->execute();
$check_result = $check_stmt->get_result();
$exists = $check_result->fetch_assoc()['count'];

if ($exists) {
    // Prepare SQL statement to insert into projecttijd table
    $sql = "INSERT INTO projecttijd (MedewerkerId, Projectnaam, absentRede) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    
    // Bind parameters
    $stmt->bind_param("iss", $data['ID'], $data['HadToDoProjectnaam'], $data['absentRede']);
    
    // Execute SQL statement
    if ($stmt->execute()) {
        $response = array("success" => true,"message" => "succesvol ingevoegd");
        echo json_encode($response);
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    // Close statement
    $stmt->close();
} else {
    echo json_encode(array("success" => false, "message" => "Werknemers-ID is fout", "nothing" => true));
}

// Close check statement
$check_stmt->close();

// Close connection
$conn->close();