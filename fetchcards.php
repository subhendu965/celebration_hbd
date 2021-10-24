<?php

//////if get variable is empty or not set redirect to index////////
if(!isset($_GET['bd_id']) || empty($_GET['bd_id'])){
    die("Invalid event id found.");
}

////////////prepare for fetch the event///
$bd_id=trim($_GET['bd_id']);

require_once('pdo_init.php');

$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_OBJ);

$sql="SELECT * FROM bd_wish WHERE event_id = :bd_id ORDER BY priority DESC, datetime ASC";

$stmt=$pdo->prepare($sql);
$stmt->execute(['bd_id'=>$bd_id]);

$cards=$stmt->fetchAll();

// print_r($stmt->errorInfo());

echo json_encode($cards);


?>