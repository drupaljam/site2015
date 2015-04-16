$(document).ready ->
  $('.program-slot:has(.program-slot-inner):has(.program-slot-expanded)').each ->
    $slot = $(this)
    $slot.addClass('clickable')

    $('.program-slot-inner', $slot).click ->
      $('.program-slot-expanded', $slot).show()
      false

    $('.program-slot-expanded', $slot).click ->
      $('.program-slot-expanded', $slot).hide()
      false