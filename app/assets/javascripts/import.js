var selectContact = function(e) {
	$(this).toggleClass('selected');
}

var addContacts = function(e) {
	e.preventDefault();
	console.log('adding imported contacts');
	var contacts = {};
	$('.contact.import.selected').each(function(i) {
		var name = $(this).find('.name').text();
		var phone_number = $(this).find('.phone_number').text();
		contacts[i] = { 'name' : name, 'phone_number' : phone_number };
	});
	var imports = {'contacts': contacts};
	$.ajax({
		url: '/contacts/import/add',
		type: 'post',
		data: imports
	}).done(function(response_data) {
		$('.import_message').html(response_data);
		$('#import_container .import_button').remove();
	}).fail(function() {
		$('.import_message').html('<span>Server error</span>');
	});
}
