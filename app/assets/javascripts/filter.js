function filterStuff (list) {
  var query = $(this).val()

  if (filter) {
    $(this).parent().find(".contact:not(:contains(" + query + ")").slideUp();
    $(this).parent().find(".contact:contains(" + query + ")").slideDown()
  } 
  else {
    $(this).parent().find(".contact").fadeIn();
  }  
}

