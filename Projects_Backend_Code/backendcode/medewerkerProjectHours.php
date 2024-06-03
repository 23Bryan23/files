<?php
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json'); // Set response content type to JSON

// Database connection details
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

// Check if 'id' parameter is provided in the URL
if (isset($_GET['id'])) {
    // Get the value of 'id' parameter
    $id = mysqli_real_escape_string($connection, $_GET['id']);

    // SQL query to fetch data for a specific user ID
    $sql = "SELECT 
                m.Voornaam,
                m.Achternaam,
                p.MedewerkerId,
                p.AantalGewerktUren,
                p.Projectnaam,
                DATE_FORMAT(p.Datum, '%Y-%m-%d') AS Datum,
                d.KlantNaam
            FROM 
                projecttijd p
            JOIN 
                medewerkers m ON p.MedewerkerId = m.ID
            JOIN 
                don d ON p.Projectnaam = d.project
            WHERE 
                p.MedewerkerId = '$id'";
} else {
    // SQL query to fetch all data
    $sql = "SELECT 
                m.Voornaam,
                m.Achternaam,
                p.MedewerkerId,
                p.AantalGewerktUren,
                p.Projectnaam,
                DATE_FORMAT(p.Datum, '%Y-%m-%d') AS Datum,
                d.KlantNaam
            FROM 
                projecttijd p
            JOIN 
                medewerkers m ON p.MedewerkerId = m.ID
            JOIN 
                don d ON p.Projectnaam = d.project";
}

// Execute the query
$result = $connection->query($sql);

$data = array();

if ($result->num_rows > 0) {
    // Fetch data and add to array
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    // Output JSON
    echo json_encode($data);
} else {
    echo json_encode(["message" => "0 results"]);
}

$connection->close();
?>