<?php
// Assuming you have already established a connection to your database

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

// Execute the SQL query
$query = "SELECT p.Projectnaam, SUM(p.AantalGewerktUren) AS TotalWorkedHours, d.AantalUren AS TotalProjectHours FROM projecttijd p JOIN don d ON p.Projectnaam = d.project GROUP BY p.Projectnaam, d.AantalUren";
$result = mysqli_query($connection, $query);

// Check if the query executed successfully
if (!$result) {
    die(json_encode(["message" => "Query failed: " . mysqli_error($connection)]));
}

// Prepare an array to hold the data
$data = array();

// Fetch rows from the result set and add to the data array
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

// Free the result set
mysqli_free_result($result);

// Close the database connection
mysqli_close($connection);

// Output the data in JSON format
echo json_encode($data);