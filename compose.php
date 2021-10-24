<?php
    /////////set timezone//////
    // date_default_timezone_set("Asia/Kolkata");

    //////if get variable is empty or not set redirect to index////////
    if(!isset($_GET['bd_id']) || empty($_GET['bd_id'])){
        header("location:index.php");
    }

    ////////////prepare for fetch the event///
    $bd_id=trim($_GET['bd_id']);
    $priority=trim($_GET['priority']);

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
    
   
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" id="mvpUSc" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="theme-color" content="#e47100" />
    <title>Greetings</title>

    <meta property="og:title" content="Create a birthday card and wish <?php echo $bd_event->display_name; ?>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://celebration.riverslide.com/hbd/RUCHI/wish" />
    <meta property="og:image:type" content="image/jpeg" />
    <meta property="og:image" content="<?php echo $bd_event->global_image_url; ?>" />
    <meta property="og:image:alt" content="A shiny red apple with a bite taken out" />
   
    
    <link href="https://fonts.googleapis.com/css2?family=Bad+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sigmar+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mali:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="/hbd/show_style.css">
    <script src="/hbd/Card.js"></script>
    <script>
    let bd_id="<?php echo $_GET['bd_id'] ?>";
    </script>
</head>
<body>
    
    <div id="global_header_kio5841">Create Birthday Card for <?php echo $bd_event->display_name;  ?> </div>
    
    <form id='wishForm'>
	<div id="screen_pkgb6_1" class="vcont785">
        <div id="yet_to_come">
            <!-- <div id="upperFlags"></div> -->
            <div id="centerPlace">
                <div>
                    It's <?php echo $bd_event->display_name; ?>'s birthday. 
                </div>
               
                <div id="time_remains">DD HH:MM:SS</div>
                <div id="jkio85mk"  onclick="nextPage(1,2)">Wish 
                <?php 
                    if($bd_event->gender=="male"){
                        echo "Him";
                    } else if($bd_event->gender=="female"){
                        echo "Her";
                    }
                ?>
                </div>
                
            </div>
            <!-- <div id="bln_dn"></div> -->
        </div>
        <script>
    
            let countDownDate = new Date("<?php echo $bd_event->bday ?>").getTime();
            
            // console.log(new Date("<?php echo $bd_event->bday ?>"));
    
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
                document.getElementById("time_remains").innerHTML="";
            }
            }, 1000);
    
        </script>    
	</div>
	<div id="screen_pkgb6_2" class="vcont785">
        
        <div id="hu4kj1">
            <div>
                    <input id="wish_from_4178l" type="text" name="name" placeholder="Your Name">
            </div>
            <div>
                <textarea id="wish_msg_596l" name="message" placeholder="Put a birthday message." rows="5"></textarea>
            </div>
            <div id="poook23">
                <label id="choose58">
                    <div id="uploadBtnText">Attach Photo / Video / Audio</div>
                    <input id="wish_media_4758l" type="file" name="media" onchange="uploadFileChanged(this)">
                </label>
            </div>
             <div id="note444">
                <b>Note:</b> <i>It is a public web app, We recommend you not to share any private, sensitive or confidential image,video or data.
                Just post something which can be shared in public. <b>Kindly upload image or audio or video below 24 MB.</b></i>
            </div>              
        </div>
        <div id="hu4kj2">
            
            <div id="viewCardbutton" onclick="viewCard()">View Card</div>
        </div>
        
        <script>
        let wishForm=document.getElementById("wishForm");
        
        wishForm.addEventListener("submit",(e)=>{
            e.preventDefault();

            document.getElementById("final_upload45_input").disabled=true;

            document.getElementById("back_to_edit775").style.display="none";
        
            let request=new XMLHttpRequest();
            request.open("POST","/hbd/upload.php",true);
            // request.setRequestHeader('Content-Type','multipart/form-data');
            request.onreadystatechange=()=>{
                if(request.readyState==4 && request.status==200){
                    console.log(request.responseText);
                    nextPage(3,4);
                    let rstext=request.responseText.trim();
                    if(rstext=="SUCCESS" || rstext=="NODATA" || rstext=="FAILS"){
                        document.getElementById("mkju478_"+rstext).style.display="block";
                    }
                    
                }
            }
        
            let nfd=new FormData(wishForm);
            nfd.append('bd_id','<?php echo $bd_id; ?>');
            nfd.append('priority','<?php echo $priority; ?>');

            request.upload.addEventListener("progress",(e)=>{
                let percent=e.lengthComputable ? (e.loaded/e.total)*100 : 0;
                percent=parseInt(percent);
                document.querySelector("#upload_progress_2554").style.width=percent+"%";
                document.querySelector("#final_upload45_input").value="Uploading "+percent+"%";
            },false);

            request.send(nfd);

            // console.log("doe")
        },false);
        </script>
        
	</div>
	<div id="screen_pkgb6_3" class="vcont785">
        <div id="cardViewArea" class="allCards">
            
        </div>
        <div id="but_cont_3_568">
            <div onclick="nextPage(3,2)" id="back_to_edit775">Back to Edit</div>
            <div id="final_upload45">
                <label>
                    <input type="submit" name="submit" id="final_upload45_input" value="Upload">
                    <div id="upload_progress_2554"></div>
                </label>
            </div>
        </div>
		

	</div>
	<div id="screen_pkgb6_4" class="vcont785">
		<div class="lastCard258" id="mkju478_SUCCESS">
            <div class="title">Thank You</div>
            <div class="body">Yor card is posted to the main board. <b>Kindly do not share the test link to <?php echo $bd_event->display_name; ?> now</b>. It is a humble request.</div>
            <div class="footer"><a href="/hbd/<?php echo $bd_id; ?>/view" class="fbutton41257">View it</a></div>

        </div>
        <div class="lastCard258" id="mkju478_FAILS">
            <div class="title">Sorry</div>
            <div class="body">There is an error ocurred. Kindly retry again.</div>
            <div class="footer"><a href="/hbd/<?php echo $bd_id; ?>/wish" class="fbutton41257">Retry Again</a></div>
        </div>
		<div class="lastCard258" id="mkju478_NODATA">
            <div class="title">No data given</div>
            <div class="body">You have to give some data input. Kindly retry again.</div>
            <div class="footer"><a href="/hbd/<?php echo $bd_id; ?>/wish" class="fbutton41257">Retry Again</a></div>
        </div>

	</div>
</form>

    <script src="/hbd/compose.js"></script>
</body>
</html>
