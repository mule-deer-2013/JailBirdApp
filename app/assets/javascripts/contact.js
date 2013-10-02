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


