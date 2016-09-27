var addResourceToPlaylist;
addResourceToPlaylist = function(e) {
  e.preventDefault();

  // Append list-item component
  $('#list-medias').append(
      '<div class="list-group-item">' +
          '<input type="hidden" name="playlist[playlist_items][id][]" value=' + $(this).data('id') + '>' +
          '<input type="hidden" name="playlist[playlist_items][duration][]" value=' + $(this).data('duration') + '>' +
          '<div class="row-picture">' +
            '<img class="circle" src=' + $(this).data('img-src') + ' alt="icon">' +
          '</div>' +
          '<div class="row-content">' +
            '<div class="least-content">' +
              '<a href="" class="remove-resource-from-playlist" ' +
                  'data-duration=' + $(this).data('duration') + '>' +
                '<i class="material-icons">clear</i>' +
              '</a>' +
            '</div>' +
            '<h4 class="list-group-item-heading">' + $(this).data('title') + '</h4>' +
            '<p class="list-group-item-text">' +
              '<b>Tipo de midia:</b> ' + $(this).data('class') + '  |  ' +
              '<b>Duração:</b> ' + $(this).data('duration')  + 's' +
            '</p>' +
          '</div>' +
          '<div class="list-group-separator"></div>' +
      '</div>'
  );

  // Add element duration to total
  var duration = parseFloat(document.getElementById("total-duration").innerHTML) +
                 parseFloat($(this).data('duration'));
  $('#total-duration').html(duration.toFixed(1));

  // Close modal
  $('#playlist-modal').modal('toggle');
};
