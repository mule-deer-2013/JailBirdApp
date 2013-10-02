$(document).ready(function(){

$('#groups_paginate').on('click', '.pager .next', function(e){
	e.preventDefault();
	var link = $(this).attr("href")
	var match = /\d+$/
	var pageNumber = match.exec(link)

	console.log('I was clicked!')
	$.ajax({
		url: 'paginate/groups?page='+pageNumber,
    type: 'get',
	})
	.done(function(response) {
		console.log(response)
		$('#groups_paginate').html(response);
	})
})

// function editContact(e){
//   e.preventDefault()
//   $.ajax({
//     url: 'contacts/'+$(this).attr('id')+'/edit',
//     type: 'get',
//   })
//   .done(function(response) {
//     $('#modalBox').append(response);
//   })
//   $('#modalBox').trigger('openModal')
// }

});