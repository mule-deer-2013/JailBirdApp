// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require_tree .

function modalStarter() {
$('#modalBox').easyModal({
    overlay: 0.9,
    onClose: function(myModal){
      $(myModal).html('');
    }
  });
}



function setListeners(){
  $('.errors').delay( 1600 ).fadeOut( 1000 );
  $('.notice').delay( 1600 ).fadeOut( 1000 );
  $('.alert').delay( 1600 ).fadeOut( 1000 );
  $('#new_group').on('click', newGroup)
  $('#new_contact').on('click', newContact)
  $('#contacts .contact').on('click', editContact)
  $('#groups_paginate').on('click', "#groups .group", showGroup)
  $('#groups_paginate').on('click', 'img', page)
  $('#groups_paginate').on('ajax:complete', droppingContacts)
  $('#filter').on('keyup change', filterStuff)
  $('#modalBox').on('keyup change', '#filter', filterNames)
  $('.group').on('click', showGroup)
  $('#start input[type=submit]').on('click', getPinPage)
  $('#start').on('submit', '#new_user', getMainApp)
  $('#import_container').on('click', 'div.import', selectContact)
  $('#import_container').on('click', '.import_button', addContacts)
  $('.group a').fitText(1.2, { minFontSize: '20px', maxFontSize: '40px' })
  $('.contact .name').fitText(1.2, { minFontSize: '15px', maxFontSize: '40px' })
  $('#error_explanation ul').hide().delay(600).slideDown(300)
  $('#modalBox').on('click', 'a', editGroup)
  modalStarter();
  draggingContacts($('.group'))
  droppingContacts() 

}

$(document).ready(function(){
  setListeners();
})
