var removeResourceFromPlaylist;
removeResourceFromPlaylist = function(e) {
  e.preventDefault();

  $('#' + $(this).data('id')).remove();
};
