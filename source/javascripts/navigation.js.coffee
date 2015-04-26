$(document).ready ->
  unless $('html').hasClass('history')
    return

  window.getNavigationURL = ->
    return window.location.pathname

  activated = true

  window.disableNavigation = ->
    activated = false
    return
  window.enableNavigation = ->
    activated = true
    return

  unless $('h1[id]').length > 0
    return

  window.getNavigationURL = ->
    position = $(window).scrollTop()

    h = ''
    h1s = $('h1[id]').each ->
      o = $(this).offset().top - 20
      if o <= position
        h = $(this).attr('id')

    if (h == '')
      return window.location.pathname

    return "#{window.location.pathname}##{h}"

  run = ->
    if activated
      history.replaceState({}, '', window.getNavigationURL())
    return

  $(window).scroll run

  return