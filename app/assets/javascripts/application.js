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
//= require _modal_events
//= require _add_resource_to_playlist
//= require _remove_resource_from_playlist

// Modal events
$(document).on('show.bs.modal', '#gallery-modal', showModalBinding);
$(document).on('hidden.bs.modal', '#gallery-modal', videoPauseModal);

// Click events
$(document).on('click', '.remove-resource-from-playlist', removeResourceFromPlaylist);
$(document).on('click', '.toggle-fullscreen', toggleFullScreen);
$(document).on('click', '.add-resource-to-playlist', addResourceToPlaylist);

var ready;
ready = function() {
  // Initialize Material and Plyr
  $.material.init();
  plyr.setup();

  // Tooltip configuration
  $('[data-toggle="tooltip"]').tooltip({ delay: { "show": 600, "hide": 100 } });

  // Sortable initialization
  var listMedias = document.getElementById('list-medias');
  Sortable.create(listMedias, {
    animation: 200
  });
};

$(document).on('turbolinks:load', ready);
