

function getPinPage (e) {
  e.preventDefault();
  $.ajax({
    url: '/start/jailbird',
    type: 'get'
  })
  .done(function(r) {
    $('#start').html(r);
  })
}

function getMainApp (e) {
  e.preventDefault();
  $.ajax({
    url: this.action,
    type: 'POST',
    data: $(this).serialize()
  })
  .done(function(r) {
    $(document).html(r);
  })
}
