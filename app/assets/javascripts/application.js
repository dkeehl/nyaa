// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-select
//= require ghostdown
//= require_tree .

$(document).on('change', ':file', function() {
  var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');

  input.trigger('fileselect', [numFiles, label]);
});

$(document).ready(function() {
  var dropZone = $('#upload-drop-zone'),
      fileWarning = $('<div/>').html('Invalid file selected. Please select a torrent file.')
      .css({  id: 'file-warning', class: 'alert alert-warning text-center',
      role: 'alert', width: $('.form-group:first').width() + 'px' })
      .hide().insertAfter(dropZone);

  $(':file').on('fileselect', function(event, numFiles, label) {
    var input = $(this).parent().prev().find(':text'),
        log = numFiles > 1 ? numFiles + ' files selected' : label;

    if (label.endsWith('.torrent')) {
      fileWarning.fadeOut('fast');
    } else {
      fileWarning.fadeIn('fast');
      input.val('');
      return false;
    }

    if (input.length) {
      input.val(log);
    } else {
      if (log) alert(log);
    }
  });

  // Drag & Drop zone for upload page
  $('body').on('dragenter', function(event) {
    event.preventDefault();
    dropZone.css({ 'visibility': 'visible', 'opacity': 1 });
  });

  dropZone.on('dragleave', function(event) {
    event.preventDefault();
    $(this).css({ 'visibility': 'hidden', 'opacity': 0 });
  });

  dropZone.on('dragover', function(event) {
    event.preventDefault();
  });

  dropZone.on('drop dragdrop', function(event) {
    event.preventDefault();
    var files = event.originalEvent.dataTransfer.files;
    $('#torrent_torrent_file')[0].files = files;
    $(this).css({ 'visibility': 'hidden', 'opacity': 0 });
  });

  // Collapsible file lists
  $('.torrent-file-list a.folder').click(function(e) {
    e.preventDefault();
    $(this).blur().children('i').toggleClass('fa-folder-open fa-folder');
    $(this).next().stop().slideToggle(250);
  });
});
