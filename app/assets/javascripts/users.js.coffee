# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".user_button").bind "ajax:success", ->
    if $(this).text() is "Activ"
      $(this).removeClass()
      $(this).addClass "best_in_place act_button btn btn-primary"
    else
      $(this).removeClass()
      $(this).addClass "best_in_place act_button btn btn-danger"