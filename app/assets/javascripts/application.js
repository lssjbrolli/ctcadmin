// This is a manifest file that will be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.ro.js
//= require jquery_nested_form
//= require_tree .

$(document).ready(function () {
  $('[data-behaviour~=datepicker]').datepicker({
    format: 'yyyy-mm-dd',
    todayBtn: 'linked',
    orientation: 'top left',
    autoclose: true,
    todayHighlight: true,
  });
});

$(document).ready(function () {
  $('.alert').delay(3000).hide('fast');
});

$(document).ready(function () {
  return $('[data-provide=monthpicker]').datepicker({
    format: 'M yyyy',
    minViewMode: 1,
    discard_day: true,
    autoclose: true,
  });
});

$(document).ready(function () {
  $('#storage_modal').modal({
    keyboard: false,
    backdrop: 'static',
  });
});
