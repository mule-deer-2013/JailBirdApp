var Welcome = {
  init: function() {
    $('.manually_import').on('click', jailbirdConfirmation);
  },

  jailbirdConfirmation: function(e) {
    e.preventDefault();
    $.ajax({
    url: '',
    type: 'get',
  })
}

$(document).ready(function() {
  Welcome.init();
})

