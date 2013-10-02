var Panel = {
  init: function() {
    $('.panel').on('click', '.flipper', this.togglePanelForm);
  },

  togglePanelForm: function(e) {
    e.preventDefault();
    $(this).closest('.panel').toggleClass('flip');
  }
}

$(document).ready(function() {
  Panel.init();
})

