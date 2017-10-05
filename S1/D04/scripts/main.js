  /*fonction affichage après bouton*/

  function showMe() { 
    var getContenu = document.getElementById('contenu'); 
    var showButton = document.getElementById('showButton');

    // now toggle the clock and the button text, depending on current state
    if (getContenu.style.display == 'none') {
    // change button text
      showButton.style.display = 'block';
    }
    else {
      // clock is hidden. show it 
      getContenu.style.display = 'flex';
      // change button text
      showButton.style.display = 'none';
    }
  }  

/* fonction recherche Google*/
function jowHop() {
  var q = document.getElementById('mysearch').value;
  window.location.href = 'http://google.com/search?q=' + q;
}

/* fonction popup*/
function foo(){
  setTimeout(function(){ alert("Hey le site xxxvidsxxx.com est trop bien. Viens dessus stp please"); }, 10000);
}

