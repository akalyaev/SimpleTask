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
      $('.stories .story').removeClass('hidden').addClass('visible');
    else
      $('.stories .story:not(.status-' + status + ')').removeClass('visible').addClass('hidden');
      $('.stories .story.status-' + status).removeClass('hidden').addClass('visible');

  $('.developers .developer a').click ->
    user_cls = $(this).attr('rel');
    $('.stories .story:not(.' + user_cls + ')').removeClass('visible').addClass('hidden');
    $('.stories .story.' + user_cls).removeClass('hidden').addClass('visible');