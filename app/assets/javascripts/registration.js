var Panel = {
  init: function() {
    $('.panel').on('click', '.flipper', this.togglePanelForm);
  },

  togglePanelForm: function(e) {
    e.preventDefault();
    console.log(this)
    $(this).closest('.panel').toggleClass('flip');
  }
}

$(document).ready(function() {
  Panel.init();
})

