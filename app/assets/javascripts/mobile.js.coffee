# Accommodate design changes that flip the ordering of divs in the top section of the page
switch_divs = ->
  parent = $('.myrow')

  if $(document).width() < 960
    # If the explainer is at the top, move it down
    if $(parent.children()[0]).hasClass 'explain-text'
      explainer = parent.find '.explain-text'
      parent.detach '.explain-text'
      parent.append explainer
  else
    if $(parent.children()[0]).hasClass 'hero'
      hero = parent.find '.hero'
      parent.detach '.hero'
      parent.append hero
  
$(document).ready ->
  switch_divs()
$(window).resize ->
  switch_divs()
