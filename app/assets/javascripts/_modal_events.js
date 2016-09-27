var showModalBinding;
showModalBinding = function(e) {
  $('#modal-image').attr('src', $(e.relatedTarget).data('src'));
  $('#modal-video').attr('src', $(e.relatedTarget).data('src'));

  $('.modal-title').text($(e.relatedTarget).data('title'));
  $('.modal-description').text($(e.relatedTarget).data('description'));
};

var videoPauseModal;
videoPauseModal = function() {
  $('video')[0].pause();
};
