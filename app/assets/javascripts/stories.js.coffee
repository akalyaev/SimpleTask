# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#comment_add_btn').click ->
    $(this).hide();
    $('#comment_add_form').show();

  $('.statuses .status a').click ->
    status_elt = $(this).parent();
    status_elt.siblings('.selected').removeClass('selected');
    status_elt.addClass('selected');

    status = $(this).attr('rel');
    if status is 'all'
      $('.stories .story').show();
    else
      $('.stories .story:not(.status-' + status + ')').hide();
      $('.stories .story.status-' + status).show();