var WMP = {
  initialize: function() {
  }
}

$(function() {
  WMP.initialize();

  $('.add_update a').click(function() {
    $.get(this.href, function(data) {
      $('.remote_container').html(data).dialog();
    }, 'html');
    return false;
  });
});
