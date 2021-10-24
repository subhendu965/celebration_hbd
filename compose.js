

function nextPage(from,to){
    document.getElementById("screen_pkgb6_"+from).style.transform="scale(0,0)";
    document.getElementById("screen_pkgb6_"+from).style.opacity="0";

    document.getElementById("screen_pkgb6_"+to).style.transform="scale(1,1)";
    document.getElementById("screen_pkgb6_"+to).style.opacity="1";
}

function uploadFileChanged(obj){
    if(obj.files.length>0){
        let nn=obj.files[0].name;
        if(nn.length>20){
            nn=nn.substring(0,20)+"...";
        }
        document.getElementById("uploadBtnText").innerHTML = "<b>File: </b>"+nn;
    }else{
        document.getElementById("uploadBtnText").innerHTML = "Attach Photo / Video / Audio";
    }
    
}

function viewCard(){
    createCard();
    nextPage(2,3);
}

function createCard(){
    // console.log(document.getElementById("wish_media_4758l").files)
    let message=document.getElementById("wish_msg_596l").value || "";
    let from=document.getElementById("wish_from_4178l").value || "";

    let oFReader = new FileReader();

    let mediaType;
    
    if(document.getElementById("wish_media_4758l").files.length>0){
        mediaType=document.getElementById("wish_media_4758l").files[0].type.substr(0,5);
        oFReader.readAsDataURL(document.getElementById("wish_media_4758l").files[0]);
        oFReader.onload = (oFREvent)=> {
            // document.getElementById("uploadPreview").src = oFREvent.target.result;
        
            let obj={
                message:message,
                url:oFREvent.target.result,
                mediaType:mediaType,
                wish_from:from
            };

            let cardViewArea=document.getElementById("cardViewArea");
            let card=new Card(obj,"create");
            cardViewArea.innerHTML="";
            cardViewArea.appendChild(card);
        
            
        };
    }else{
        let obj={
            message:message,
            url:"",
            mediaType:"",
            wish_from:from
        };

        let cardViewArea=document.getElementById("cardViewArea");
        let card=new Card(obj);
        cardViewArea.innerHTML="";
        cardViewArea.appendChild(card);
    }   

}

document.getElementById("screen_pkgb6_1").style.transform="scale(1,1)";
document.getElementById("screen_pkgb6_1").style.opacity="1";
