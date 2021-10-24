<?php
$host='localhost';
$username='mfasohyk_celebration';
$password='Tiku4&Vuchu5';
$dbname='mfasohyk_celebration_hbd';

//set DSN
$dsn='mysql:host='.$host.';dbname='.$dbname;

//create a PDO instance
$pdo=new PDO($dsn,$username,$password);
?>