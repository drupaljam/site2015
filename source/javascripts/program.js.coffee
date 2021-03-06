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
  history_enabled = $('html').hasClass('history')

  $('.program-slot:has(.program-slot-inner):has(.program-slot-expanded)').each ->
    $slot = $(this)
    $slot.addClass('clickable')

    $('.program-slot-inner', $slot).click ->
      $('.program-slot-expanded', $slot).fadeIn()
      $('body').addClass('slot-open')
      if history_enabled
        history.replaceState({}, '', "#{window.location.pathname}##{$slot.attr('data-hash')}")
      false

    $('.program-slot-expanded', $slot).click ->
      $('.program-slot-expanded', $slot).fadeOut()
      $('body').removeClass('slot-open')
      if history_enabled
        history.replaceState({}, '', window.getNavigationURL())
      false

  (->
    if window.location.hash != '' && window.location.hash.match(/^#[a-z0-9-]+$/)
      h = window.location.hash.substring(1)

      if $(".program-slot[data-hash=#{h}]").length > 0
        slot = $(".program-slot[data-hash=#{h}]").eq(0)
        if history_enabled
          window.disableNavigation()
        $(window).scrollTop($('.program-wrapper').offset().top - 30)
        $('.program').scrollLeft(slot.offset().left + $('.program').scrollLeft() - $('.program').offset().left)
        window.setTimeout(
          ->
            if history_enabled
              window.enableNavigation()
          , 100)
        slot.find('.program-slot-inner').click()
        return

    # if we get here, we don't have hash that matches a slot
    now = new Date
    start = new Date(2015, 3, 30, 9, 0, 0)
    end = new Date(2015, 3, 30, 17, 30, 0)
    
    if now >= start && now <= end
      quarters = (end - start) / 1000 / 60 / 15
      now_quarters = Math.floor((now - start) / 1000 / 60 / 15)
      width = $('.program .program-slots').eq(0).width()
      $('.program').scrollLeft(Math.floor(width / quarters * now_quarters))
  )()

  $(document).keyup (e) ->
    if e.keyCode == 27
      $('.program-slot:has(.program-slot-inner) .program-slot-expanded').fadeOut()
      $('body').removeClass('slot-open')

  resize = ->
    $('.program-wrapper, section').css('max-width', get_viewport_size().width)

  $(window).on('load resize', resize)
  resize()
  return
  