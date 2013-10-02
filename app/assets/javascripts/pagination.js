function page (e) {
		e.preventDefault();
		$('#groups_paginate').animate({ "left": "-=50px" }, "slow" );
		var link = $(this).parent().attr("href")
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
	.done(function(response) {
		console.log(response)
		$('#groups_paginate').html(response);
	})
}


