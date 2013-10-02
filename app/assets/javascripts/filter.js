$.expr[':'].Contains = function(a,i,m){
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
};

function filterStuff () {
  var query = $(this).val().toLowerCase()

  if (filter) {
    $(this).parent().find(".contact:not(:Contains(" + query + "))").fadeOut(100);
    $(this).parent().find(".contact:Contains(" + query + ")").fadeIn(100)
  } 
  else {
    $(this).parent().find(".contact").fadeIn();
  }  
}


