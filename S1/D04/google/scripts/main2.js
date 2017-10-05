  /*fonction affichage après bouton*/

  function showMe() { 
    // get the clock 
    var getContenu = document.getElementById('contenu');

    // get the current value of the clock's display property 
    var displaySetting = getContenu.style.display;

    // also get the clock button, so we can change what it says 
    var showButton = document.getElementById('showButton');

    var displayButton = showButton.style.display;

				
    // now toggle the clock and the button text, depending on current state
    if (displaySetting == 'none') { 
      // clock is visible. hide it
      getContenu.style.display = 'none';
      // change button text
      showButton.style.display = 'block';
    }
    else { 
      // clock is hidden. show it 
      getContenu.style.display = 'flex';
      // change button text
      showButton.style.display= 'none';
    }
  }  

/* fonction recherche Google*/


function jowHop() {
var q = "Testing google search";
window.location('http://google.com/search?q='+q);
}

/*var q = "Testing google search";
document.getElementById('bouton1').onclick = function() {
    window.open('http://google.com/search?q='+q);
};*/


