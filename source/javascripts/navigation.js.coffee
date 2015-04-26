$(document).ready ->
  unless $('html').hasClass('history')
    return 
  unless $('h1[id]').length > 0
    return

  run = ->
    position = $(window).scrollTop()
    
    h = ''
    h1s = $('h1[id]').each ->
      o = $(this).offset().top - 20
      if o <= position
        h = $(this).attr('id')
    
    if (h == '')
      history.replaceState({}, '', window.location.pathname)
    else
      history.replaceState({}, '', "#{window.location.pathname}##{h}")

    return

  $(window).scroll run

  return