var removeResourceFromPlaylist;
removeResourceFromPlaylist = function(e) {
  e.preventDefault();

  // Remove element
  $(this).parents().eq(2).remove();

  // Remove element duration to total
  var duration = parseFloat(document.getElementById("total-duration").innerHTML) -
                 parseFloat($(this).data('duration'));
  $('#total-duration').html(duration.toFixed(1));
};
