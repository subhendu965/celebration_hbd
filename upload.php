<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

//  print_r($_POST);
//  print_r($_FILES);

$wish_from="";
if(isset($_POST['name']) && !empty($_POST['name'])){
    $wish_from=trim($_POST['name']);
}

$message="";
if(isset($_POST['message']) && !empty($_POST['message'])){
    $message=trim($_POST['message']);
}

if(strlen($wish_from)==0 && strlen($message)==0 && !file_exists($_FILES['media']['tmp_name'])){
    die("NODATA");
}

require_once("pdo_init.php");
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_OBJ);

///generating wish_id
///max try 5000 times 
$count=0;
$bd_id=trim($_POST['bd_id']);
$wish_id="";

do{
    $wish_id=substr(str_shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"),0,5);

    $sql="SELECT * FROM bd_wish WHERE event_id=:wish_id AND wish_id=:wish_id";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(['event_id'=>$bd_id,'wish_id'=>$wish_id]);
    if($stmt->rowCount()<1)
        break;

    $count++;
    
}while(count<5000);

$url="";
$mediaType="";
/////move file to a permanent path
if(file_exists($_FILES['media']['tmp_name'])){    
    $info = new SplFileInfo($_FILES['media']['name']);
    $ext=$info->getExtension();
    $url="data/user_wish_data/".$bd_id."-".$wish_id.".".$ext;
    move_uploaded_file($_FILES['media']['tmp_name'],$url)|| die("error occured while moving file.");
    $mediaType=substr($_FILES['media']['type'],0,5);
}


$priority=0;
if(isset($_POST['priority']) && !empty($_POST['priority'])){
    $priority=trim($_POST['priority']);
}

///echo $priority;

////insert to db
$sql="INSERT INTO bd_wish SET event_id=:ei,wish_id=:wi,wish_from=:wf,message=:msg,url=:url,mediaType=:mt,priority=:pr";
$stmt=$pdo->prepare($sql);
if($stmt->execute(['ei'=>$bd_id,'wi'=>$wish_id,'wf'=>$wish_from,'msg'=>$message,'url'=>$url,'mt'=>$mediaType,'pr'=>$priority])){
    echo "SUCCESS";
}else{
    echo "FAILS";
}


//  print_r($_FILES);
// echo $wish_id;



?>