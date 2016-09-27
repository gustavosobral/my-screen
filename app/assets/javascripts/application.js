// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks

//= require bootstrap-material-design/material
//= require bootstrap-material-design/ripples
//= require plyr/dist/plyr
//= require Sortable/Sortable

//= require _toggle_full_screen
//= require _add_resource_to_playlist
//= require _remove_resource_from_playlist

// Functions
showModalBinding = function(e) {
  $('#modal-image').attr('src', $(e.relatedTarget).data('src'));
  $('#modal-video').attr('src', $(e.relatedTarget).data('src'));

  $('.modal-title').text($(e.relatedTarget).data('title'));
  $('.modal-description').text($(e.relatedTarget).data('description'));
};

videoPauseModal = function() {
  $('video')[0].pause();
};

var ready;
ready = function() {
  // Initialize Material and Plyr
  $.material.init();
  plyr.setup();

  // Tooltip configuration
  $('[data-toggle="tooltip"]').tooltip({ delay: { "show": 600, "hide": 100 } });

  // Gallery modal events
  $('#gallery-modal').on('show.bs.modal', showModalBinding);
  $('#gallery-modal').on('hidden.bs.modal', videoPauseModal);

  $('.toggle-fullscreen').click(toggleFullScreen);
  $('.add-resource-to-playlist').click(addResourceToPlaylist);
  $(document).on('click', '.remove-resource-from-playlist', removeResourceFromPlaylist);

  var listMedias = document.getElementById('list-medias');
  Sortable.create(listMedias, {
    animation: 200
  });
};

$(document).on('turbolinks:load', ready);
