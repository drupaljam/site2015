
$(document).ready ->
  setup = ->
    $('.speakers').each ->
      $(this).find('.speaker-inner').css('height', 'auto');
      $(this).equalize({children: '.speaker-inner', equalize: 'outerHeight'})

  $(window).on('load resize', setup)
  setup()
  return