$.expr[':'].Contains = function(a,i,m){
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
};

function filterStuff () {
  var query = $(this).val().toLowerCase()

  if (filter) {
    $(this).parent().find(".contact:not(:Contains(" + query + "))").fadeOut(400);
    $(this).parent().find(".contact:Contains(" + query + ")").fadeIn(400)
  } 
  else {
    $(this).parent().find(".contact").fadeIn();
  }  
}

function filterNames () {
  var query = $(this).val().toLowerCase()

  if (filter) {
    $(this).parent().find(".new_group_name:not(:Contains(" + query + "))").fadeOut(400);
    $(this).parent().find(".new_group_name:Contains(" + query + ")").fadeIn(400)
  } 
  else {
    $(this).parent().find(".new_group_name").fadeIn();
  }  
}


