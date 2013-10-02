function editGroup(e){
  e.preventDefault()
  $.ajax({
    url: 'groups/'+$(this).parent().attr('id')+'/edit',
    type: 'get',
  })
  .done(function(response) {
    $('#modalBox').append(response);
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
  $('#new_group').on('click', newGroup)
  $('#new_contact').on('click', newContact)
  $('#contacts .contact').on('click', editContact)
  $('#groups a').on('click', editGroup)
  $('#import_container').on('click', 'div.import', selectContact)
  $('#import_container').on('click', '.import_button', addContacts)
}

$(document).ready(function(){
  $('#modalBox').easyModal();
  setListeners()
})
