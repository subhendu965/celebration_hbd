// greets=[
//     {
//         message:"",
//         media:{
//             image:[{
//                 caption:"",
//                 url:""
//             }],
//             audio:[{
//                 caption:"",
//                 url:""
//             }],
//             video:[{
//                 caption:"",
//                 url:""
//             }]
//         },
//         from:""
//     }
// ];


let cardsSection=document.getElementById("cardsSection");

//////fetching data from server////////////
let request = new XMLHttpRequest();
//console.log(bd_id);
request.open("GET","/hbd/fetchcards.php?bd_id="+bd_id,true);

request.onreadystatechange=()=>{
    
    if(request.readyState==4 && request.status==200){

        let greets=[];

        // console.log(request.responseText);

        greets=JSON.parse(request.responseText);
        
        console.log(greets);

        let allCards=document.createElement("div");
        allCards.classList.add("allCards");
        cardsSection.innerHTML="";
        cardsSection.appendChild(allCards);

        if(greets.length>0){
            for(let i=0;i<greets.length;i++){
                let card=new Card(greets[i]);
                allCards.appendChild(card);
            }

        }else{
            cardsSection.innerHTML="No birthday card found!";
        }

        
    }
}
request.send();


cardsSection.innerHTML="Loading Birthday Cards ... "

let ib=document.getElementById("i_button");
let insShown=false;
ib.addEventListener("click",()=>{
    let ins=document.getElementById("i_button");
    let ibut=document.getElementById("page_instruction");
    // if(insShown){
    //     ins.style.transform="scale(1,0)";

    // }else{
    //     ins.style.transform="scale(1,1)";
    // }
    // insShown=!insShown;
    ins.classList.toggle("showInstrions");
    ibut.classList.toggle("showInstrions");
},false);