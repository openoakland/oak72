$(document).ready (evt) ->
  $('.mobile-home .tab-3').click (evt) ->
    $('.twitter-tab').hide()
    $('.updates .status').show()
  $('.mobile-home .tab-2').click (evt) ->
    $('.twitter-tab').hide()
    $('.updates .official-reports').show()
  $('.mobile-home .tab-1').click (evt) ->
    $('.twitter-tab').hide()
    $('.updates .citizen-reports').show()
  $('ul.tw-tabs li').click (evt) ->
    $('ul.tw-tabs li').removeClass('active')
    $(evt.target).closest('li').addClass('active')
