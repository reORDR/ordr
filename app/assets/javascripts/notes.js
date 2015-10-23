$(function() {
  var rootPaths = {
    'research': 'researches',
    'network': 'networks',
    'document': 'documents',
    'job_application': 'job_applications',
    'interview': 'interviews'
  };

  $('article.content').on('click', '#add_note', function(e) {
    e.preventDefault();
    var stepId = function() {
      var split = $('.step_content').attr('id').split('_');
      if (split.length == 3) {
        return [[split[0], split[1]].join('_'), split[2]];
      } else {
        return split;
      }
    };

    var step = stepId()[0];
    var id = stepId()[1];

    if ($('#new_note').length) {
      $('#new_note').fadeToggle();
    } else {
      $.get("/" + rootPaths[step] + "/" + id + "/notes/new");
    }
  });
});
