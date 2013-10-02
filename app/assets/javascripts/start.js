

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

