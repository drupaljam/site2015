get_viewport_size = ->
  e = window
  a = 'inner'

  if window.innerWidth == undefined
    a = 'client'
    e = document.documentElement || document.body

  {
    width: e["#{a}Width"],
    height: e["#{a}Height"]
  }


$(document).ready ->
  $('.program-slot:has(.program-slot-inner):has(.program-slot-expanded)').each ->
    $slot = $(this)
    $slot.addClass('clickable')

    $('.program-slot-inner', $slot).click ->
      $('.program-slot-expanded', $slot).fadeIn()
      $('body').addClass('slot-open')
      false

    $('.program-slot-expanded', $slot).click ->
      $('.program-slot-expanded', $slot).fadeOut()
      $('body').removeClass('slot-open')
      false

  $(document).keyup (e) ->
    if e.keyCode == 27
      $('.program-slot:has(.program-slot-inner) .program-slot-expanded').fadeOut()
      $('body').removeClass('slot-open')

  resize = ->
    $('.program-wrapper, section').css('max-width', get_viewport_size().width)

  $(window).on('load resize', resize)
  resize()
  return
  