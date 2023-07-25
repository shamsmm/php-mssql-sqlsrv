<?php
// Uncomment line below to test errors showing in development container
//print_r($kokowawa);

// Change to correct host if you are not following the example given in docker-compose[.dev].yml or not using docker at all
$serverName = "mssql:1443";

// Change this password to match correct value
$password = 'C0MPL3X_P@ssW0RD_F0R_MSSQL_TO_ACCEPt';

$env_file_path = realpath(__DIR__ . '/.env');

$connectionInfo = [
    "Database" => "master",
    "UID" => "sa",
    "PWD" => $password
];

$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn ) {
    echo "Connection established.<br />";

} else {
    echo "Connection could not be established.<br />";

    die( print_r( sqlsrv_errors(), true));
}