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
    url: '/users',
    type: 'POST',
    data: $(this).serialize()
  })
  .done(function(r) {
    $('body').html(r)
  })
}
