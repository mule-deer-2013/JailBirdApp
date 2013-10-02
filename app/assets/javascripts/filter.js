function filterStuff (list) {
  var query = $(this).val()


  if (filter) {
    console.log(query)
    console.log(this)
    $(this).parent().find(".contact:not(:contains(" + query + ")").slideUp();
    $(this).parent().find(".contact:contains(" + query + ")").slideDown()
  } 
  else {
    $(this).parent().find(".contact").fadeIn();
  }  
}

