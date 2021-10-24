class Card{
    constructor(greet,mode="show"){
        this.greet=greet;
        this.shown=false;
        this.mode=mode;

        let cardDiv=document.createElement("div");
        cardDiv.classList.add("card");

        let wrapper=document.createElement("div");
        wrapper.classList.add("wrapper");

        let pinDiv=document.createElement("div");
        pinDiv.classList.add("pinDiv");
        cardDiv.appendChild(pinDiv);

        if(this.greet.mediaType && this.greet.mediaType.length > 0){
            if(this.greet.url && this.greet.url.length > 0){
                
                let prefix="/hbd/";
                if(this.mode=="create"){
                    prefix="";
                }
                
                
                let mediaDiv=document.createElement("div");
                mediaDiv.classList.add("mediaDiv");

                wrapper.appendChild(mediaDiv);

                let media;

                if(this.greet.mediaType=="video"){
                    media = document.createElement("video");
                    media.classList.add("media_video");
                    media.src=prefix+this.greet.url;
                    // media.setAttribute("autoplay","false");
                    media.setAttribute("controls","true");
                    media.setAttribute("preload","auto");
                }
                if(this.greet.mediaType=="image"){
                    media = document.createElement("div");
                    media.classList.add("media_image");
                    media.style.backgroundImage=`url(${prefix+this.greet.url})`;

                    media.ondblclick=()=>{
                        this.viewImage(prefix+this.greet.url);
                    }
                }
                if(this.greet.mediaType=="audio"){
                    media=document.createElement("audio");
                    media.classList.add("media_audio");
                    media.src=prefix+this.greet.url;
                    // media.setAttribute("autoplay","false");
                    media.setAttribute("controls","true");
                    media.setAttribute("preload","auto");

                }
                media.classList.add("media");

                mediaDiv.appendChild(media);
            }
        }

        let messageDiv=document.createElement("div");
        messageDiv.classList.add("messageDiv");

        if(this.greet.message && this.greet.message.length > 0){
            messageDiv.innerHTML=this.greet.message;  //////CHANGE this
        }else{
            messageDiv.textContent="";
        }
        wrapper.appendChild(messageDiv);

        let fromDiv=document.createElement("div");
        fromDiv.classList.add("fromDiv");

        if(this.greet.wish_from && this.greet.wish_from.length > 0){
            fromDiv.innerHTML=this.greet.wish_from; ////////////CHANGE THIS
        }else{
            fromDiv.textContent="Anonymous"

        }

        wrapper.appendChild(fromDiv);

        cardDiv.appendChild(wrapper);
        return cardDiv;
    }

    viewImage(image){
        this.createBlackWindow(image);
        // this.createMainWindow(image);
        // this.createCrossButton();

        document.getElementById("mvpUSc").setAttribute("content","width=device-width, initial-scale=1.0, user-scalable=yes");
    }

    // createMainWindow(image){
    //     let mw=document.getElementById("imgContainer");
    //     if(!mw){
    //         mw=document.createElement("div");
    //         mw.id="imgContainer";
    //         document.body.appendChild(mw);
    //     }

    //     mw.style.backgroundImage=`url(${image})`
    //     mw.addEventListener("dblclick",()=>{
    //         this.closeImage();
    //     })
        
    //     this.mainWindow=mw;
    // }
    
    createBlackWindow(image){
        let bw=document.getElementById("blackCover");
        if(!bw){
            bw=document.createElement("div");
            document.body.appendChild(bw);
            bw.id="blackCover"
        }

        bw.addEventListener("dblclick",()=>{
            this.closeImage();
        },false);

        this.blackShade=bw;

        let mw=document.getElementById("imgContainer");
        if(!mw){
            mw=document.createElement("div");
            mw.id="imgContainer";
            bw.appendChild(mw);
        }

        mw.style.backgroundImage=`url(${image})`
        mw.addEventListener("dblclick",()=>{
            this.closeImage();
        })
        
        this.mainWindow=mw;

        let cb=document.getElementById("cardCrossButton");
        if(!cb){
            cb=document.createElement("div");
            bw.appendChild(cb);
            cb.id="cardCrossButton"
        }
        cb.textContent="X";
        cb.addEventListener("click",()=>{
            this.closeImage();
        },false);

        this.cardCrossButton=cb;
        
    }
    // createCrossButton(){
    //     let cb=document.getElementById("cardCrossButton");
    //     if(!cb){
    //         cb=document.createElement("div");
    //         document.body.appendChild(cb);
    //         cb.id="cardCrossButton"
    //     }
    //     cb.textContent="X";
    //     cb.addEventListener("click",()=>{
    //         this.closeImage();
    //     },false);

    //     this.cardCrossButton=cb;
    // }
    closeImage(){
        // ////remove main form
        // let mw=document.getElementById("imgContainer");
        // if(mw){
        //     mw.parentNode.removeChild(mw);
        // }
        ///remove black window
        let bw=document.getElementById("blackCover");
        if(bw){
            bw.parentNode.removeChild(bw);
        }

        document.getElementById("mvpUSc").setAttribute("content","width=device-width, initial-scale=1.0, user-scalable=no");
        
        // ///remove cross button
        // let cb=document.getElementById("cardCrossButton");
        // if(cb){
        //     cb.parentNode.removeChild(cb);
        // }

    }

}