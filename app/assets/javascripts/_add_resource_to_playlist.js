var addResourceToPlaylist;
addResourceToPlaylist = function(e) {
  e.preventDefault();

  $('#list-medias').append(
      '<div id=' + $(this).data('id') + ' class="list-group-item">' +
          '<div class="row-picture">' +
            '<img class="circle" src=' + $(this).data('img-src') + ' alt="icon">' +
          '</div>' +
          '<div class="row-content">' +
            '<div class="least-content">' +
              '<a href="" class="remove-resource-from-playlist" data-id=' + $(this).data('id') + '>' +
                '<i class="material-icons">clear</i>' +
              '</a>' +
            '</div>' +
            '<h4 class="list-group-item-heading">' + $(this).data('title') + '</h4>' +
            '<p class="list-group-item-text">' +
              '<b>Tipo de midia:</b> ' + $(this).data('class') + '  |  ' +
              '<b>Duração:</b> ' + '10s' +
            '</p>' +
          '</div>' +
          '<div class="list-group-separator"></div>' +
      '</div>'
  );

  $('.remove-resource-from-playlist').click(removeResourceFromPlaylist);
  $('#playlist-modal').modal('toggle');
};
