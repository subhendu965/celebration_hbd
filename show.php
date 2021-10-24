<?php

/////////set timezone//////
date_default_timezone_set("Asia/Kolkata");

//////if get variable is empty or not set redirect to index////////
if(!isset($_GET['bd_id']) || empty($_GET['bd_id'])){
    header("location:index.php");
}

////////////prepare for fetch the event///
$bd_id=trim($_GET['bd_id']);

require_once("pdo_init.php");

$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_OBJ);

$sql="SELECT * FROM bd_event WHERE bd_id = :bd_id LIMIT 1";
$stmt=$pdo->prepare($sql);
$stmt->execute(['bd_id'=>$bd_id]);

////////////send to lost if event not found/////////////
if($stmt->rowCount()<1){
    header("location:lost.html");
}

//////////fetch the event data ///////
$bd_event=$stmt->fetch();



//////////fetch static parameters///////////
$sql2="SELECT * FROM bd_static_parameters WHERE event_id = :event_id LIMIT 1";
$stmt2=$pdo->prepare($sql2);
$stmt2->execute(['event_id'=>$bd_event->bd_id]);
$static_paramaters=$stmt2->fetch();


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" id="mvpUSc" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="theme-color" content="#008cca" />
    <title>Happy Birthday <?php echo $bd_event->display_name; ?></title>

   <meta property="og:title" content="Happy Birthday <?php echo $bd_event->display_name; ?>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://celebration.riverslide.com/hbd/RUCHI/wish" />
    <meta property="og:image:type" content="image/jpeg" />
    <meta property="og:image" content="<?php echo $bd_event->global_image_url; ?>" />
   
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Bad+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sigmar+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mali:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Engagement&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="/hbd/show_style.css">
    <script src="/hbd/Card.js"></script>
    
    <script>
    let bd_id="<?php echo $_GET['bd_id'] ?>";
    </script>
</head>
<body>

<?php
////////compare the date with current//////////
if(time()<strtotime($bd_event->bday)){
    /*-------------YET TO COME SECTION------------------*/
?>
    <div id="yet_to_come">
        <!-- <div id="upperFlags"></div> -->
        <div id="centerPlace">
            <div>
                It's <?php echo $bd_event->display_name; ?>'s birthday. 
            </div>
            <div id="time_remains">DD HH:MM:SS</div>
            
        </div>
        <!-- <div id="bln_dn"></div> -->
    </div>
    <script>

        let countDownDate = new Date("<?php echo $bd_event->bday ?>").getTime();

        // Update the count down every 1 second
        let x = setInterval(()=> {

        // Get today's date and time
        let now = new Date().getTime();

        // Find the distance between now and the count down date
        let distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
       
        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        hours=hours.toString();
        if(hours.length<2)
            hours="0"+hours;

        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        minutes=minutes.toString();
        if(minutes.length<2)
            minutes="0"+minutes;
        
        let seconds = Math.floor((distance % (1000 * 60)) / 1000);
        seconds=seconds.toString();
        if(seconds.length<2)
            seconds="0"+seconds;

        // Display the result in the element with id="demo"
        let timeRemain="";
        if(days>0){
            timeRemain+=days + "D ";
        }
        timeRemain+=hours + ":"+ minutes + ":" + seconds;
        document.getElementById("time_remains").innerHTML = timeRemain;

        // If the count down is finished, write some text
        if (distance < 0) {
            clearInterval(x);
            window.location.reload();
        }
        }, 1000);

    </script>
<?php

}else{
    /*----------ALREADY SECTION----------- */
?>
    <div class="firstScreen">
        <div id="hbd_div"><div id="hbd_div1">HAPPY</div><div id="hbd_div2"> BIRTHDAY</div></div>
        <div id="hbd_name"><?php echo $bd_event->display_name;  ?></div>
        <div id="mmhrtd">Many Many Happy Returns Of The Day</div>
    </div>
    
    <div id="cardsSectionCont">
        <div id="cardsSection">
    
        </div>
    </div>

    <div id="foot_wish">
        Forgot to wish <?php echo  $bd_event->display_name; ?>? <a href="/hbd/<?php echo $bd_id ?>/wish">Wish now</a>
    </div>
     
       <div id="i_button">i</div>
       <div id="page_instruction">
        <div class="ins">
            Tap on card to make it straight.
        </div>
        <div class="ins">
            Double tap on image to view in full screen.
            In full screen mode you can zoon in or zoom out the image.
            To get out from full screen mode either tap on red cross at uper right corner or 
            double tap on the image.
        </div>
       </div>

    <script src="/hbd/show.js" defer></script>

<?php
}
?>
   
    <style>
        .firstScreen{
             background-image:linear-gradient(to bottom, transparent 60%, #c7f1ff), url('/hbd/<?php echo $static_paramaters->first_banner_image ?>');
        }
    </style> 
    
</body>
</html>