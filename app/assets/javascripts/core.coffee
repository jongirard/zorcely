$(document).ready ->
  setHeight = ->
  windowHeight = $(window).innerHeight()
  $('.hero-image').css 'height', windowHeight
  $('.hero-bg').css 'height', windowHeight
  return

$(window).resize ->
  setHeight()
  return
