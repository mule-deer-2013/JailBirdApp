function page (e) {
	e.preventDefault();
	var link = $(this).parent().attr("href")
	var match = /\d+$/
	var pageNumber = match.exec(link)

	$.ajax({
		url: 'paginate/groups?page='+pageNumber,
    type: 'get'
	})
	.done(function(response) {
		var $thingToPass = $('#groups_paginate')
		$thingToPass.html(response);
		droppingContacts($thingToPass.find('.group'))
	});
}


