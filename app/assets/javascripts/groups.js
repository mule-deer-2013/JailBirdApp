function draggingContacts(){
  var drag = $('.drag').parent()
  $(drag).draggable({ helper: "clone" })
}

function droppingContacts($elem){
  $elem.droppable({
    drop: function(event, ui){
      var groupId = $(this).attr('id')
      var contactId = { contact_ids : ui.draggable.attr('id') }
      $.ajax({
        url: 'groups/dragging_update',
        type: 'post',
        data: { id : groupId, group : contactId },
        dataType: "json"
      })
    }
  })
}
