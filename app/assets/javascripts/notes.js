$(function() {
  $addNote = $('#add_note');
  $noteForm = $('#new_note');
  $save = $('#save_note');

  $noteForm.hide();

  $addNote.click(function(e) {
    e.preventDefault();
    $noteForm.toggle("fast");
  });

  $save.click(function() {
    $noteForm.hide("fast")
  });
});
