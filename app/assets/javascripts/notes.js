$(function() {
  $addNote = $('#add_note');

  var docId = function() {
    return $('.step_content').attr('id').split('_')[1];
  };

  $addNote.click(function(e) {
    e.preventDefault();
    if ($('#new_note').length) {
      $('#new_note').fadeToggle();
    } else {
      $.get("/documents/" + docId() + "/notes/new");
    }
  });
});
