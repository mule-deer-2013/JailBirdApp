function showGroup(e){
  e.preventDefault()
  $.ajax({
    url: 'groups/'+$(this).attr('id'),
    type: 'get'
  })
  .done(function(response) {
    $('#modalBox').html(response);
  })
  $('#modalBox').trigger('openModal')
}

function editContact(e){
  e.preventDefault()
  $.ajax({
    url: 'contacts/'+$(this).attr('id')+'/edit',
    type: 'get',
  })
  .done(function(response) {
    $('#modalBox').append(response);
  })
  $('#modalBox').trigger('openModal')
}

function newContact(e){
  e.preventDefault()
  $.ajax({
    url: 'contacts/new',
    type: 'get',
  })
  .done(function(response) {
    $('#modalBox').append(response);
  })
  $('#modalBox').trigger('openModal')
}

function newGroup(e){
  e.preventDefault()
  $.ajax({
    url: 'groups/new',
    type: 'get',
  })
  .done(function(response) {
    $('#modalBox').append(response);
  })
  $('#modalBox').trigger('openModal')
}

/////////////////////////////////////////

function setListeners(){
  $('.errors').delay( 2000 ).fadeOut( 1000 );
  $('.notice').delay( 2000 ).fadeOut( 1000 );
  $('.alert').delay( 2000 ).fadeOut( 1000 );
  $('#new_group').on('click', newGroup)
  $('#new_contact').on('click', newContact)
  $('#contacts .contact').on('click', editContact)
  $('#groups_paginate').on('click', "#groups .group a", showGroup)
  $('#groups_paginate').on('click', 'img', page)
  $('#filter').on('keyup change', filterStuff)
  $('.group').on('click', showGroup)
  $('#start input[type=submit]').on('click', getPinPage)
  $('#start').on('submit', '#new_user', getMainApp)
  // $('#groups a').on('click', editGroup)
  $('#import_container').on('click', 'div.import', selectContact)
  $('#import_container').on('click', '.import_button', addContacts)
  $('.group a').fitText(1.2, { minFontSize: '20px', maxFontSize: '40px' })
  $('.contact .name').fitText(1.2, { minFontSize: '15px', maxFontSize: '40px' })
}

$(document).ready(function(){
  setListeners();
  $('#modalBox').easyModal({
    overlay: 0.9,
    onClose: function(myModal){
      $(myModal).html('');
    }
  });
})
