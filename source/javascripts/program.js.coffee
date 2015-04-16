$(document).ready ->
  $('.program-slot:has(.program-slot-inner):has(.program-slot-expanded)').each ->
    $slot = $(this)
    $slot.addClass('clickable')

    $('.program-slot-inner', $slot).click ->
      $('.program-slot-expanded', $slot).show()
      $('body').addClass('slot-open')
      false

    $('.program-slot-expanded', $slot).click ->
      $('.program-slot-expanded', $slot).hide()
      $('body').removeClass('slot-open')
      false

  $(document).keyup (e) ->
    if e.keyCode == 27
      $('.program-slot:has(.program-slot-inner) .program-slot-expanded').hide()
      $('body').removeClass('slot-open')

  