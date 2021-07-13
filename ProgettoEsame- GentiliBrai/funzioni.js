var nodiDel ;
var lunghezzaArr; 
var nodiArea1;
var nodiArea2;

var nodiLB

function gestoreLoad () {
    try {
        nodiDel = document.getElementsByTagName("em");
        nodiArea1 = document.getElementsByClassName("a1");
        nodiArea2 = document.getElementsByClassName("a2");

        nodiLB = document.getElementsByClassName("HL")
    
 

        console.log(nodiArea1);
        console.log(nodiArea2);
        console.log(nodiLB);
        lunghezzaArr = nodiDel.length;
     } catch ( e ) {
        alert("gestoreLoad " + e);
        }
     }
window.onload = gestoreLoad;

function pulisci(){
    for (var i = 0; i < lunghezzaArr; i++) 
    {
        if(nodiDel[i].style.display= 'block')
        {
            nodiDel[i].style.display= 'none';
        }
    }
}

function mostra(){
    for (var i = 0; i < lunghezzaArr; i++) 
    {
        if(nodiDel[i].style.display= 'none')
        {
            nodiDel[i].style.display= 'inline';
        }
    }
}

function visualizza(id1,id2){
          
    if (document.getElementById(id1))
    {
      if(document.getElementById(id1).style.display == 'block')
        {
          document.getElementById(id1).style.display = 'none';
        }else{
          document.getElementById(id1).style.display = 'block';
                  }
                  
    }
    if (document.getElementById(id2))
    {
      if(document.getElementById(id2).style.display == 'none')
        {
          document.getElementById(id2).style.display = 'block';
        }else{
          document.getElementById(id2).style.display = 'none';
                  }
                  
    }
   
   }

