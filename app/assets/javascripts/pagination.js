function page (e) {
	e.preventDefault();
	var link = $(this).parent().attr("href")
	var match = /\d+$/
	var pageNumber = match.exec(link)

	console.log('I was clicked!')
	$.ajax({
		url: 'paginate/groups?page='+pageNumber,
    type: 'get',
	})
	.done(function(response) {
		$('#groups_paginate').html(response);
	});
}


