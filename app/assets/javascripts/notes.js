$(function() {
  var docId = function() {
    return $('.step_content').attr('id').split('_')[1];
  };

  $('article.content').on('click', '#add_note', function(e) {
    e.preventDefault();
    console.log('#add_note got clicked');
    if ($('#new_note').length) {
      $('#new_note').fadeToggle();
    } else {
      $.get("/documents/" + docId() + "/notes/new");
    }
  });
});
