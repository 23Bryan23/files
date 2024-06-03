<?php
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

function handlePostRequest() {
    // Check if it's a POST request
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $servername = "192.168.30.4";
        $username = "root";
        $password = "Bv#426G3!";
        $dbname = "groep3db";

        // Create connection
        $connection = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($connection->connect_error) {
            die("Connection failed: " . $connection->connect_error);
        }

        // Get the JSON data sent from the React form
        $json_data = file_get_contents("php://input");

        // Decode the JSON data into an associative array
        $data = json_decode($json_data, true);

        // Extract data from the array

        $dateOfBirth = $data["dateOfBirth"];
        $department = $data["department"];
        $email = $data["email"];
        $firstName = $data["firstName"];
        $gender = $data["gender"];
        $jobTitle = $data["jobTitle"];
        $lastName = $data["lastName"];
        $middleLetters = $data["middleLetters"];
        $officeplace = $data["officeplace"];
        $admin = $data["role"];

        // Prepare SQL statement to insert data into the medewekers table
        $stmt = $connection->prepare("INSERT INTO medewerkers (Geboortedatum,department,Werkmail,Voornaam,gender,Functie,Achternaam,Tussenvoegsel,Kantoorruimte,Admin) VALUES (?, ?,?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssssss", $dateOfBirth,$department,$email,$firstName,$gender,$jobTitle,$lastName,$middleLetters,$officeplace,$admin);

        // Execute the statement
        if ($stmt->execute()) {
            echo "Data inserted successfully";
        } else {
            echo "Error: " . $stmt->error;
        }

        // Close statement
        $stmt->close();

        // Close connection
        $connection->close();
    } else {
        echo "Only POST requests are allowed.";
    }
}

// Call the function to handle the POST request
handlePostRequest();