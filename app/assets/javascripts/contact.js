function showGroup(e){
  e.preventDefault()
  $.ajax({
    url: 'groups/'+$(this).attr('id'),
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
  $('.contact').on('click', editContact)
  $('.group').on('click', showGroup)
}

$(document).ready(function(){
  $('#modalBox').easyModal({
    overlay: 0.9,
    onClose: function(myModal){
      $(myModal).html('');
    }

  });
  setListeners()
})
